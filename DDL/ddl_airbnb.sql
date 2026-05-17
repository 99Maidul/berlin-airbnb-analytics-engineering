CREATE OR REPLACE TABLE Airbnb_Berlin.staging.raw_listings (

    id VARCHAR,
    listing_url VARCHAR,
    scrape_id VARCHAR,
    last_scraped VARCHAR,
    source VARCHAR,

    name VARCHAR,
    description VARCHAR,
    neighborhood_overview VARCHAR,
    picture_url VARCHAR,

    host_id VARCHAR,
    host_url VARCHAR,
    host_name VARCHAR,
    host_since VARCHAR,
    host_location VARCHAR,
    host_about VARCHAR,

    host_response_time VARCHAR,
    host_response_rate VARCHAR,
    host_acceptance_rate VARCHAR,
    host_is_superhost VARCHAR,

    host_thumbnail_url VARCHAR,
    host_picture_url VARCHAR,
    host_neighbourhood VARCHAR,

    host_listings_count VARCHAR,
    host_total_listings_count VARCHAR,

    host_verifications VARCHAR,
    host_has_profile_pic VARCHAR,
    host_identity_verified VARCHAR,

    neighbourhood VARCHAR,
    neighbourhood_cleansed VARCHAR,
    neighbourhood_group_cleansed VARCHAR,

    latitude VARCHAR,
    longitude VARCHAR,

    property_type VARCHAR,
    room_type VARCHAR,

    accommodates VARCHAR,
    bathrooms VARCHAR,
    bathrooms_text VARCHAR,
    bedrooms VARCHAR,
    beds VARCHAR,

    amenities VARCHAR,

    price VARCHAR,

    minimum_nights VARCHAR,
    maximum_nights VARCHAR,

    minimum_minimum_nights VARCHAR,
    maximum_minimum_nights VARCHAR,

    minimum_maximum_nights VARCHAR,
    maximum_maximum_nights VARCHAR,

    minimum_nights_avg_ntm VARCHAR,
    maximum_nights_avg_ntm VARCHAR,

    calendar_updated VARCHAR,

    has_availability VARCHAR,

    availability_30 VARCHAR,
    availability_60 VARCHAR,
    availability_90 VARCHAR,
    availability_365 VARCHAR,

    calendar_last_scraped VARCHAR,

    number_of_reviews VARCHAR,
    number_of_reviews_ltm VARCHAR,
    number_of_reviews_l30d VARCHAR,

    first_review VARCHAR,
    last_review VARCHAR,

    review_scores_rating VARCHAR,
    review_scores_accuracy VARCHAR,
    review_scores_cleanliness VARCHAR,
    review_scores_checkin VARCHAR,
    review_scores_communication VARCHAR,
    review_scores_location VARCHAR,
    review_scores_value VARCHAR,

    license VARCHAR,

    instant_bookable VARCHAR,

    calculated_host_listings_count VARCHAR,
    calculated_host_listings_count_entire_homes VARCHAR,
    calculated_host_listings_count_private_rooms VARCHAR,
    calculated_host_listings_count_shared_rooms VARCHAR,

    reviews_per_month VARCHAR,

    -- Metadata columns
    _loaded_at TIMESTAMP_NTZ DEFAULT CURRENT_TIMESTAMP(),
    _file_name VARCHAR
);

CREATE OR REPLACE TABLE Airbnb_Berlin.staging.raw_reviews (
    listing_id VARCHAR,
    date VARCHAR,
    _loaded_at TIMESTAMP_NTZ DEFAULT CURRENT_TIMESTAMP(),
    _file_name VARCHAR
);
CREATE OR REPLACE TABLE Airbnb_Berlin.staging.raw_neighbourhoods (

    neighbourhood_group VARCHAR,
    neighbourhood VARCHAR,

    -- Metadata columns
    _loaded_at TIMESTAMP_NTZ DEFAULT CURRENT_TIMESTAMP(),
    _file_name VARCHAR
);
CREATE OR REPLACE TABLE Airbnb_Berlin.staging.raw_reviews_all (

    listing_id VARCHAR,
    id VARCHAR,
    date VARCHAR,

    reviewer_id VARCHAR,
    reviewer_name VARCHAR,

    comments VARCHAR,

    -- Metadata columns
    _loaded_at TIMESTAMP_NTZ DEFAULT CURRENT_TIMESTAMP(),
    _file_name VARCHAR
);