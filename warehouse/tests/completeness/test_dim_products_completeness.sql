WITH source_data AS (
  SELECT id FROM {{ source('source_data', 'product') }}
),
warehouse_data AS (
  SELECT product_id FROM {{ ref('dim_products') }}
)
SELECT s.id
FROM source_data s
LEFT JOIN warehouse_data w
ON s.id = w.product_id
WHERE w.product_id IS NULL
