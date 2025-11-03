{{ config(materialized="table", tags=["blt_aero"]) }}

select * from  {{ ref("customer_group_raw")}}