WITH missing_installations AS (
  SELECT d.installation_detail_id
  FROM {{ ref('dim_installation_details') }} d
  LEFT JOIN {{ source('source_data', 'installation') }} s
  ON d.installation_detail_id = s.id
  WHERE s.id IS NULL
)
SELECT installation_detail_id FROM missing_installations