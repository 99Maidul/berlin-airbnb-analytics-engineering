{{ config(materialized='ephemeral') }}

select
    listing_id,
    count(*) as total_reviews,
    min(review_date) as first_review_date,
    max(review_date) as last_review_date,
    count(distinct review_month) as active_review_months
from {{ ref('silver_reviews') }}
group by listing_id