{{ config(materialized="table", tags=["blt_aero"]) }}


with airpl_list as 
(
    select distinct airplane_model ,manufacturer
     from {{ ref("aeroplane") }}
)
select
    row_number() over (order by ae.airplane_model) as airplane_id,
    ae.airplane_model as airplane_bk,
    ae.manufacturer,
    aem.max_seats,
    aem.max_weight,
    aem.max_distance,
    aem.engine_type
from airpl_list ae
left join {{ ref("aeroplane_model") }} aem on ae.airplane_model = aem.model
where 1=1
and  ae.airplane_model is not null
