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
OSCARSNOMINATED AS (
    SELECT MOVIEAWARDS.TITLE,
        MOVIES.YEAR,
        COUNT(MOVIEAWARDS.AWARD)
    FROM MOVIEAWARDS
        LEFT JOIN MOVIES ON MOVIES.TITLE = MOVIEAWARDS.TITLE
    GROUP BY MOVIEAWARDS.TITLE,
        MOVIES.YEAR
)
SELECT OSCARSNOMINATED.TITLE,
    COALESCE(
        TRUNC(
            ((OSCARSWON.COUNT * 1.0) / OSCARSNOMINATED.COUNT) * 100,
            2
        ),
        0
    )
FROM OSCARSNOMINATED
    LEFT JOIN OSCARSWON ON OSCARSNOMINATED.TITLE = OSCARSWON.TITLE
ORDER BY 1, 2 ASC;