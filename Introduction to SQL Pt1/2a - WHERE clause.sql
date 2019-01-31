/*

The WHERE clause is our Primary method of filtering data

The following uses "equality" to find all the Design engineers in the employee table

*/


SELECT	
		BusinessEntityID
		, NationalIDNumber
		, LoginID
		, JobTitle
FROM	HumanResources.Employee 
WHERE	JobTitle = 'Design Engineer'
;

--or the opposite
SELECT	
		BusinessEntityID
		, NationalIDNumber
		, LoginID
		, JobTitle
FROM	HumanResources.Employee 
WHERE	JobTitle <> 'Design Engineer' 
/*  could also use != */
;

--or use "NOT" to get the counter version
SELECT	
		BusinessEntityID
		, NationalIDNumber
		, LoginID
		, JobTitle
FROM	HumanResources.Employee 
WHERE	NOT JobTitle = 'Design Engineer'
;

--Inequality also applies
SELECT	
		BusinessEntityID
		, NationalIDNumber
		, LoginID
		, HireDate
FROM	HumanResources.Employee 
WHERE	HireDate > '2010-01-01' --HireDate strictly greater than 1st November 2010 n.b. Ansi syntax
;
SELECT	
		BusinessEntityID
		, NationalIDNumber
		, LoginID
		, HireDate
FROM	HumanResources.Employee 
WHERE	HireDate >= '2010-01-01' --HireDate greater than or equal to 1st November 2010
;

/*

Combine "LIKE" with "%" as a search wildcard

*/


SELECT	
		BusinessEntityID
		, NationalIDNumber
		, LoginID
		, JobTitle
FROM	HumanResources.Employee 
WHERE	JobTitle LIKE '%Engineer'
;



/*

...but be careful where you place your %'s

*/


SELECT	
		BusinessEntityID
		, NationalIDNumber
		, LoginID
		, JobTitle
FROM	HumanResources.Employee 
WHERE	JobTitle LIKE '%Engineer%'
;




/*

Combine multiple pieces of logic using AND or OR

*/


SELECT	
		BusinessEntityID
		, NationalIDNumber
		, LoginID
		, JobTitle
FROM	HumanResources.Employee 
WHERE	JobTitle LIKE '%Engineer'
	AND	JobTitle LIKE 'Design%'
;


SELECT	
		BusinessEntityID
		, NationalIDNumber
		, LoginID
		, JobTitle
FROM	HumanResources.Employee 
WHERE	JobTitle LIKE '%Engineer'
	OR	JobTitle LIKE 'Design%'
;

/*

I STRONGLY recommend the use of brackets to divide up your logic

*/

SELECT	
		BusinessEntityID
		, NationalIDNumber
		, LoginID
		, JobTitle
FROM	HumanResources.Employee 
WHERE	JobTitle LIKE '%Engineer'
	OR	JobTitle LIKE 'Design%' --ambiguous OR line
	AND HireDate >= '2010-11-01'
;

SELECT	
		BusinessEntityID
		, NationalIDNumber
		, LoginID
		, JobTitle
FROM	HumanResources.Employee 
WHERE	(		JobTitle LIKE '%Engineer'
			OR	JobTitle LIKE 'Design%' 
			) --unambiguous OR line using Brackets
	AND HireDate >= CAST('2010-11-01' as DATE)
;

--ints
SELECT * FROM HumanResources.Employee WHERE BusinessEntityID = 1


SELECT * FROM HumanResources.Employee WHERE JobTitle = 'Design Engineer' OR JobTitle = 'Senior Design Engineer'
SELECT * FROM HumanResources.Employee WHERE JobTitle IN ('Design Engineer', 'Senior Design Engineer')