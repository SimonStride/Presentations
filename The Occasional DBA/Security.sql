

/**************************************************************************************************
* INSTANCE LEVEL PERMISSIONS
* 
* Instance Level Security is referred to as a SQL Login
* Can be Windows Authentication (e.g. AD username) – most secure
* OR
* SQL Login (username & password) – less secure, easier for Devs!
* Additional security required for Azure SQLDB (IP Whitelisting)
* 
**************************************************************************************************/


CREATE LOGIN [ISAD\ss123] FROM WINDOWS --Windows Auth - could be a user or AD Group

--OR

CREATE LOGIN my_username WITH PASSWORD = 'Secure Password' --SQL Login, requires Mixed Authentication mode











--Assign Server-Wide Permissions (could assign multiple)

EXEC sp_addsrvrolemember @loginame = 'my_username', @rolename = 'dbcreator'

			-- sysadmin
			-- securityadmin
			-- serveradmin
			-- setupadmin
			-- processadmin
			-- diskadmin
			-- dbcreator
			-- bulkadmin

--https://docs.microsoft.com/en-us/sql/relational-databases/system-stored-procedures/sp-addsrvrolemember-transact-sql?view=sql-server-2017

-- In SQL Server, the default Sysadmin account aka "God Access" is called "sa" and uses Username and Password
-- This is well known by hackers! 
-- Best practise is to disable sa account as soon as you install 



/**************************************************************************************************
* DATABASE LEVEL PERMISSIONS
* Now you're connected to the instance, you may not have permissions to see any data!
* Logins must either have high-level privileges such as sysadmin (bad idea, reserve for DBAs)
* OR Logins must be mapped to database users within EACH database they need access to
**************************************************************************************************/

USE AdventureWorks2017 --must switch contexts

CREATE USER [my_username] FOR LOGIN [my_username]

-- can now access the database, but no objects

/*
The following are "built-in" DB roles
*/
EXEC sp_addrolemember @rolename = 'db_datareader', @membername = 'my_username'	-- select on all tables but cannot see definitions
EXEC sp_addrolemember @rolename = 'db_datawriter', @membername = 'my_username'	-- write on all tables but cannot see definitions
EXEC sp_addrolemember @rolename = 'db_owner', @membername = 'my_username'		-- full control of database (not server)


/*
You could also create custom database roles, with specific access settings, then map users to that role
*/

GRANT VIEW DEFINITION TO [my_username] --allow user to see code underlying stored procs & views

GRANT EXECUTE TO my_username --run procs/code

/**************************************************************************************************
* SCHEMA & TABLE LEVEL PERMISSIONS
**************************************************************************************************/

--allow user to select everything in a specific schema
GRANT SELECT ON SCHEMA::Person TO my_username

--specific table
GRANT SELECT ON Person.Person TO my_username

--other permissions are available
GRANT SELECT, INSERT, UPDATE, DELETE ON Person.Person TO my_username

GRANT EXECUTE ON SCHEMA::Person TO my_username

GRANT VIEW DEFINITION ON SCHEMA::Person to my_username



/**************************************************************************************************
* COLUMN & ROW LEVEL PERMISSIONS
* 
* Long topic for another day - row level security permissions allow you to have one table, but different 
* rows visible depending on the user
* https://www.sqlshack.com/sql-server-data-security-feature-rls-row-level-security-and-gdpr/
* SQL Server Column Masking also makes it harder for data to be exposed by accident
* 
**************************************************************************************************/



DROP USER [my_username] --AdventureWorks2017 User
DROP LOGIN [my_username] --Server Login
