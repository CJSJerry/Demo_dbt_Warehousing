WITH source_data AS (
  SELECT DISTINCT
    installation_date AS date
  FROM {{ source('source_data', 'installation') }}
),
warehouse_data AS (
  SELECT date FROM {{ ref('dim_dates') }}
)
SELECT s.date
FROM source_data s
LEFT JOIN warehouse_data w
ON s.date = w.date
WHERE w.date IS NULL
