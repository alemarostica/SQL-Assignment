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
oscarsnominated as (
    select movieawards.title,
        movies.year,
        count(movieawards.award)
    from movieawards
        left join movies on movies.title = movieawards.title
    group by movieawards.title,
        movies.year
)
select oscarsnominated.title,
    coalesce(
        trunc(
            ((oscarswon.count * 1.0) / oscarsnominated.count) * 100,
            2
        ),
        0
    )
from oscarsnominated
    left join oscarswon on oscarsnominated.title = oscarswon.title;