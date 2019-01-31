


--real example from AdventureWorks


SELECT
		[ProductID]
		, [Name]
		, [ProductNumber]
		, [MakeFlag]
		, [FinishedGoodsFlag]
		, [Color]
		, [SafetyStockLevel]
		, [ReorderPoint]
		, [StandardCost]
		, [ListPrice]
		, [Size]
		, [SizeUnitMeasureCode]
		, [WeightUnitMeasureCode]
		, [Weight]
		, [DaysToManufacture]
		, [ProductLine]
		, [Class]
		, [Style]
		, [ProductSubcategoryID]		--Lookup this
		, [ProductModelID]
		, [SellStartDate]
		, [SellEndDate]
		, [DiscontinuedDate]
		, [rowguid]
		, [ModifiedDate]

FROM	[Production].[Product]

--from here
SELECT	[ProductSubcategoryID]
		, [ProductCategoryID]
		, [Name]
		, [rowguid]
		, [ModifiedDate]
FROM	[Production].[ProductSubcategory]


--e.g.

SELECT 
		prd.ProductID
		, prd.ProductNumber
		, sub.Name 
FROM	[Production].[Product] prd
	INNER JOIN
		[Production].[ProductSubCategory] sub
			ON prd.ProductSubcategoryID = sub.ProductSubCategoryID







-- Add an Alias

SELECT 
		prd.ProductID
		, prd.ProductNumber
		, sub.Name AS SubCategoryName
FROM	[Production].[Product] prd
	INNER JOIN
		[Production].[ProductSubCategory] sub
			ON prd.ProductSubcategoryID = sub.ProductSubCategoryID



---and chain on the Category information with a second join

SELECT	[ProductCategoryID]
		, [Name]
		, [rowguid]
		, [ModifiedDate]
FROM	[Production].[ProductCategory]


-- get the ProductCategory info
SELECT 
		prd.ProductID
		, prd.ProductNumber
		, sub.Name AS SubCategoryName
		, cat.Name AS CategoryName
FROM	[Production].[Product] AS prd
	INNER JOIN
		[Production].[ProductSubCategory] AS sub
			ON prd.ProductSubcategoryID = sub.ProductSubCategoryID
	INNER JOIN
		[Production].[ProductCategory] AS cat
			ON sub.ProductCategoryID = cat.ProductCategoryID

/*
note the order of the joins

	Product -> ProductSubCategory -> ProductCategory

	There is no direct connection between Product and ProductCatgory, so we can't join like this:
	Product -> ProductCategory
*/




--combine JOINS with a WHERE Clause

SELECT 
		prd.ProductID
		, prd.ProductNumber
		, sub.Name AS SubCategoryName
		, cat.Name AS CategoryName
FROM	[Production].[Product] AS prd
	INNER JOIN
		[Production].[ProductSubCategory] AS sub
			ON prd.ProductSubcategoryID = sub.ProductSubCategoryID
	INNER JOIN
		[Production].[ProductCategory] AS cat
			ON sub.ProductCategoryID = cat.ProductCategoryID
WHERE	cat.Name = 'Components'
--note that the alias does exist until the SELECT list
--so cannot appear in the WHERE clause