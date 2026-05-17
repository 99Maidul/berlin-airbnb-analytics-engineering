with source as (

    select *
    from {{ source('staging', 'raw_neighbourhoods') }}

),

renamed as (

    select

        neighbourhood_group as neighbourhood_group_name,

        neighbourhood as neighbourhood_name,

        _loaded_at,
        _file_name

    from source

)

select *
from renamed