--v1.0

WITH AWARDSANDGROSS AS(
    SELECT MOVIES.DIRECTOR,
        MOVIEAWARDS.TITLE,
        MOVIES.GROSS - MOVIES.BUDGET AS PROFIT,
        MOVIEAWARDS.AWARD
    FROM MOVIES
        RIGHT JOIN MOVIEAWARDS ON MOVIES.TITLE = MOVIEAWARDS.TITLE
    WHERE MOVIEAWARDS.AWARD LIKE '%best director'
)
SELECT DISTINCT DIRECTOR
FROM AWARDSANDGROSS
WHERE PROFIT < 0
ORDER BY 1 ASC;