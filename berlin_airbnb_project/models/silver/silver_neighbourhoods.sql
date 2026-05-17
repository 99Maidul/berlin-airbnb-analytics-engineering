with neighbourhoods as (

    select *
    from {{ ref('bronze_neighbourhoods') }}

),

cleaned as (

    select
        neighbourhood_group_name,
        neighbourhood_name,

        lower(trim(neighbourhood_group_name)) as neighbourhood_group_key,
        lower(trim(neighbourhood_name)) as neighbourhood_key,

        case
            when neighbourhood_group_name is null then false
            else true
        end as has_neighbourhood_group,

        _loaded_at,
        _file_name

    from neighbourhoods

    where neighbourhood_name is not null

)

select *
from cleaned