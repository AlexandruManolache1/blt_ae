{{ config(materialized="table", tags=["blt_aero"]) }}

select * from {{ ref('aeroplane_raw') }}