

USE SQL_UserGroup
GO

IF OBJECT_ID('dbo.EmployeeList') IS NOT NULL
	BEGIN
		DROP TABLE dbo.EmployeeList;
	END
GO

CREATE TABLE dbo.EmployeeList (
				EmployeeID			INT PRIMARY KEY
				, EmployeeName		VARCHAR(50)
				, EmployeeTitle		VARCHAR(50)
				, ManagerID			INT
				)

ALTER TABLE EmployeeList 
	ADD CONSTRAINT fk_ManagerLookup 
			FOREIGN KEY (ManagerID) 
			REFERENCES EmployeeList (EmployeeID)


INSERT INTO EmployeeList VALUES
		(1, 'Penny Chapman', 'Made up Job 2', 6)
		, (2, 'Terry Evans', 'Made up Job 3', 6)
		, (3, 'Dave Vincent', 'Made up Job 2', 6)
		, (4, 'Bruce Anderson', 'Made up Job 8', 6)
		, (5, 'Amanda Morgan', 'Made up Job 3', 6)
		, (6, 'Rosie Jackson', 'Manager', 97)
		, (7, 'Gertrude Smith', 'Made up Job 8', 15)
		, (8, 'Oliver Carter', 'Made up Job 1', 15)
		, (9, 'Penny Ogden', 'Made up Job 4', 15)
		, (10, 'Spencer Ogden', 'Made up Job 7', 15)
		, (11, 'Paul Parker', 'Made up Job 3', 15)
		, (12, 'Amanda Carter', 'Made up Job 10', 15)
		, (13, 'Jack Parker', 'Made up Job 9', 15)
		, (14, 'John Stephens', 'Made up Job 7', 15)
		, (15, 'David Parker', 'Manager', 97)
		, (16, 'Terry Carter', 'Made up Job 2', 15)
		, (17, 'Dave Lee', 'Made up Job 8', 15)
		, (18, 'Alfred Morgan', 'Made up Job 1', 15)
		, (19, 'Spencer White', 'Made up Job 7', 15)
		, (20, 'John Brown', 'Made up Job 1', 30)
		, (21, 'Alfred Robinson', 'Made up Job 5', 30)
		, (22, 'Oliver Morgan', 'Made up Job 8', 30)
		, (23, 'Sam Robinson', 'Made up Job 1', 30)
		, (24, 'Luke Stephens', 'Made up Job 9', 30)
		, (25, 'Leonard Lee', 'Made up Job 1', 30)
		, (26, 'Luke White', 'Made up Job 7', 30)
		, (27, 'Amanda Stephens', 'Made up Job 1', 30)
		, (28, 'Mason White', 'Made up Job 7', 30)
		, (29, 'Marilyn Morgan', 'Made up Job 4', 30)
		, (30, 'David Brown', 'Manager', 97)
		, (31, 'Gemma Ogden', 'Made up Job 6', 35)
		, (32, 'Jacob Ogden', 'Made up Job 5', 35)
		, (33, 'Joan Jones', 'Made up Job 2', 35)
		, (34, 'Luke White', 'Made up Job 5', 35)
		, (35, 'Robert Ogden', 'Manager', 98)
		, (36, 'Jenny Anderson', 'Made up Job 3', 45)
		, (37, 'Paul Brown', 'Made up Job 1', 45)
		, (38, 'Sally Jackson', 'Made up Job 4', 45)
		, (39, 'Richard Ogden', 'Made up Job 5', 45)
		, (40, 'Jacob Brown', 'Made up Job 3', 45)
		, (41, 'Leonard Chapman', 'Made up Job 2', 45)
		, (42, 'Gemma Morgan', 'Made up Job 7', 45)
		, (43, 'Amanda Carter', 'Made up Job 6', 45)
		, (44, 'Dave Chapman', 'Made up Job 8', 45)
		, (45, 'Leonard Parker', 'Manager', 98)
		, (46, 'Alfred Davidson', 'Made up Job 2', 52)
		, (47, 'Rosie Ogden', 'Made up Job 3', 52)
		, (48, 'Oliver Evans', 'Made up Job 8', 52)
		, (49, 'Spencer Parker', 'Made up Job 1', 52)
		, (50, 'Bruce Chapman', 'Made up Job 8', 52)
		, (51, 'Malcolm Anderson', 'Made up Job 1', 52)
		, (52, 'Paul Williams', 'Manager', 98)
		, (53, 'Paul Morgan', 'Made up Job 2', 65)
		, (54, 'John Stephens', 'Made up Job 3', 65)
		, (55, 'Sam Vincent', 'Made up Job 3', 65)
		, (56, 'Richard Morgan', 'Made up Job 4', 65)
		, (57, 'Madison Chapman', 'Made up Job 9', 65)
		, (58, 'Spencer Davidson', 'Made up Job 4', 65)
		, (59, 'Dave Chapman', 'Made up Job 6', 65)
		, (60, 'Fred Lee', 'Made up Job 3', 65)
		, (61, 'Gertrude Parker', 'Made up Job 5', 65)
		, (62, 'Jack Lee', 'Made up Job 2', 65)
		, (63, 'Gertrude Taylor', 'Made up Job 2', 65)
		, (64, 'Jack Taylor', 'Made up Job 3', 65)
		, (65, 'Dave Taylor', 'Manager', 99)
		, (66, 'Dave Chapman', 'Made up Job 6', 80)
		, (67, 'Alfred Brown', 'Made up Job 5', 80)
		, (68, 'Malcolm Chapman', 'Made up Job 6', 80)
		, (69, 'Sam White', 'Made up Job 10', 80)
		, (70, 'Jenny Davidson', 'Made up Job 10', 80)
		, (71, 'Penny Brown', 'Made up Job 4', 80)
		, (72, 'Jacob Stephens', 'Made up Job 7', 80)
		, (73, 'Gertrude Brown', 'Made up Job 8', 80)
		, (74, 'John Taylor', 'Made up Job 1', 80)
		, (75, 'Oliver White', 'Made up Job 5', 80)
		, (76, 'Sam Evans', 'Made up Job 6', 80)
		, (77, 'Malcolm Evans', 'Made up Job 1', 80)
		, (78, 'Fred Parker', 'Made up Job 4', 80)
		, (79, 'Spencer Robinson', 'Made up Job 4', 80)
		, (80, 'Penny Stephens', 'Manager', 99)
		, (81, 'Sally Vincent', 'Made up Job 7', 86)
		, (82, 'Sally Jackson', 'Made up Job 10', 86)
		, (83, 'Gemma Carter', 'Made up Job 4', 86)
		, (84, 'Gemma Jones', 'Made up Job 1', 86)
		, (85, 'Richard Green', 'Made up Job 6', 86)
		, (86, 'Jenny White', 'Manager', 99)
		, (87, 'Sam Taylor', 'Made up Job 5', 90)
		, (88, 'Rosie Jones', 'Made up Job 3', 90)
		, (89, 'Spencer Robinson', 'Made up Job 7', 90)
		, (90, 'Sam Taylor', 'Manager', 65)
		, (91, 'Robert Robinson', 'Made up Job 3', 97)
		, (92, 'Leonard Chapman', 'Made up Job 3', 97)
		, (93, 'Gemma Green', 'Made up Job 8', 97)
		, (94, 'Paul Jackson', 'Made up Job 4', 97)
		, (95, 'Jenny Carter', 'Made up Job 1', 97)
		, (96, 'Oliver Williams', 'Made up Job 5', 97)
		, (97, 'Paul Jones', 'Director', 100)
		, (98, 'Luke Vincent', 'Director', 100)
		, (99, 'Joan Jackson', 'Director', 100)
		, (100, 'Gertrude Parker', 'MD', NULL)


