select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    

with all_values as (

    select
        is_current_flag as value_field,
        count(*) as n_records

    from PROD_DB.gold.dim_client
    group by is_current_flag

)

select *
from all_values
where value_field not in (
    'Y','N'
)



      
    ) dbt_internal_test