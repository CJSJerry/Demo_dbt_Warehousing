WITH installations AS (
    SELECT
        i.id AS installation_id,
        i.product_id,
        i.customer_id,
        TO_CHAR(i.installation_date, 'YYYYMMDD')::INT AS installation_date_key,
        i.id AS installation_detail_id
    FROM {{ source('source_data', 'installation') }} i
)
SELECT * FROM installations