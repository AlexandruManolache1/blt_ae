{{ config(materialized="table", tags=["blt_aero"]) }}

with cities as (
select distinct oc.origin_city as city
from 
{{ ref('trip') }} oc
union 
select distinct dc.destination_city 
from 
{{ ref('trip') }} dc
)
select row_number() over (order by city) as city_id
,city as city_bk
from cities
order by 1 asc

