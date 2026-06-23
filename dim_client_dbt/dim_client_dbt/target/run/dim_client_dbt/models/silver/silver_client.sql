
  
    

        create or replace transient table PROD_DB.silver.silver_client
         as
        (WITH deduped AS (

    SELECT
        *,
        ROW_NUMBER() OVER (
            PARTITION BY client_id
            ORDER BY load_ts DESC
        ) AS rn
    FROM PROD_DB.bronze.stg_client

)

SELECT
    client_id,
    client_name,
    client_type,
    region,
    risk_profile,
    status,
    source_system,
    load_ts,

    MD5(
        COALESCE(client_name, '') ||
        COALESCE(client_type, '') ||
        COALESCE(region, '') ||
        COALESCE(risk_profile, '') ||
        COALESCE(status, '')
    ) AS row_hash

FROM deduped
WHERE rn = 1
        );
      
  