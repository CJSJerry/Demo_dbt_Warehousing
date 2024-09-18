WITH missing_dim_products AS (
  SELECT f.installation_id
  FROM {{ ref('fact_installations') }} f
  LEFT JOIN {{ ref('dim_products') }} p
  ON f.product_id = p.product_id
  WHERE p.product_id IS NULL
),
missing_dim_customers AS (
  SELECT f.installation_id
  FROM {{ ref('fact_installations') }} f
  LEFT JOIN {{ ref('dim_customers') }} c
  ON f.customer_id = c.customer_id
  WHERE c.customer_id IS NULL
),
missing_dim_dates AS (
  SELECT f.installation_id
  FROM {{ ref('fact_installations') }} f
  LEFT JOIN {{ ref('dim_dates') }} d
  ON f.installation_date_key = d.date_key
  WHERE d.date_key IS NULL
),
missing_dim_installation_details AS (
  SELECT f.installation_id
  FROM {{ ref('fact_installations') }} f
  LEFT JOIN {{ ref('dim_installation_details') }} d
  ON f.installation_detail_id = d.installation_detail_id
  WHERE d.installation_detail_id IS NULL
)
SELECT installation_id FROM missing_dim_products
UNION
SELECT installation_id FROM missing_dim_customers
UNION
SELECT installation_id FROM missing_dim_dates
UNION
SELECT installation_id FROM missing_dim_installation_details