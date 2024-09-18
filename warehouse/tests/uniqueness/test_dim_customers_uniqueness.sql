WITH duplicate_customers AS (
  SELECT customer_id, COUNT(*) AS count
  FROM {{ ref('dim_customers') }}
  GROUP BY customer_id
  HAVING COUNT(*) > 1
)
SELECT customer_id FROM duplicate_customers