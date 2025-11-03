{{ config(materialized="view", tags=["blt_aero"]) }}

select * from {{ ref ("trip_stg")}}