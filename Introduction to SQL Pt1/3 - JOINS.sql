

--but first, lets show an example of aliasing a table

SELECT emp.BusinessEntityID
FROM HumanResources.Employee emp;
--or
SELECT emp.BusinessEntityID
FROM HumanResources.Employee AS emp;

/*

--------------JOINS-----------------------------------------------------------------

Principle of good relational database design is to store data in different tables and minimise repetition 

e.g. customer information in the customer table, not in the orders table
This minimises the need for changes e.g. update the customer name in the customer table ONCE, not against each order

Tables interconnect using columns with common values

example:
	
	GroceryProduct Table

		Product			 TypeID
		-------------------------
		Apple				1
		Pear				1
		Potato				2
		Cauliflower			2
		Teddy Bear			3

	GroceryType Table

		TypeID		TypeDescription
		--------------------------------
		1			Fruit
		2			Vegetabl
		3			Toy

















		(spot the intentional typo!)

	We can get data from both tables in one query using a join:

		SELECT 
				prd.Product
				, typ.TypeDescription
		FROM	GroceryProduct AS prd
			INNER JOIN
				GroceryType AS typ
					ON prd.TypeID = typ.TypeID


		AVOID!!!!!!
		SELECT 
				a.Product
				, b.TypeDescription
		FROM	GroceryProduct a
			INNER JOIN
				GroceryType b
					ON a.TypeID = b.TypeID
		


	... would return
		Product			TypeDescription
		---------------------------------
		Apple			Fruit
		Pear			Fruit
		Potato			Vegetabl
		Cauliflower		Vegetabl
		Teddy Bear		Toy

	Now we only need to update "Vegetable" in one row of one table (more on "UPDATE" later)

	Joins act a bit like a VLOOKUP
		
*/


/*


JOINS
"ON" logic must evaluate to true

*/

/*

INNER JOIN - data must appear in both tables
aka JOIN

*/



/*

LEFT OUTER JOIN - return all data in the "Left" table
return data from both if matches found
aka LEFT JOIN
similar to VLookup for the Excel crowd

*/