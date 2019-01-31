

USE DEMO


--Example 2 - proof that the logging SQL worked
SELECT * FROM Audit.BIML_Log


--Example 3 - check that the SalesOrderDetail table was populated
SELECT * FROM Sales.SalesOrderDetail


--Example 4 - check that the tables were populated
SELECT * FROM Sales.SalesOrderDetail
SELECT * FROM Sales2.SalesOrderDetail
SELECT * FROM Practise01.SourceDemo