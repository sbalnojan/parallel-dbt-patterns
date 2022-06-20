/*
    Welcome to
*/

{{ config(materialized='table') }}

with order_stats as (
    select
        {{ source('public', 'source_orders') }}.customer_id as cid,
        source,
        count(*)
    from {{ source('public', 'source_orders') }}
    left join {{ source('public', 'source_customers') }}
        on
            {{ source('public', 'source_orders') }}.customer_id = {{ source('public', 'source_customers') }}.id
    group by cid, source
) -- have already dome some optimization, not one mega join, but a subquery...

select * from order_stats
left join
    {{ source('public', 'source_mkt') }} on
        order_stats.cid = {{ source('public', 'source_mkt') }}.id
-- time: 9 s
