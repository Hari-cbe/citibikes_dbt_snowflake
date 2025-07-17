{{config( materialized =  "table" )}}


WITH CTE AS (
    SELECT 
        TO_VARCHAR(TO_TIMESTAMP(STARTED_AT),'yyyy-mm-dd HH24:MI:SS') as started_at
        , DATE(TO_TIMESTAMP(STARTED_AT)) as start_date
        , CAST(TO_VARCHAR(TO_DATE(TO_TIMESTAMP(STARTED_AT)),'YYYYMM') AS INT) as calmthnum
        , MONTH(TO_TIMESTAMP(STARTED_AT)) as started_month
        , HOUR(TO_TIMESTAMP(STARTED_AT)) as started_hour
        , {{ check_season( 'MONTH(TO_TIMESTAMP(STARTED_AT))' ) }} as season
        
    FROM {{source('demo','BIKE')}}
    WHERE STARTED_AT != 'started_at'
)

SELECT * FROM CTE