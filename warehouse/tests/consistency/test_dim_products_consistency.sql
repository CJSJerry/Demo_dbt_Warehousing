WITH missing_category AS (
  SELECT p.product_id
  FROM {{ ref('dim_products') }} p
  LEFT JOIN {{ source('source_data', 'product_category') }} s
  ON p.category_id = s.id
  WHERE s.id IS NULL
)
SELECT product_id FROM missing_category