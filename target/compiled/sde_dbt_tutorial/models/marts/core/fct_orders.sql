with orders as (
    select *
    from "dbt"."main"."stg_eltool__orders"
)

select * from orders