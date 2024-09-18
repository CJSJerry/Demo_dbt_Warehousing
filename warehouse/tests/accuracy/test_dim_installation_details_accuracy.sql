WITH source_data AS (
  SELECT id AS installation_detail_id, name AS installation_name, description
  FROM {{ source('source_data', 'installation') }}
),
warehouse_data AS (
  SELECT installation_detail_id, installation_name, description
  FROM {{ ref('dim_installation_details') }}
)
SELECT s.installation_detail_id
FROM source_data s
LEFT JOIN warehouse_data w
ON s.installation_detail_id = w.installation_detail_id
WHERE s.installation_name != w.installation_name
   OR s.description != w.description