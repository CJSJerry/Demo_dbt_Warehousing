WITH source_data AS (
  SELECT i.id AS installation_id, i.product_id, i.customer_id, TO_CHAR(i.installation_date, 'YYYYMMDD')::INT AS installation_date_key, i.name, i.description
  FROM {{ source('source_data', 'installation') }} i
),
warehouse_data AS (
  SELECT f.installation_id, f.product_id, f.customer_id, f.installation_date_key, d.installation_name, d.description
  FROM {{ ref('fact_installations') }} f
  JOIN {{ ref('dim_installation_details') }} d
  ON f.installation_detail_id = d.installation_detail_id
)
SELECT s.installation_id
FROM source_data s
LEFT JOIN warehouse_data w
ON s.installation_id = w.installation_id
WHERE s.product_id != w.product_id
   OR s.customer_id != w.customer_id
   OR s.installation_date_key != w.installation_date_key
   OR s.name != w.installation_name
   OR s.description != w.description