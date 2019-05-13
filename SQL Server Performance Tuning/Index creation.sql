--clean slate
DBCC DROPCLEANBUFFERS -- DO NOT run on production
DBCC FREEPROCCACHE -- DO NOT run on production

DROP INDEX IF EXISTS nix_SalesPersonReport_LastName ON dbo.SalesPersonReport;
DROP INDEX IF EXISTS nix_SalesPersonReport_LastName_inc_FirstName ON dbo.SalesPersonReport;


--example without index

SELECT LastName FROM dbo.SalesPersonReport WHERE LastName = 'Sandberg'

/*
example stats
(14 rows affected)
Table 'SalesPersonReport'. Scan count 1, logical reads 124, physical reads 0, read-ahead reads 124, lob logical reads 0, lob physical reads 0, lob read-ahead reads 0.
*/

-- create a non clustered index on the LastName
CREATE NONCLUSTERED INDEX 
	nix_SalesPersonReport_LastName ON dbo.SalesPersonReport (LastName)

SELECT LastName FROM dbo.SalesPersonReport WHERE LastName = 'Sandberg'

/*
example stats
(14 rows affected)
Table 'SalesPersonReport'. Scan count 1, logical reads 2, physical reads 0, read-ahead reads 0, lob logical reads 0, lob physical reads 0, lob read-ahead reads 0.
*/


--BUT what if I need the first name?

SELECT FirstName, LastName FROM dbo.SalesPersonReport WHERE LastName = 'Sandberg'

--


CREATE NONCLUSTERED INDEX 
	nix_SalesPersonReport_LastName_inc_FirstName ON dbo.SalesPersonReport (LastName) include (FirstName)

SELECT FirstName, LastName FROM dbo.SalesPersonReport WHERE LastName = 'Sandberg'

/*
(14 rows affected)
Table 'SalesPersonReport'. Scan count 1, logical reads 2, physical reads 0, read-ahead reads 0, lob logical reads 0, lob physical reads 0, lob read-ahead reads 0.

*/



SET STATISTICS IO OFF
SET STATISTICS TIME OFF