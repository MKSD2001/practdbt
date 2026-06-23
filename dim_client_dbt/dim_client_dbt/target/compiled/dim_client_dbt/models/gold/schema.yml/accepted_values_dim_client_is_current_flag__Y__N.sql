
    
    

with all_values as (

    select
        is_current_flag as value_field,
        count(*) as n_records

    from SNOWFLAKE_RND.gold.dim_client
    group by is_current_flag

)

select *
from all_values
where value_field not in (
    'Y','N'
)


