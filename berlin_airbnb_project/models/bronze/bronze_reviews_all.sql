{{
    config(
        materialized='incremental',
        unique_key='review_id'
    )
}}

with source as (

    select *
    from {{ source('staging', 'raw_reviews_all') }}

),

renamed as (

    select
        listing_id::varchar as listing_id,
        id::varchar as review_id,
        try_to_date(date) as review_date,
        reviewer_id::varchar as reviewer_id,
        reviewer_name,
        comments as review_comments,
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