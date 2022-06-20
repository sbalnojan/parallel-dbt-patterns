/*
    Welcome to
*/

{{ config(materialized='table') }}

with unique_orders as (
    select id, max(customer_id) as cid, sum(amount) as amount, max(source) as source
    from {{ source('public', 'source_orders') }}
    where {{ source('public', 'source_orders') }}.id between 25001 and 50000
    group by id
) 

select * from unique_orders
