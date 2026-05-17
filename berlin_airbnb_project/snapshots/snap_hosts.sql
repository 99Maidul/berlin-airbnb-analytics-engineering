{% snapshot snap_hosts %}

{{
    config(
        target_schema='snapshots',
        unique_key='host_id',
        strategy='check',
        check_cols=[
            'host_name',
            'host_location',
            'host_response_time',
            'host_response_rate',
            'host_acceptance_rate',
            'is_superhost',
            'host_listings_count',
            'host_total_listings_count',
            'host_identity_verified'
        ]
    )
}}

select *
from {{ ref('dim_hosts') }}

{% endsnapshot %}