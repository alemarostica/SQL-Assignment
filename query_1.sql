SELECT DISTINCT DIRECTORS.DIRECTOR,
	COALESCE(MIN(MOVIES.GROSS - MOVIES.BUDGET), -1),
	COALESCE(MAX(MOVIES.GROSS - MOVIES.BUDGET), -1),
	TRUNC(COALESCE(AVG(MOVIES.GROSS), -1), 2)
FROM DIRECTORS
	LEFT JOIN MOVIES ON DIRECTORS.DIRECTOR = MOVIES.DIRECTOR
WHERE DIRECTORS.YEAROFBIRTH < (
		EXTRACT(
			YEAR
			FROM CURRENT_DATE
		) - 50
	)
GROUP BY DIRECTORS.DIRECTOR
ORDER BY 4 ASC;
