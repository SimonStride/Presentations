


SELECT fis.*
		, prd.EnglishProductName
		, sub.EnglishProductSubcategoryName 
		, cat.EnglishProductCategoryName
FROM FactInternetSales fis
LEFT JOIN DimProduct prd 
	on fis.ProductKey = prd.ProductKey
LEFT JOIN DimProductSubcategory sub
	ON prd.ProductSubcategoryKey = sub.ProductSubcategoryKey
LEFT JOIN DimProductCategory cat
	ON sub.ProductCategoryKey = cat.ProductCategoryKey

