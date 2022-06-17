
/*
    Welcome to 
*/

{{ config(materialized='table') }}

select
  *

from {{ source('webshop', 'orders') }}
