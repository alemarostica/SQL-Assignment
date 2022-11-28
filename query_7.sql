with oscardirectors as (
    select directorawards.*,
        directors.yearofbirth
    from directorawards
        right join directors on directorawards.director = directors.director
    where award like 'Oscar%'
        and result = 'won'
)
select oscardirectors.director,
    case
        when oscardirectors.yearofbirth = (
            select max(oscardirectors.yearofbirth)
            from oscardirectors
        ) then 'youngest'
        else 'oldest'
    end as feature
from oscardirectors
where (
        select max(oscardirectors.yearofbirth)
        from oscardirectors
    ) = oscardirectors.yearofbirth
    or (
        select min(oscardirectors.yearofbirth)
        from oscardirectors
    ) = oscardirectors.yearofbirth;