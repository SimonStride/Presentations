

/*

Lets talk about NULLs

Relational Theory, controversially recognises 3 boolean values - True, False and NULL (aka Unknown)

NULLs normally represent unknown or absence values e.g. A Customer fax number field


   =   |  True   |  False  |  NULL  
-------|---------|---------|---------
True   |  True   |  False  |  NULL
False  |  False  |  True   |  NULL
NULL   |  NULL   |  NULL   |  NULL


Note: NULL is not equal to NULL!!!!



*/


SELECT
		BusinessEntityID
		, NationalIDNumber
		, LoginID
		, JobTitle
		, OrganizationLevel
FROM	HumanResources.Employee
WHERE	OrganizationLevel = NULL
;
--returns nothing because nothing equates to NULL

-- use IS NULL instead

SELECT
		BusinessEntityID
		, NationalIDNumber
		, LoginID
		, JobTitle
		, OrganizationLevel
FROM	HumanResources.Employee
WHERE	OrganizationLevel IS NULL
;

--Or the inverse "IS NOT NULL"
SELECT
		BusinessEntityID
		, NationalIDNumber
		, LoginID
		, JobTitle
		, OrganizationLevel
FROM	HumanResources.Employee
WHERE	OrganizationLevel IS NOT NULL
;