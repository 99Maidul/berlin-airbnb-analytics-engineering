{{ config(materialized='ephemeral') }}

with hosts as (

    select *
    from {{ ref('bronze_listings') }}

),

deduped as (

    select *
    from hosts
    qualify row_number() over (
        partition by host_id
        order by _loaded_at desc
    ) = 1

)

select
    host_id,
    host_name,
    host_since_date,
    host_location,
    host_response_time,
    host_response_rate,
    host_acceptance_rate,
    is_superhost,
    host_neighbourhood,
    host_listings_count,
    host_total_listings_count,
    host_has_profile_pic,
    host_identity_verified,
    _loaded_at
from deduped
where host_id is not null