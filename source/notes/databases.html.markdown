---

title: Databases
date: 2017-12-18 03:44 UTC
tags: 

---


**JOIN** - Also known as a `SIMPLE JOIN` or `INNER JOIN`? An SQL INNER JOIN returns all rows from multiple tables where the join condition is met.


**Inner JOIN***- See `JOIN`

**Outer JOIN** -

**Left JOIN** -

**Right JOIN** -

**Self JOIN** - When two instances of the same table are joined. The instances must be distinguishable from one another so their attributes are not ambiguous.


**COALESCE** -


**Aggregate Functions** - The aggregate functions MAX(), MIN(), AVG(), SUM(), COUNT() perform operations over all rows in a group. If these are mixed with non-aggregate columns in a query, then there must be explicit grouping. I think the non-aggregate columns are the ones that need to be in the GROUP BY clause.


**GROUP BY** - In a GROUP BY statement only distinct values are shown for the column in the GROUP BY.


**CASE** - CASE allows you to return different values under different conditions.

```sql
SELECT name, population
      ,CASE WHEN population<1000000
            THEN 'small'
            WHEN population<10000000
            THEN 'medium'
            ELSE 'large'
       END AS size
  FROM bbc
```


**NULL** - NULL or Null (sometimes represented by the symbol ω) is a special marker used in SQL to show that a data value does not exist in the database.
Since Null is not a member of any data domain, it is not considered a "value", but rather a marker (or placeholder) indicating the absence of value. Because of this, comparisons with Null can never result in either True or False, but always in a third logical result, Unknown.[8] The logical result of the expression below, which compares the value 10 to Null, is Unknown:

`SELECT 10 = NULL       -- Results in Unknown`


**Primary Key** - The unique id that is associated with the record being described. For example, in a table of order records `orders_table`, the Primary Key for any entry will be in the `order_id` column. The Foreign Key will be in the `customer_id` column in that `orders_table`. However, in the `customers_table`, the `customer_id` values will be Primary Keys for that table.

**Foreign Key** -

**N + 1 Query Problem** - Each query to the DB has a bit of overhead. It is more efficient to send 1 query to the DB which returns 100 results than 100 queries which return 1 result each. If the DB is on a different machine on the network which has a latency of 1 - 2 ms, this can really add up.


**SQL Injection** -


**SQL** -


**Index** - All values of a certain key (or keys) stored in a tree structure in the database. Indexing makes lookup times much faster at the expense of space.


**Schema** -


**Schema Migration** -


**Data Migration** -


**DBMS** - DataBase Management System


**Database Level Constraints** -


**CRUD** - Stands for Create, Read, Update, Destroy are four basic functions of persistent storage as it relates to the databases and how information is passed to websites.


<table class="wikitable">
<tr>
<th>Operation</th>
<th>SQL</th>
<th>HTTP</th>
<th>DDS</th>
</tr>
<tr>
<td>Create</td>
<td>INSERT</td>
<td>PUT / POST</td>
<td>write</td>
</tr>
<tr>
<td>Read (Retrieve)</td>
<td>SELECT</td>
<td>GET</td>
<td>read / take</td>
</tr>
<tr>
<td>Update (Modify)</td>
<td>UPDATE</td>
<td>POST / PUT / PATCH</td>
<td>write</td>
</tr>
<tr>
<td>Delete (Destroy)</td>
<td>DELETE</td>
<td>DELETE</td>
<td>dispose</td>
</tr>
</table>


