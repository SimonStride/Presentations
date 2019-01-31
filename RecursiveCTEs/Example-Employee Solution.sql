
--Solution 1
DECLARE @EmployeeID INT = 98
;
WITH StaffCTE AS (
					SELECT	e.EmployeeID, e.EmployeeName, e.EmployeeTitle, e.ManagerID, 0 AS DepthOfCTE
					FROM	dbo.EmployeeList e
					WHERE	e.EmployeeID = @EmployeeID
					UNION ALL
					SELECT	e.EmployeeID, e.EmployeeName, e.EmployeeTitle, e.ManagerID, s.DepthOfCTE + 1 AS DepthOfCTE
					FROM	StaffCTE s
						INNER JOIN
							dbo.EmployeeList e
								ON e.ManagerID = s.EmployeeID
						
		)
	SELECT e.*, m.EmployeeName AS ManagerName FROM StaffCTE e
		LEFT JOIN
			dbo.EmployeeList m
				ON e.ManagerID = m.EmployeeID