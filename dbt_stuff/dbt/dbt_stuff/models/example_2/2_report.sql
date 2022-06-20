/*
    Welcome to
*/

{{ config(materialized='table') }}

select * from {{ ref('2_order_stats') }}
left join
    {{ source('public', 'source_mkt') }} on
        {{ ref('2_order_stats') }}.cid = {{ source('public', 'source_mkt') }}.id
-- time: 9 s
