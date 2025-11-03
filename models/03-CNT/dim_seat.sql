{{ config(materialized="table", tags=["blt_aero"]) }}

with seats as (
select distinct seat_no as seat
from 
{{ ref('order') }}
)
select row_number() over (order by seat) as seat_id
,seat as seat_bk
from seats
order by 1 asc

