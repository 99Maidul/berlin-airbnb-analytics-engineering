{% snapshot snap_listings %}

{{
    config(
        target_schema='snapshots',
        unique_key='listing_id',
        strategy='check',
        check_cols=[
            'price',
            'availability_30',
            'availability_60',
            'availability_90',
            'availability_365',
            'minimum_nights',
            'maximum_nights',
            'review_scores_rating',
            'is_instant_bookable'
        ]
    )
}}

select *
from {{ ref('silver_listings') }}

{% endsnapshot %}