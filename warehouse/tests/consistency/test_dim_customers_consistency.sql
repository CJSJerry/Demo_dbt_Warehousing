WITH missing_country AS (
  SELECT c.customer_id
  FROM {{ ref('dim_customers') }} c
  LEFT JOIN {{ source('source_data', 'country') }} s
  ON c.country_id = s.id
  WHERE s.id IS NULL
)
SELECT customer_id FROM missing_country