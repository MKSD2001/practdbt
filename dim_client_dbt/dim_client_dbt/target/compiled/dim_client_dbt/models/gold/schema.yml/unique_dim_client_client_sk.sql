
    
    

select
    client_sk as unique_field,
    count(*) as n_records

from SNOWFLAKE_RND.gold.dim_client
where client_sk is not null
group by client_sk
having count(*) > 1


