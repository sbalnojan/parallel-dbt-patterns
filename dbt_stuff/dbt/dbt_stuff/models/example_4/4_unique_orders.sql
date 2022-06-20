/*
    Welcome to
*/

{{ config(materialized='table') }}

with unique_orders as (
    select id, max(customer_id) as cid, sum(amount) as amount, max(source) as source
    from {{ source('public', 'source_orders') }}
    where {{ source('public', 'source_orders') }}.id between 1 and 1000000
    group by id
) -- have already dome some optimization, not one mega join, but a subquery...

select * from unique_orders
