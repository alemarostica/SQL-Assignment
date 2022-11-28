with oscarswon as (
    select movieawards.title,
        movies.year,
        count(movieawards.award)
    from movieawards
        left join movies on movies.title = movieawards.title
    where movieawards.result = 'won'
    group by movieawards.title,
        movies.year
),
threeatleast as (
    select *
    from oscarswon
    where count >= 3
)
select *
from threeatleast
where threeatleast.year = (
        select max(threeatleast.year)
        from threeatleast
    )
order by title asc;