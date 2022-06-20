/*
    Welcome to
*/

{{ config(materialized='table') }}
with order_stats as (
select * from {{ ref('3_order_stats_l2HT') }}
union select * from {{ ref('3_order_stats_l4HT') }}
union select * from {{ ref('3_order_stats_l6HT') }}
union select * from {{ ref('3_order_stats_l8HT') }}
union select * from {{ ref('3_order_stats_l1M') }}
)
select * from order_stats 
left join
    {{ source('public', 'source_mkt') }} on
        order_stats.cid = {{ source('public', 'source_mkt') }}.id
-- time: 9 s
