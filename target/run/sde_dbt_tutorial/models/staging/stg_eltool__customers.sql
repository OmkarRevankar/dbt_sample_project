
  
  create view "dbt"."main"."stg_eltool__customers__dbt_tmp" as (
    with source as (
    select *
    from "dbt"."snapshots"."customers_snapshot"
),

renamed as (
    select
        customer_id,
        zipcode,
        city,
        state_code,
        datetime_created::TIMESTAMP as datetime_created,
        datetime_updated::TIMESTAMP as datetime_updated,
        dbt_valid_from,
        dbt_valid_to
    from source
)

select *
from renamed
  );
