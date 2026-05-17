with source as (

    select *
    from {{ source('staging', 'raw_listings') }}

),

renamed as (

    select
        id::varchar as listing_id,
        listing_url,
        scrape_id::varchar as scrape_id,
        try_to_date(last_scraped) as last_scraped_date,
        source as scrape_source,

        name as listing_name,
        description,
        neighborhood_overview,
        picture_url,

        host_id::varchar as host_id,
        host_url,
        host_name,
        try_to_date(host_since) as host_since_date,
        host_location,
        host_about,
        host_response_time,


        try_to_double(replace(host_response_rate, '%', '')) / 100 as host_response_rate,
        try_to_double(replace(host_acceptance_rate, '%', '')) / 100 as host_acceptance_rate,

        case
            when host_is_superhost = 't' then true
            when host_is_superhost = 'f' then false
            else null
        end as is_superhost,

        host_thumbnail_url,
        host_picture_url,
        host_neighbourhood,

        try_to_number(host_listings_count) as host_listings_count,
        try_to_number(host_total_listings_count) as host_total_listings_count,

        host_verifications,

        case
            when host_has_profile_pic = 't' then true
            when host_has_profile_pic = 'f' then false
            else null
        end as host_has_profile_pic,

        case
            when host_identity_verified = 't' then true
            when host_identity_verified = 'f' then false
            else null
        end as host_identity_verified,

        neighbourhood,
        neighbourhood_cleansed,
        neighbourhood_group_cleansed,

        try_to_double(latitude) as latitude,
        try_to_double(longitude) as longitude,

        property_type,
        room_type,

        try_to_number(accommodates) as accommodates,
        try_to_double(bathrooms) as bathrooms,
        bathrooms_text,
        try_to_number(bedrooms) as bedrooms,
        try_to_number(beds) as beds,

        amenities,

        try_to_decimal(
            replace(replace(price, '$', ''), ',', ''),
            10,
            2
        ) as price,

        try_to_number(minimum_nights) as minimum_nights,
        try_to_number(maximum_nights) as maximum_nights,

        try_to_number(minimum_minimum_nights) as minimum_minimum_nights,
        try_to_number(maximum_minimum_nights) as maximum_minimum_nights,
        try_to_number(minimum_maximum_nights) as minimum_maximum_nights,
        try_to_number(maximum_maximum_nights) as maximum_maximum_nights,

        try_to_double(minimum_nights_avg_ntm) as minimum_nights_avg_ntm,
        try_to_double(maximum_nights_avg_ntm) as maximum_nights_avg_ntm,

        calendar_updated,

        case
            when has_availability = 't' then true
            when has_availability = 'f' then false
            else null
        end as has_availability,

        try_to_number(availability_30) as availability_30,
        try_to_number(availability_60) as availability_60,
        try_to_number(availability_90) as availability_90,
        try_to_number(availability_365) as availability_365,

        try_to_date(calendar_last_scraped) as calendar_last_scraped_date,

        try_to_number(number_of_reviews) as number_of_reviews,
        try_to_number(number_of_reviews_ltm) as number_of_reviews_ltm,
        try_to_number(number_of_reviews_l30d) as number_of_reviews_l30d,

        try_to_date(first_review) as first_review_date,
        try_to_date(last_review) as last_review_date,

        try_to_double(review_scores_rating) as review_scores_rating,
        try_to_double(review_scores_accuracy) as review_scores_accuracy,
        try_to_double(review_scores_cleanliness) as review_scores_cleanliness,
        try_to_double(review_scores_checkin) as review_scores_checkin,
        try_to_double(review_scores_communication) as review_scores_communication,
        try_to_double(review_scores_location) as review_scores_location,
        try_to_double(review_scores_value) as review_scores_value,

        license,

        case
            when instant_bookable = 't' then true
            when instant_bookable = 'f' then false
            else null
        end as is_instant_bookable,

        try_to_number(calculated_host_listings_count) as calculated_host_listings_count,
        try_to_number(calculated_host_listings_count_entire_homes) as calculated_host_listings_count_entire_homes,
        try_to_number(calculated_host_listings_count_private_rooms) as calculated_host_listings_count_private_rooms,
        try_to_number(calculated_host_listings_count_shared_rooms) as calculated_host_listings_count_shared_rooms,

        try_to_double(reviews_per_month) as reviews_per_month,

        _loaded_at,
        _file_name

    from source

)

select *
from renamed