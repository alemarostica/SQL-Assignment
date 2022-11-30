--v1.0

WITH OSCARSWON AS (
    SELECT MOVIEAWARDS.TITLE,
        MOVIES.YEAR,
        COUNT(MOVIEAWARDS.AWARD)
    FROM MOVIEAWARDS
        LEFT JOIN MOVIES ON MOVIES.TITLE = MOVIEAWARDS.TITLE
    WHERE MOVIEAWARDS.RESULT = 'won'
    GROUP BY MOVIEAWARDS.TITLE,
        MOVIES.YEAR
),
THREEATLEAST AS (
    SELECT *
    FROM OSCARSWON
    WHERE COUNT >= 3
)
SELECT TITLE
FROM THREEATLEAST
WHERE THREEATLEAST.YEAR = (
        SELECT MAX(THREEATLEAST.YEAR)
        FROM THREEATLEAST
    )
ORDER BY 1 ASC;