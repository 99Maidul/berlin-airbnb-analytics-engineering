{{ config(materialized='table') }}

select
    listing_id,
    listing_url,
    listing_name,
    host_id,
    neighbourhood_cleansed,
    neighbourhood_group_cleansed,
    latitude,
    longitude,
    property_type,
    room_type,
    accommodates,
    bathrooms,
    bedrooms,
    beds,
    minimum_nights,
    maximum_nights,
    is_instant_bookable,
    has_availability,
    price_segment,
    review_volume_segment,
    _loaded_at
from {{ ref('silver_listings') }}