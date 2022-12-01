--v1.3

SELECT MOVIES.TITLE,
    MOVIES.YEAR,
    CASE
        COUNT(MOVIEAWARDS.RESULT)
        WHEN 0 THEN -1
        ELSE TRUNC(
            (
                SUM(
                    CASE
                        WHEN MOVIEAWARDS.RESULT = 'won' THEN 1
                        ELSE 0
                    END
                ) / COUNT(MOVIEAWARDS.RESULT)::DECIMAL
            ),
            2
        )
    END
FROM MOVIES
    LEFT JOIN MOVIEAWARDS ON MOVIES.TITLE = MOVIEAWARDS.TITLE
GROUP BY MOVIES.TITLE,
    MOVIES.YEAR
ORDER BY MOVIES.TITLE,
    MOVIES.YEAR;