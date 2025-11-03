{{ config(materialized="view", tags=["blt_aero"]) }}

select id, type, name, registry_number
from {{ ref("customer_group_stg") }}
