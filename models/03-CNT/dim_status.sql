{{ config(materialized="table", tags=["blt_aero"]) }}

with status as (
select distinct status
from 
{{ ref('order') }}
)
select row_number() over (order by status) as status_id
,status as status_bk
from status
order by 1 asc

