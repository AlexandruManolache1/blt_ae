{{ config(materialized="table", tags=["blt_aero"]) }}

select Trip_ID,Origin_City,Destination_City,Airplane_ID,Start_Timestamp,End_Timestamp from {{ ref ("trip_raw")}}