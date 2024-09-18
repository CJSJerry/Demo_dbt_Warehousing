WITH duplicate_installation_details AS (
  SELECT installation_detail_id, COUNT(*) AS count
  FROM {{ ref('dim_installation_details') }}
  GROUP BY installation_detail_id
  HAVING COUNT(*) > 1
)
SELECT installation_detail_id FROM duplicate_installation_details