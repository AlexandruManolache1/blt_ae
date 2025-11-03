{{ config(materialized="view", tags=["blt_aero"]) }}

select
    trim(Airplane_ID) as Airplane_ID,
    trim(Airplane_Model) as Airplane_Model,
    trim(manufacturer) as manufacturer
from {{ ref("aeroplane_stg") }}
