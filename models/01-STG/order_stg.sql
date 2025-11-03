{{ config(materialized="table", tags=["blt_aero"]) }}

select Order_ID,Customer_ID,Trip_ID,Price_EUR,Seat_No,Status from {{ ref ("order_raw")}}