

DECLARE @TargetStringLength INT = 10
DECLARE @LongString VARCHAR(MAX) = 
'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'

PRINT LEN(@LongString)
;
WITH StringConstruct AS (	SELECT SUBSTRING(@LongString, 1, @TargetStringLength) AS StringPart, 1 AS StringIndex
							UNION ALL
							SELECT	SUBSTRING(@LongString, 1 + (StringIndex * @TargetStringLength), @TargetStringLength)
									, StringIndex + 1 AS StringIndex
							FROM	StringConstruct
							WHERE	1 + (StringIndex * @TargetStringLength) < LEN(@LongString)
						)
		SELECT	* 
		FROM	StringConstruct
;