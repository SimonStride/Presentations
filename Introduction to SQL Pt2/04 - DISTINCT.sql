/*

DISTINCT returns a unique list of values with NO AGGREGATES APPLIED

...means you don't need GROUP BY, but you can't COUNT or SUM

*/

--e.g. "What Units of Measure are in use in the Bill of Materials table?"
 SELECT * FROM Production.UnitMeasure --lots of Units available

SELECT TOP 1000 * FROM Production.BillOfMaterials AS bom --the actual table

SELECT DISTINCT bom.UnitMeasureCode 
FROM Production.BillOfMaterials AS bom
--only 3 values used


SELECT bom.UnitMeasureCode , COUNT(bom.ComponentID)
FROM Production.BillOfMaterials AS bom
GROUP BY bom.UnitMeasureCode
SELECT DISTINCT bom.UnitMeasureCode , COUNT(bom.ComponentID)
FROM Production.BillOfMaterials AS bom
GROUP BY bom.UnitMeasureCode
--Combine the queries...?