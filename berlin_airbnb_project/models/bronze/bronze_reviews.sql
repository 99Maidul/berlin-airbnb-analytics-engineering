{{
    config(
        materialized='incremental',
        unique_key=['listing_id', 'review_date']
    )
}}

with source as (

    select *
    from {{ source('staging', 'raw_reviews') }}

),

renamed as (

    select
        listing_id::varchar as listing_id,
        try_to_date(date) as review_date,
        _loaded_at,
        _file_name

    from source

)

select *
from renamed

{% if is_incremental() %}
where review_date > (
    select coalesce(max(review_date), '1900-01-01')
    from {{ this }}
)
{% endif %}