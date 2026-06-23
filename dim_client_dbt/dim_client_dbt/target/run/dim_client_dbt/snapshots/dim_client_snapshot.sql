
      
  
    

        create or replace transient table PROD_DB.gold.dim_client_snapshot
         as
        (
    

    select *,
        md5(coalesce(cast(client_id as varchar ), '')
         || '|' || coalesce(cast(to_timestamp_ntz(convert_timezone('UTC', current_timestamp())) as varchar ), '')
        ) as dbt_scd_id,
        to_timestamp_ntz(convert_timezone('UTC', current_timestamp())) as dbt_updated_at,
        to_timestamp_ntz(convert_timezone('UTC', current_timestamp())) as dbt_valid_from,
        
  
  coalesce(nullif(to_timestamp_ntz(convert_timezone('UTC', current_timestamp())), to_timestamp_ntz(convert_timezone('UTC', current_timestamp()))), null)
  as dbt_valid_to
from (
        



select * from PROD_DB.silver.silver_client

    ) sbq



        );
      
  
  