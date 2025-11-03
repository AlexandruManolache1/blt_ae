{{ config(materialized="table", tags=["blt_aero"]) }}


select
    cs.customer_id,
    cs.name as customer_bk,
    ifnull(cs.customer_group_id,0) as customer_group_id,
    cs.email,
    cs.phone_number,
    csg.type as customer_group_type,
    csg.name as customer_group_name,
    csg.registry_number as customer_group_registry_number
from {{ ref("customer") }} cs
left join {{ ref("customer_group") }} csg on cs.customer_id = csg.id
where
1=1
and cs.name is not null

