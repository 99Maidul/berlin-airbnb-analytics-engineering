{{ config(materialized='table') }}

select
    neighbourhood_key,
    neighbourhood_name,
    neighbourhood_group_key,
    neighbourhood_group_name,
    has_neighbourhood_group,
    _loaded_at
from {{ ref('silver_neighbourhoods') }}