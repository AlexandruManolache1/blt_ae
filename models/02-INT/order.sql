{{ config(materialized="view", tags=["blt_aero"]) }}

select * from {{ ref ("order_stg")}}