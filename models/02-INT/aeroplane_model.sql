{{ config(materialized="view", tags=["blt_aero"]) }}

select
    trim(manufacturer) as manufacturer,
    trim(model) as model,
    trim(max_seats) as max_seats,
    trim(max_weight) as max_weight,
    trim(max_distance) as max_distance,
    trim(engine_type) as engine_type
from {{ ref("aeroplane_model_stg") }}
