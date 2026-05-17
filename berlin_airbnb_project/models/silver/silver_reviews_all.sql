with reviews as (

    select *
    from {{ ref('bronze_reviews_all') }}

),

cleaned as (

    select
        review_id,
        listing_id,
        reviewer_id,

        review_date,
        reviewer_name,

        trim(review_comments) as review_comments,

        case
            when review_comments is null or trim(review_comments) = '' then false
            else true
        end as has_review_comment,

        length(trim(review_comments)) as review_comment_length,

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