SELECT DIRECTORAWARDS.AWARD,
	DIRECTORAWARDS.YEAR,
	DIRECTORAWARDS.DIRECTOR
FROM MOVIES
	RIGHT JOIN DIRECTORAWARDS ON MOVIES.DIRECTOR = DIRECTORAWARDS.DIRECTOR
WHERE MOVIES.GROSS > 1000000
	AND MOVIES.YEAR > (
		EXTRACT(
			YEAR
			FROM CURRENT_DATE
		) - 5
	);