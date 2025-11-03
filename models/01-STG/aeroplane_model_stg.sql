{{ config(materialized="table", tags=["blt_aero"]) }}

with
    dt_ as (select aeroplane_model from {{ ref("aeroplane_model_raw") }}),

    final as (
        select
            manufacturer,
            model,
            details.max_seats,
            details.max_weight,
            details.max_distance,
            details.engine_type
        from dt_
        lateral view
            explode(
                from_json(
                    aeroplane_model,
                    'map<string, map<string, struct<max_seats:int, max_weight:int, max_distance:int, engine_type:string>>>'
                )
            ) t1 as manufacturer,
            models
        lateral view explode(models) t2 as model, details
    )
select *
from final