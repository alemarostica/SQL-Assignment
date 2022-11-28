with awardsandgross as(
    select movies.director,
        movieawards.title,
        movies.gross - movies.budget as profit,
        movieawards.award
    from movies
        right join movieawards on movies.title = movieawards.title
    where movieawards.award like '%Best Director'
)
select *
from awardsandgross
where profit < 0
group by awardsandgross.director,
    awardsandgross.title,
    awardsandgross.profit,
    awardsandgross.award