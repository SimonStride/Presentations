/*


LEFT OUTER JOIN - return all data in the "Left" table
As you write tables in the FROM section, they go from a virtual left to right...sort of...

Returns data from both if matches found
aka LEFT JOIN
similar to VLookup for the Excel crowd



*/

--compare
SELECT 
		prd.ProductID
		, prd.ProductNumber
		, prd.ProductSubcategoryID
		, sub.ProductSubcategoryID
		, sub.Name 
FROM	[Production].[Product] prd
	INNER JOIN
		[Production].[ProductSubCategory] sub
			ON prd.ProductSubCategoryID = sub.ProductSubCategoryID
--to
SELECT 
		prd.ProductID
		, prd.ProductNumber
		, prd.ProductSubcategoryID
		, sub.ProductSubcategoryID
		, sub.Name AS SubCategoryName
FROM	[Production].[Product] prd
	LEFT JOIN
		[Production].[ProductSubCategory] sub
			ON prd.ProductSubcategoryID = sub.ProductSubCategoryID


--Mismatches
SELECT 
		prd.ProductID
		, prd.ProductNumber
		, prd.ProductSubcategoryID
		, sub.ProductSubcategoryID
		, sub.[Name]			AS SubCategoryName
FROM	[Production].[Product] prd
	LEFT JOIN
		[Production].[ProductSubCategory] sub
			ON prd.ProductSubcategoryID = sub.ProductSubCategoryID
WHERE sub.ProductSubcategoryID IS NULL




--chain LEFT JOINs exactly the same as before...

SELECT 
		prd.ProductID
		, prd.ProductNumber
		, sub.Name AS SubCategoryName
		, cat.Name AS CategoryName
FROM	Production.Product AS prd
	LEFT JOIN
		Production.ProductSubCategory AS sub
			ON prd.ProductSubcategoryID = sub.ProductSubCategoryID
	LEFT JOIN
		Production.ProductCategory AS cat
			ON sub.ProductCategoryID = cat.ProductCategoryID