WITH duplicate_products AS (
  SELECT product_id, COUNT(*) AS count
  FROM {{ ref('dim_products') }}
  GROUP BY product_id
  HAVING COUNT(*) > 1
)
SELECT product_id FROM duplicate_products