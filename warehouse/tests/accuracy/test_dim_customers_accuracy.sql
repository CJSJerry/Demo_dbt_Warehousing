WITH source_data AS (
  SELECT c.id AS customer_id, c.name AS customer_name, c.email, c.country_id, co.name AS country_name, c.premium_customer::boolean
  FROM {{ source('source_data', 'customer') }} c
  JOIN {{ source('source_data', 'country') }} co
  ON c.country_id = co.id
),
warehouse_data AS (
  SELECT customer_id, customer_name, email, country_id, country_name, is_premium_customer
  FROM {{ ref('dim_customers') }}
)
SELECT s.customer_id
FROM source_data s
LEFT JOIN warehouse_data w
ON s.customer_id = w.customer_id
WHERE s.customer_name != w.customer_name
   OR s.email != w.email
   OR s.country_id != w.country_id
   OR s.country_name != w.country_name
   OR s.premium_customer != w.is_premium_customer