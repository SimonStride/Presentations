

WITH MaxRecursionTest AS (	SELECT 0 AS Tally
							UNION ALL
							SELECT Tally + 1 AS Tally
							FROM MaxRecursionTest
							WHERE Tally < 110
						)
		SELECT * FROM MaxRecursionTest OPTION ( MAXRECURSION 110 )