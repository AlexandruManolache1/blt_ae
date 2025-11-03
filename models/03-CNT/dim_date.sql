{{ config(materialized="table", tags=["blt_aero"]) }}

with
    raw_generated_data as (
        {{ dbt_date.get_date_dimension("2000-01-01", "2050-12-31") }}
    )
select
     CAST(date_format(date_day, 'yyyyMMdd') AS INT) AS date_id,
    date_day as date_bk,
    raw_generated_data.*
    from raw_generated_data
    order by 1 asc