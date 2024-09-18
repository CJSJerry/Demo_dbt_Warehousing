WITH source_data AS (
  SELECT p.id AS product_id, p.reference AS product_reference, p.name AS product_name, p.price::FLOAT, p.category_id, pc.name AS category_name
  FROM {{ source('source_data', 'product') }} p
  JOIN {{ source('source_data', 'product_category') }} pc
  ON p.category_id = pc.id
),
warehouse_data AS (
  SELECT product_id, product_reference, product_name, price, category_id, category_name
  FROM {{ ref('dim_products') }}
)
SELECT s.product_id
FROM source_data s
LEFT JOIN warehouse_data w
ON s.product_id = w.product_id
WHERE s.product_reference != w.product_reference
   OR s.product_name != w.product_name
   OR s.price != w.price
   OR s.category_id != w.category_id
   OR s.category_name != w.category_name