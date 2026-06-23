select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select client_sk
from PROD_DB.gold.dim_client
where client_sk is null



      
    ) dbt_internal_test