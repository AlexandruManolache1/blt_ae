{{ config(materialized="view", tags=["blt_aero"]) }}

select customer_id,name,customer_group_id,email,phone_number from {{ ref ("customer_stg")}}