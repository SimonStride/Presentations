USE AdventureWorks2017


SELECT * FROM Person.BusinessEntityAddress

-- run an operation

DELETE FROM Person.BusinessEntityAddress
	WHERE 1 = 1





-- Ooops!!!

USE [master]

--restrict usage on the current DB to perevent other users being left in an inconsistent state during the operation
ALTER DATABASE [AdventureWorks2017] SET SINGLE_USER WITH ROLLBACK IMMEDIATE
-- do the restore
RESTORE DATABASE [AdventureWorks2017] FROM  
		DISK = N'C:\Projects\Presentations\The Occasional DBA\example20190417.bak' --backup file
	WITH  FILE = 1,  NOUNLOAD,  REPLACE,  STATS = 5
-- make the rstored database available again
ALTER DATABASE [AdventureWorks2017] SET MULTI_USER

GO


USE AdventureWorks2017

--and we're back!
SELECT * FROM Person.BusinessEntityAddress