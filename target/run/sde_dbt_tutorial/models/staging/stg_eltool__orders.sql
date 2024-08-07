
  
  create view "dbt"."main"."stg_eltool__orders__dbt_tmp" as (
    with source as (
    select *
    from './raw_data/orders.csv'
),

renamed as (
    select
        order_id,
        customer_id,
        order_status,
        order_purchase_timestamp::TIMESTAMP AS order_purchase_timestamp,
        order_approved_at::TIMESTAMP AS order_approved_at,
        order_delivered_carrier_date::TIMESTAMP AS order_delivered_carrier_date,
        order_delivered_customer_date::TIMESTAMP AS order_delivered_customer_date,
        order_estimated_delivery_date::TIMESTAMP AS order_estimated_delivery_date
    from source
)

select *
from renamed
  );
