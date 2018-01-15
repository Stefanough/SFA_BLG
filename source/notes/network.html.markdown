---

title: Network
date: 2017-12-18 05:22 UTC
tags: 

---

**Subdomain vs Subdirectory** - For the domain `example.com`, a subdomain would be `blog.example.com` or `www.example.com`. A subdirectory would be `example.com/blog`.


**Rack** - Middleware that sits inbetween a Ruby application and an HTTP server. Rack wraps HTTP requests and environment params (HTTP request method, url information, server information, etc...) in a hash and returns an array of strings consisting of a status code, a header of key-value pairs and body.


**CDN** - Content Delivery Network. A geographically distributed network of proxy servers and their data centers which distribute service
spatially relative to end-users to provide high availability and high performance.


**ci/cd** - continuous integration / continuous delivery. The practice of very quick, iterative software development. A ci/cd pipline will consist of a series of tools which streamlines building, testing and deploying.  


**AJAX** - Asynchronous JavaScript And XML


**DOM** - Document Object Model.


**WHATWG** - Web Hypertext Application Technology Working Group. A community dedicated to evolving/maintaining HTML and related technologies.


**DHCP** - Dynamic Host Configuration Protocol


**Idempotence** - Literally means "(the quality of having) the same power", from *idem* + *potence* (same + power). A method or function is idempotent if it can be applied multiple times without changing the result beyond the initial application. For example:

  5^1 = 5

  raising a number to the power of one can be done more than once with out any changes to the original operand.

  A GET request to `users/123` is an idempotent action. A client can call this method an arbitrary number of times and with the same result as calling it once. Using an idempotent HTTP method on a resource URL should never change the resource. These are also known as safe methods.

 HTTP Method | Idempotent | Safe
|:-----------|:----------|:-------|
| OPTIONS     | Yes        | Yes     |
| GET         | Yes        | Yes     |
| HEAD        | Yes        | Yes     |
| PUT         | Yes        | No      |
| POST        | No         | No      |
| DELETE      | Yes        | No      |
| PATCH       | No         | No      |


**HTML** - Hyper Text Markup Language.


**HTML vs. HTTP** - HTML is the markup language, HTTP is the protocol.
  > HTML is inextricably bound to HTTP. HTML is the human interface of HTTP. It's therefore automatically questionable why HTML does not support all relevant methods in the HTTP specification. Why can machines PUT and DELETE resources, but humans cannot?


**Postman** - Software for constructing and manipulating HTTP requests. This is useful for populating params in the bodies of GET and PATCH requests that would normally get there data from website forms.


**ad-hoc** - An ad hoc network is a network made with out much future planning. As in a 'spur the moment' network, or one jerry-rigged from the nodes and components that happen to be around and active. Usually this means connecting devices to one another without a dedicated access point or router. Setting up a laptop as a temporary hotspot that other devices can connect to might be called setting up an ad hoc network, for example.

  > Ad hoc is a Latin phrase meaning "for this". In English, it generally signifies a solution designed for a specific problem or task, non-generalizable, and not intended to be able to be adapted to other purposes (compare with a priori).

  > Common examples are ad hoc organizations, committees, and commissions created at the national or international level for a specific task. In other fields, the term could refer, for example, to a military unit created under special circumstances, a tailor-made suit, a handcrafted network protocol, or a purpose-specific equation. - *Wikipedia*


**XML** - Extensible Markup Language


**YAML** - Yet Another Markup Language


**Website v. Webservice** - A website will deliver assets to be directly rendered by a browser (code formatted in HTML ). A webservice will deliver raw data that another program will use for something (more processing, information on how to render or what is being rendered). You may be just requesting a list of all users that can be displayed in another program, for example, instead of all the HTML code that makes up a full website.


**Single Page Application** - An SPA is a web application that renders data from multiple servers in a single application environment. Gmail, for example, is a JavaScript(?) application that doesn't really have multiple web pages in the traditional sense. It just uses an API to get raw data from Google's servers. All the rendering happens inside the application.


**URL** - Uniform Resource Locater. URLs are only one part of an HTTP request. they are only a chunk of the information that a server needs to interpret and satisfy a request.


**URI** - Uniform Resource Identifier


**URI vs. URL** -


**HTTP** - Hyper Text Transport Protocol. The client and server communicate using plain-text (ASCII) messages. (Are these just essentially strings? Is this why Rails can rip apart the HTTP requests and determine where they should be routed?) Not byte code or anything bizarre, just ASCII characters.


**HTTP Request** - A full HTTP request consists of a:
  *method* (GET, POST, etc.)
  *path* (/users/8),
  *query string* (`?loc=sf&name=bill`). The query string are just key/value pairs that appear after a question mark in a URL. The keys and values are separated by an equals sign and the pairs are separated by an ampersand (&). Query strings of GET requests appear in the url of the http request but in the body of a POST request.
  *body* - also key/value pairs. often comes from a website form (something asking for user name and password, for example). Not included in get requests.

  If I have a web application running on Rails and I make a HTTP GET request to /cats, I'll get back a bunch of cat pictures.
  > In this case, GET is the HTTP method in the request and /cats is a path.


**What Does an HTTP Request Look Like?**


**HTTP Response** - An HTTP response will include:
  *status* - A status code consists of a number and a code that tells you what happened when the server tried to process the request. `200 OK` is the status code for a successful request. `404 NOT FOUND` is the status code given when a requested resource is not found. The different status codes and their meaning are all part of the HTTP specification.

  *body* - The requested resource. Could be all the HTML necessary for rendering a webpage or just requested data (list of locations, for example).


**HTTPS** - Hyper Text Transport Protocol over SSL (or HTTP Secure, HTTP over TLS)

  > HTTP resources are identified and located on the network by uniform resource locaters (URLs), using the uniform resource identifier (URI) schemes http and https - *Wikipedia*


**MIME** - Multi-purpose Internet Mail Extensions
  > A media type (also MIME type and content type) is a two-part identifier for file formats and format contents transmitted on the Internet. - *Wikipedia*

  > MIME types form a standard way of classifying file types on the Internet. Internet programs such as Web servers and browsers all have a list of MIME types, so that they can transfer files of the same type in the same way, no matter what operating system they are working in.  
  A MIME type has two parts: a type and a subtype. They are separated by a slash (/). For example, the MIME type for Microsoft Word files is application and the subtype is msword. Together, the complete MIME type is application/msword.


**port**


**HTTP Session**


**HTTP Request Methods** - Browsers can only handle GET and POST methods. Rails lets us work around this with 'hidden' inputs.

* *GET* - Query string of a GET request is sent in the url of the http request.
* *HEAD*
* *POST* - Query string of a POST request is sent in the body of the http request.
* *PUT* - PUT is typically used if an object is being replaced entirely (replacing Dune with Pride and Prejudice in a library for example)
* *PATCH* - PATCH is typically used to update some attributes of an existing object.
* *DELETE*
* *TRACE*
* *OPTIONS*
* *CONNECT*


**HTTP Session State**


**Stateless Protocol**  


**Routing**


**IPv4**


**IPv6**


**TCP**


