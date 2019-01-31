/*

0. Tables and Schemas

Tables are the primary storage mechanism for RDBMS

They may be persisted to disk, or temporary

In SQL server, tables are grouped under Schemas for security and organisation purposes

e.g. Person schema, HumanResources

query a table...
*/



SELECT * FROM HumanResources.Employee




/*

SELECT * is often used for exploring data but should be avoided when writing code

Listing the columns we're interested is much better

*/


SELECT	BusinessEntityID
		, NationalIDNumber
		, LoginID
FROM	HumanResources.Employee



/*

This is fine for a small table - but what about a big table?

Or one of as-yet-unknown size?

The TOP clause allows us to limit the number of records returned either by number or percent 

*/


SELECT	TOP 10 
		BusinessEntityID
		, NationalIDNumber
		, LoginID
FROM	HumanResources.Employee;


SELECT	TOP 5 PERCENT
		BusinessEntityID
		, NationalIDNumber
		, LoginID
FROM	HumanResources.Employee;