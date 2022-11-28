with t as (
    select distinct count(movieawards.award)
    from movieawards
        right join movies on movieawards.title = movies.title
    where award like '%Oscar%'
        and result = 'won'
        and movies.year >= 1980
        and movies.year < 1990
),
p as (
    select distinct count(movies.title)
    from movies
    where movies.year >= 1980
        and movies.year < 1990
)
select case
        count(p.count)
        when 0 then -1::real
        else trunc(((t.count * 1.0) / p.count) * 100, 2)
    end
from t,
    p
group by t.count,
    p.count