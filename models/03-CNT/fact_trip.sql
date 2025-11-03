{{ config(materialized="table", tags=["blt_aero"]) }}



with air_nk_sk as 
(   select distinct s.airplane_id as nk,d.airplane_id as sk from 
    {{ ref("aeroplane") }} s 
    inner join {{ ref('dim_airplane') }} d on s.airplane_model = d.airplane_bk
)
select 
trip_id,
ds.city_id as destination_city_id,
os.city_id as origin_city_id,
dd1.date_id as departure_date_id,
dd2.date_id as arrival_date_id,
air_nk_sk.sk as airplane_id,
(unix_timestamp(t.End_Timestamp)  - unix_timestamp(t.Start_Timestamp))/60 trip_duration_min
from 
{{ ref('trip') }}  t
left join {{ ref('dim_city') }} os on t.Origin_City = os.city_bk
left join {{ ref('dim_city') }} ds on t.Destination_City = ds.city_bk
left join {{ ref('dim_date') }} dd1 on cast(t.Start_Timestamp as date) = dd1.date_bk
left join {{ ref('dim_date') }} dd2 on cast(t.End_Timestamp as date) = dd2.date_bk
left join air_nk_sk on t.airplane_id = air_nk_sk.nk


