WITH source_data AS (
  SELECT id FROM {{ source('source_data', 'installation') }}
),
warehouse_data AS (
  SELECT installation_id FROM {{ ref('fact_installations') }}
)
SELECT s.id
FROM source_data s
LEFT JOIN warehouse_data w
ON s.id = w.installation_id
WHERE w.installation_id IS NULL
