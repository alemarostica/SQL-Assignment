--v1.0

WITH OSCAR_WON AS (
    SELECT count(*)
    FROM (
            SELECT TITLE,
                YEAR
            FROM MOVIEAWARDS
            WHERE AWARD LIKE '%oscar%'
                AND YEAR < 1990
                AND YEAR >= 1980
                AND RESULT = 'won'
            GROUP BY TITLE,
                YEAR
        ) as foo
),
ALL_MOVIES AS (
    SELECT DISTINCT COUNT(*)
    FROM MOVIES M
    WHERE M.YEAR < 1990
        AND M.YEAR >= 1980
)
SELECT CASE
        AM.COUNT
        WHEN 0 THEN -1::REAL
        ELSE TRUNC((OW.COUNT::DECIMAL / AM.COUNT::DECIMAL * 100), 2)
    END AS WINPERCENTAGE
FROM OSCAR_WON OW,
    ALL_MOVIES AM
ORDER BY 1 ASC;