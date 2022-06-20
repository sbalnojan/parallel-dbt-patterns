/*
    Welcome to
*/

{{ config(materialized='table') }}
with order_stats as (
select * from {{ ref('3_order_stats_l10000') }}
union select * from {{ ref('3_order_stats_l20000') }}
union select * from {{ ref('3_order_stats_l30000') }}
union select * from {{ ref('3_order_stats_l40000') }}
union select * from {{ ref('3_order_stats_l50000') }}
)
select * from order_stats 
left join
    {{ source('public', 'source_mkt') }} on
        order_stats.cid = {{ source('public', 'source_mkt') }}.id
-- time: 9 s
