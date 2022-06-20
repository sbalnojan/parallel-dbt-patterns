/*
    Welcome to
*/

{{ config(materialized='table') }}

select * from {{ ref('5_unique_orders_l25000') }}
union select * from {{ ref('5_unique_orders_l50000') }}
