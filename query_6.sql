--v1.0
WITH T AS (
	SELECT MOVIEAWARDS.TITLE AS NAME,
		COUNT(MOVIEAWARDS.AWARD)
	FROM MOVIEAWARDS
	WHERE AWARD LIKE 'oscar%'
		AND RESULT = 'won'
	GROUP BY NAME
)
SELECT T.NAME
FROM T
WHERE T.COUNT = (
		SELECT MAX(T.COUNT)
		FROM T
	)
ORDER BY 1 ASC;