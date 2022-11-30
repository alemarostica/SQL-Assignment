--v1.0

WITH SPILAWARD AS (
    SELECT MOVIES.DIRECTOR,
        MOVIEAWARDS.YEAR,
        COUNT(*) AS NUM
    FROM MOVIEAWARDS
        LEFT JOIN MOVIES ON MOVIEAWARDS.TITLE = MOVIES.TITLE
    WHERE (MOVIES.DIRECTOR = 'Spielberg')
        AND (MOVIEAWARDS.RESULT = 'won')
    GROUP BY MOVIES.DIRECTOR,
        MOVIEAWARDS.YEAR
    HAVING COUNT(*) >= 3
),
DIR AS (
    SELECT MOVIEAWARDS.AWARD AS AWARD,
        DIRECTORS.DIRECTOR AS DIR,
        MOVIEAWARDS.YEAR
    FROM (
            MOVIEAWARDS
            LEFT JOIN MOVIES ON MOVIEAWARDS.TITLE = MOVIES.TITLE
        )
        LEFT JOIN DIRECTORS ON MOVIES.DIRECTOR = DIRECTORS.DIRECTOR
    WHERE (MOVIEAWARDS.AWARD LIKE '%, best director')
        AND (MOVIEAWARDS.RESULT = 'won')
    UNION
    SELECT DIRECTORAWARDS.AWARD AS AWARD,
        DIRECTORS.DIRECTOR AS DIR,
        DIRECTORAWARDS.YEAR
    FROM DIRECTORAWARDS
        LEFT JOIN DIRECTORS ON DIRECTORAWARDS.DIRECTOR = DIRECTORS.DIRECTOR
    WHERE (DIRECTORAWARDS.RESULT = 'won')
    ORDER BY 1
)
SELECT DISTINCT DIR.DIR
FROM DIR
WHERE DIR.YEAR IN (
        SELECT SPILAWARD.YEAR
        FROM SPILAWARD
    )
ORDER BY 1 ASC;