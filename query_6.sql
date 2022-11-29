with T as (
	select movieawards.title as name,
		count(movieawards.award)
	from movieawards
	where award like 'Oscar%'
		and result = 'won'
	group by name
)
select T.name,
	T.count
from T
where T.count = (
		select max(T.count)
		from T
	);