with reviews as (

    select *
    from {{ ref('bronze_reviews') }}

),

cleaned as (

    select
        listing_id,
        review_date,

        date_trunc('month', review_date) as review_month,
        date_trunc('quarter', review_date) as review_quarter,
        year(review_date) as review_year,

        _loaded_at,
        _file_name

    from reviews

    where listing_id is not null
      and review_date is not null

)

select *
from cleaned