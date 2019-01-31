

DECLARE @Delimiter VARCHAR(5) = ','
DECLARE @JSonString	VARCHAR(MAX) =
'{"widget": {
    "debug": "on",
    "window": {
        "title": "Sample Konfabulator Widget",
        "name": "main_window",
        "width": 500,
        "height": 500
    },
    "image": { 
        "src": "Images/Sun.png",
        "name": "sun1",
        "hOffset": 250,
        "vOffset": 250,
        "alignment": "center"
    },
    "text": {
        "data": "Click Here",
        "size": 36,
        "style": "bold",
        "name": "text1",
        "hOffset": 250,
        "vOffset": 100,
        "alignment": "center",
        "onMouseUp": "sun1.opacity = (sun1.opacity / 100) * 90;"
    }
}}'
;
WITH JsonSplit AS (	SELECT SUBSTRING(	@JSonString
										, CHARINDEX('"', @JSonString) + 1
										, CHARINDEX(	'"'
														, RIGHT(@JSonString
														, LEN(@JSonString)
																- CHARINDEX('"', @JSonString)
																)) - 1
														) AS Property
							, SUBSTRING(	@JSonString
										, CHARINDEX('"', @JSonString) + 1
										, CHARINDEX(	'"'
														, RIGHT(@JSonString
														, LEN(@JSonString)
																- CHARINDEX('"', @JSonString)
																)) - 1
														) AS FullPath
							, '' AS ContainerOrValue
							, CHARINDEX(	'"', @JSonString) + 1 AS ValueStart
							, CHARINDEX(	'"'
											, @JSonString
											, CHARINDEX(	'"', @JSonString) + 1) AS ValueEnd
							, LEN(LEFT(@JSonString, CHARINDEX('"', @JSonString)))
								- LEN(REPLACE(LEFT(@JSonString, CHARINDEX('"', @JSonString)), '{', ''))		--how many open brackets
								- LEN(LEFT(@JSonString, CHARINDEX('"', @JSonString)))
								+ LEN(REPLACE(LEFT(@JSonString, CHARINDEX('"', @JSonString)), '}', ''))		--how many close brackets
								AS Depth
							, 0 AS OtherDepth
					UNION ALL
						SELECT SUBSTRING(	@JSonString
										, CHARINDEX('"', @JSonString, ValueEnd+1) + 1
										, CHARINDEX(	'"'
														, RIGHT(@JSonString
														, LEN(@JSonString)
																- CHARINDEX('"', @JSonString, ValueEnd+1)
																)) - 1
														) AS Property
							, SUBSTRING(	@JSonString
										, CHARINDEX('"', @JSonString, ValueEnd+1) + 1
										, CHARINDEX(	'"'
														, RIGHT(@JSonString
														, LEN(@JSonString)
																- CHARINDEX('"', @JSonString, ValueEnd+1)
																)) - 1
														) AS FullPath
							, '' AS ContainerOrValue
							, CHARINDEX(	'"', @JSonString, ValueEnd+1) + 1 AS ValueStart
							, CHARINDEX(	'"'
											, @JSonString
											, CHARINDEX(	'"', @JSonString, ValueEnd+1) + 1) AS ValueEnd
							, LEN(LEFT(@JSonString, CHARINDEX('"', @JSonString, ValueEnd+1)))
								- LEN(REPLACE(LEFT(@JSonString, CHARINDEX('"', @JSonString, ValueEnd+1)), '{', ''))		--how many open brackets
								- LEN(LEFT(@JSonString, CHARINDEX('"', @JSonString, ValueEnd+1)))
								+ LEN(REPLACE(LEFT(@JSonString, CHARINDEX('"', @JSonString, ValueEnd+1)), '}', ''))		--how many close brackets
							, OtherDepth + 1
					FROM	JSonSplit
					WHERE ValueEnd+1 < LEN(@JSonString)
							)
		SELECT * FROM JSonSplit

;
					
