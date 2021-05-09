# System Design

## FOCUS ON
* Remember to as preliminary questions about use cases and assumptions  .
* Difference between queue implementations.
    - pub/sub, queue, message queue, message bus, streaming events, event based
    - SQS, RabbitMQ, Kafka, NSQ, Redis...
    - Guarantees: at least once delivery, at most once delivery, exactly once delivery?
* Request/Response life cycle.
* Read-heavy vs Write-heavy systems.


## blah
* VPS vs shared hosting environment: a VPS will give you a private environment. Own copy of OS.
* ec2 is a self service of VPS machines and automated spinning up more VPS machines.
* Workers are just services or servers in the system design primers
* On a basic level, a **Distributed System** is a collection of interconnected **nodes** that share data.

## High Level Design Considerations

There are

### OSI model
Open Systems Interconnection model
* Physical Layer
* Data Link Layer
* Network Layer
* Transport Layer
* Session Layer
* Presentation Layer
* Application Layer

### ACID
* Atomic
* Consistent
* Isolation
* Durability

### Atomicity

## Consistency Patterns

### Atomic Consistency
Guarantee which values it's ok to return. The store appears to all clients as though it runs on one machine and responds to operations in the order they arrive. Basically rules out eventual consistency.

### CAP Theorem
States that it is impossible to satisfy three specific criteria for a read/write storage system distributed across an asynchronous network. Used to reason about the trade offs of a distributed system based on three criteria. This forces immediate consideration of trade offs because you can really enforce only 2 out of the 3 criteria. 

* Consistency - Every read receives the most recent write or an error.
  * If you are writing to a distributed data store and reading from that same store, how do you know that your write has propagated to the rest of the nodes in the store? You may be reading from a node that has not received the latest data.

* Availability - Every request receives a response, without guarantee that it contains the most recent data.
  * If you are writing to a distributed data store, latency may be more important than having the most recent data. Instead of guaranteeing the latest data, always return a response as fast as possible.

* Partition Tolerance - The system continues to operate without arbitrary partitioning due to network failure. Partitioning refers to a failure to deliver some or all messages between nodes. Messages or packets or whatever might be sent back and forth between nodes -- if some or all of those deliveries fail, will the system remain functional? Will it still be able to respond to requests with stale or up to date information?
  * Will the system continue to respond to requests if part of the network dies.

Networks cannot be relied on so partition tolerance (**P**) is almost always required. This leaves two options for 2 sets of guarantees:
* **CP** - consistency and partition tolerance. Requests may timeout before a response is returned. This might happen because workers are updating nodes which may not be available until all worker tasks are completed. CP is good if a use case requires atomic reads and writes (data must be correct).
* **AP** - availability and partition tolerance. Requests will not time out if a node doesn't have the most recent version of data. Node will respond with available data. There may be workers bringing all nodes to a consistent state (and will complete eventually) but the system will still respond before all nodes are consistent. Is a good choice if the use case tolerates eventual consistency.

### Fail-Over vs Replication

### System Tiers
multi tiered system - multiple layers of load balancing.

### vertical scaling
adding more physical power (CPU, RAM) to individual machines. Will eventually hit a ceiling.

### horizontal scaling
Use multiple servers to build a system **topology**.
  - problem: how to distribute requests.

Implement Horizontal Scaling by keeping identical, redundant servers that behave identically with a give request or servers  that serve different types of content (images, HTML, JS, users, etc) -- **Federation** ??

## Components of Distributed System

### CDN
Content Delivery Network. Globally distributed network of **Reverse Proxy** servers and files designed to host content from locations closer to the user making requests. Usually used to serve static files. This can improve performance in two ways: users get content from data centers closer to them, and requests for static content are offloaded from your servers to a dedicated system.

* Push CDN
* Pull CDN

### Queues

#### Message Queues

#### Task Queues

### Application Servers/Application Layer
Should be stateless -- every time a load balancer routes a users request to group of application servers, they should receive the same response regardless of which individual application instance they are routed too. **State** should not be stored in the application instance (user data, for example). That data should reside on a different server instance designed to handle that state.

Applications can be stored in images (packages containing application code and required dependencies) which can be cloned onto a fleet of application servers during deployment with a tool like Capistrano (scripting and deployment tool for web apps, mostly Rails prolly -- lets you run scripts on multiple servers).

### Load balancing
A type of reverse proxy that distributes traffic across a group of servers. Depending on it's selection strategy (Round Robin, Random Selection, Performance Based) decides which server to distribute requests to.
* load balancer vs router?
* How to maintain state when a LB might be redirecting you to different servers whenever you access a host?
* Can also be in a redundant mode. Two load balancers can be in `active` <-> `active` mode or `active` <-> `passive` mode.

### DNS/Caching
Domain name system. Translate host names  to IP addresses.
* A record??
* CNAME??

Round Robbin - technique of load distribution, load balancing or fault tolerance. A for a request to a given host name, an IP address is returned from a list that is cycled though by the RR technique. It's most simple implementation does not account for the type of requests -- one server could receive a majority of the computationally expensive requests because it is called at the same place in the cycle.

Caching IP addresses. A response from a DNS server can be cached with a **TTL** (time to live) value which describes the lifespan of the cached response.

#### BIND
Berkeley Internet Name Domain -- DNS software

### Sticky Sessions
User Sessions are preserved if you visit a site multiple times -- DNS/LB sends you to a different physical or virtual server.

## Fan Out
A pattern broadcasting messages to multiple listeners/subscribers in a one to many relationship. A "fan-out" is the process of sending messages from a single source to multiple destinations.

## Caching
Think of it as a key-value store in memory. Find data by key (key can be id or hashed request).

* Write Through Cache

* Write Back Cache

Two strategies for caching
1. Cache database queries. Whenever an application makes a request to the database server, hash the query and cache the result. Whenever that query is made again, use the cached result. Issues arise with invalidating the cache. If a single cell in on of the records of the cached query is mutated, the cached result must be purged and rewritten with the new request.

2. Cache objects. The results of a query from an application server are almost always transformed into objects in the application layer. Instead of cacheing the raw results of a DB query, cache the constructed object. Because you read, create, and update objects in the application code, this allows for easy disposal of out of date objects when they are updated instead of trying to deduce when a single cell in a record that might be one of many records from multiple queries that are used to assemble a single object.

Implementations:
* Memcached - in-memory cache for data and objects with the goal of speeding up dynamic websites by reducing calls to external data sources (databases/APIs). Memcached API provides very large hash table distributed across multiple machines. When the table is full, subsequent inserts cause older data to be purged in a Least Recently Used (LRU) order.

* Redis more feature rich in-memory cache than Memcached. Includes database like features like persistence and predefined data structures.
  * More robust feature set (native data structures)
  * transactional
  * can be used for pub sub



## Database Stuff
Archive tables are compressed by default.

### Postgres
* CHAR vs VARCHAR - CHAR will always be fixed width. If a column `name: CHAR(100)` is created, its values will always contain 100 characters. If a value less than 100 characters is inserted into the CHAR column, it will be padded with whitespace. `name: VARCHAR(100)` will allow for string values of varying length up to 100 characters and it's values will not be padded.


### SQL vs NoSQL
SQL DBs are relational, can do joins in the DB servers themselves but these transactions can be expensive.
NoSQL DBs will store "documents" instead of rows. You can join a user document to a order document but it must be done in the application layer instead of the DB servers.

### Replication
Automatic copies from a master DB to one or more slave DBs. Any query (including CREATE, DROP, or UPDATE clauses) made on the master DB is also made to the slave DB(s). There can be different topologies for DB replication.

* master -> slave(s)  - only one master can receive outside queries and they are replicated to the slave(s). If a master database goes down, there may be a gap in service as it takes time to promote a slave to master and the system will be unable to process queries during that time.
* master <-> master -> slave(s) - There can only multiple masters in a system. They replicate all queries against each other and to the slave(s). If a master goes down, the system can still process queries.
* master(write) -> slaves(read) you can separate replicas into read and write replicas. Write queries can go to the master database while any read operations are routed to the read replicas. There can be one or more read replicas for a master instance.

#### Synchronous Replication
A transaction on the master will not be considered complete until at least one synchronous slave updates and reports back. In Postgres, this will mean slaves listed in `synchronous_standby_names` need to report back. Versions of Postgres include ways to configure the number of responses needed and their priority.

#### Asynchronous Replication
A transaction on the master will commit even if no slave updates.

#### Stream Replication
#### Cascading Replication

#### Logical Replication
As opposed to Physical Replication? Allows for the replication of individual tables instead of requiring the whole server cluster to be replicated. Information about changes to tables is extracted from WAL logs.

#### Remastering
When a slave is promoted to master it is "remastered".

### Partitioning
Splitting up a monolithic database based on some criteria.

#### Partitioning Methods
Range
List
Hash
???

#### Sharding
A form of partitioning a database where the different pieces might be subsets of a single table (users, for example) and storing those pieces (shards) on different nodes. There are many different ways to determine how the data is split up. Using a hashing algorithm to decide which data goes where and how to route queries is a popular option.

#### Federation
1. Splitting up a monolithic database into separate domain based stores, (Users is one store, purchases another), and storing those stores on different nodes behind a unified query interface.
2. Providing a unified query interface for a heterogeneous collection of underlying storage engines and processing methods. The interface and data is also known as a _federated database_ or _polystore_. PostgreSQL's foreign data wrapper (FDW) allows for the implementation of this pattern.

## Message Queues
Message Broker vs Queue vs Stream thing?

Properties of queues and why to use one

Why FIFO is a desired property:
* Ensure that user-entered commands are executed in the right order.
* Display the correct product price by sending price modifications in the right order.
* Prevent a student from enrolling in a course before registering for an account.


### RabbitMQ
"Traditional Message Broker" originally developed to implement AMQP (Advanced Message Queuing Protocol, open standard application layer protocol developed by John O'Hara at JPMorgan Chase in 2003). Written in Erlang and now part of Pivotal.

### NSQ

### SQS
Amazon Simple Queue Service
Managed service.
High throughput.
When configured: supports FIFO (maintains order) and _exactly once processing_.
Message retention is 4 days.

### Kafka
A system optimized for writing.
Written in Scala and developed at LinkedIn.
Batch File Based Processing?
* Does not guarantee message order unless consumers are subscribed to a single topic (partition).

## Network components

### Proxy Server
A proxy outside of a specific technological context is just someone or something acting on the behalf of someone or something else. A **Forward Proxy** server is used by clients to forward their requests to another server. If computer `A` wants to make a request to computer `C`, it might be necessary (`C` has blocked `A` or `A` cannot access `C`) for `A` to make a request to `B` first which will make the request to `C` on `A`s behalf.

### Reverse Proxy
While a **Forward Proxy** is a server being used on a clients behalf, a **Reverse Proxy** is a server being used on another server's behalf. Computer `A` wants to make a request to computer `C` but `C` has been configured to not allow direct requests from clients, only requests through computer `B` are allowed. Computer `C` is "hidden" from computer `A`, `A` only sees communication with `B`. Basically a computer all traffic is directed through before it can be processed by one or more servers.

A reverse proxy may be employed to serve as a unified interface or gateway for a collection of services. A request made to a system that employs many services may be forwarded by a reverse proxy to the service that fulfills the request before the response is returned to the client.

## Network Stuff

### Network Protocols
Protocols are just agreed upon sets of rules for communication between two parties (people, machines, etc). Each party knows the rules of the protocol and how to send and respond to messages in the agreed upon way.

#### IP
Internet Protocol.
Packets. No guarantee of order.

#### TCP
Transmission Control Protocol.
Guarantees order.

#### HTTP
Hyper Text Transfer Protocol.
Request, response framework.


## Default ports
* 80 - HTTP traffic
* 443 - SSL traffic
* 22 - SSH traffic

## localhost
The "address" of the local system aka the one sitting on your lap. The default IP address for localhost is 127.0.0.1. Applications can access that address to make connections to your machine and treat it like a server.

### Redis question
In memory computing?? "Pre computing in memory"

