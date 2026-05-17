{{ config(materialized='table') }}

select
    review_id,
    listing_id,
    reviewer_id,
    review_date,
    review_month,
    review_quarter,
    review_year,
    has_review_comment,
    review_comment_length,
    _loaded_at
from {{ ref('silver_reviews_all') }}