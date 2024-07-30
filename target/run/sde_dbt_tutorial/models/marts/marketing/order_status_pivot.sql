
  
  create view "dbt"."main"."order_status_pivot__dbt_tmp" as (
    SELECT
    EXTRACT(
        YEAR
        FROM
        order_approved_at
    ) AS order_year, --noqa: CV03

  
    sum(
      
      case
      when order_status = 'delivered'
        then 1
      else 0
      end
    )
    
      
            as "delivered"
      
    
    ,
  
    sum(
      
      case
      when order_status = 'shipped'
        then 1
      else 0
      end
    )
    
      
            as "shipped"
      
    
    ,
  
    sum(
      
      case
      when order_status = 'unavailable'
        then 1
      else 0
      end
    )
    
      
            as "unavailable"
      
    
    ,
  
    sum(
      
      case
      when order_status = 'canceled'
        then 1
      else 0
      end
    )
    
      
            as "canceled"
      
    
    ,
  
    sum(
      
      case
      when order_status = 'invoiced'
        then 1
      else 0
      end
    )
    
      
            as "invoiced"
      
    
    ,
  
    sum(
      
      case
      when order_status = 'processing'
        then 1
      else 0
      end
    )
    
      
            as "processing"
      
    
    
  

FROM
    "dbt"."main"."customer_orders"
GROUP BY
    1
  );
