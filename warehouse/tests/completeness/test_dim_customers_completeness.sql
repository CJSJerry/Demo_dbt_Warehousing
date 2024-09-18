WITH source_data AS (
  SELECT id FROM {{ source('source_data', 'customer') }}
),
warehouse_data AS (
  SELECT customer_id FROM {{ ref('dim_customers') }}
)
SELECT s.id
FROM source_data s
LEFT JOIN warehouse_data w
ON s.id = w.customer_id
WHERE w.customer_id IS NULL
