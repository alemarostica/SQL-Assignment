with awardsandgross as(
    select movies.director,
        movies.gross - movies.budget as profit,
        movieawards.award
    from movies
        right join movieawards on movies.title = movieawards.title
    where movieawards.award like '%Best Director'
)
select *
from awardsandgross
where profit < 0;