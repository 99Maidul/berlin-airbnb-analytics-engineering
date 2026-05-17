{{ config(materialized='table') }}

select
    l.listing_id,
    l.listing_url,
    l.listing_name,
    l.host_id,
    h.host_name,
    h.is_superhost,
    h.host_response_rate,
    h.host_acceptance_rate,

    l.neighbourhood_cleansed,
    l.neighbourhood_group_cleansed,
    n.neighbourhood_name,
    n.neighbourhood_group_name,

    l.property_type,
    l.room_type,
    l.accommodates,
    l.bathrooms,
    l.bedrooms,
    l.beds,

    l.price,
    l.price_per_guest,
    l.price_per_bedroom,
    l.price_segment,

    l.availability_30,
    l.availability_60,
    l.availability_90,
    l.availability_365,
    l.estimated_booked_days_365,
    l.estimated_occupancy_rate_365,
    l.estimated_annual_revenue,

    ra.total_reviews,
    ra.first_review_date,
    ra.last_review_date,
    ra.active_review_months,

    rt.total_detailed_reviews,
    rt.total_reviewers,
    rt.avg_review_comment_length,
    rt.last_detailed_review_date,

    l.review_scores_rating,
    l.review_scores_cleanliness,
    l.review_scores_location,
    l.review_scores_value

from {{ ref('silver_listings') }} l

left join {{ ref('dim_hosts') }} h
    on l.host_id = h.host_id

left join {{ ref('dim_neighbourhoods') }} n
    on lower(trim(l.neighbourhood_cleansed)) = n.neighbourhood_key

left join {{ ref('int_review_activity') }} ra
    on l.listing_id = ra.listing_id

left join {{ ref('int_review_text') }} rt
    on l.listing_id = rt.listing_id