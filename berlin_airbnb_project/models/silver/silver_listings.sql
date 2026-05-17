with listings as (

    select *
    from {{ ref('bronze_listings') }}

),

cleaned as (

    select
        listing_id,

        listing_url,
        listing_name,
        description,
        neighborhood_overview,
        picture_url,

        host_id,

        neighbourhood,
        neighbourhood_cleansed,
        neighbourhood_group_cleansed,

        latitude,
        longitude,

        property_type,
        room_type,

        accommodates,
        bathrooms,
        bathrooms_text,
        bedrooms,
        beds,

        price,

        minimum_nights,
        maximum_nights,

        availability_30,
        availability_60,
        availability_90,
        availability_365,

        number_of_reviews,
        number_of_reviews_ltm,
        number_of_reviews_l30d,

        first_review_date,
        last_review_date,

        review_scores_rating,
        review_scores_accuracy,
        review_scores_cleanliness,
        review_scores_checkin,
        review_scores_communication,
        review_scores_location,
        review_scores_value,

        is_instant_bookable,
        has_availability,

        -- derived listing metrics
        case
            when accommodates > 0 then price / accommodates
            else null
        end as price_per_guest,

        case
            when bedrooms > 0 then price / bedrooms
            else null
        end as price_per_bedroom,

        365 - availability_365 as estimated_booked_days_365,

        case
            when availability_365 is not null
                then round((365 - availability_365) / 365.0, 4)
            else null
        end as estimated_occupancy_rate_365,

        case
            when price is not null and availability_365 is not null
                then price * (365 - availability_365)
            else null
        end as estimated_annual_revenue,

        case
            when number_of_reviews >= 100 then 'high_review_volume'
            when number_of_reviews >= 25 then 'medium_review_volume'
            when number_of_reviews > 0 then 'low_review_volume'
            else 'no_reviews'
        end as review_volume_segment,

        case
            when price >= 200 then 'premium'
            when price >= 100 then 'mid_market'
            when price > 0 then 'budget'
            else 'unknown'
        end as price_segment,

        _loaded_at,
        _file_name

    from listings

    where listing_id is not null

)

select *
from cleaned