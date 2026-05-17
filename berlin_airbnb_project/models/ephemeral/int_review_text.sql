{{ config(materialized='ephemeral') }}

select
    listing_id,
    count(*) as total_detailed_reviews,
    count(distinct reviewer_id) as total_reviewers,
    avg(review_comment_length) as avg_review_comment_length,
    max(review_date) as last_detailed_review_date
from {{ ref('silver_reviews_all') }}
group by listing_id