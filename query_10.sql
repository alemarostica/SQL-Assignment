with SpilAward as (
    select movies.director,
        movieawards.year,
        count(*) as num
    from movieawards
        left join movies on movieawards.title = movies.title
    where (movies.director = 'Spielberg')
        and (movieawards.result = 'won')
    group by movies.director,
        movieawards.year
    having count(*) >= 3
),
dir as (
    select movieawards.award as award,
        directors.director as dir,
        movieawards.year
    from (
            movieawards
            left join movies on movieawards.title = movies.title
        )
        left join directors on movies.director = directors.director
    where (movieawards.award like '%, Best Director')
        and (movieawards.result = 'won')
    union
    select directorawards.award as award,
        directors.director as dir,
        directorawards.year
    from directorawards
        left join directors on directorawards.director = directors.director
    where (directorawards.result = 'won')
    order by 1
)
select distinct dir.dir,
    dir.year
from dir
where dir.year in (
        select SpilAward.year
        from SpilAward
    );