WITH source_data AS (
  SELECT id FROM {{ source('source_data', 'installation') }}
),
warehouse_data AS (
  SELECT installation_detail_id FROM {{ ref('dim_installation_details') }}
)
SELECT s.id
FROM source_data s
LEFT JOIN warehouse_data w
ON s.id = w.installation_detail_id
WHERE w.installation_detail_id IS NULL
