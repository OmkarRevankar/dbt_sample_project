
  
    
    

    create  table
      "dbt"."main"."fct_orders__dbt_tmp"
  
    as (
      with orders as (
    select *
    from "dbt"."main"."stg_eltool__orders"
)

select * from orders
    );
  
  