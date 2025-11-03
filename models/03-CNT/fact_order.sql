{{ config(materialized="table", tags=["blt_aero"]) }}


select 
order_id
,customer_id
,trip_id
,price_eur
,ds.seat_id
from 
{{ ref('order') }} or 
left join {{ ref('dim_seat') }} ds on or.seat_no  = ds.seat_bk
left join {{ ref('dim_status') }} dst on or.status = dst.status_bk