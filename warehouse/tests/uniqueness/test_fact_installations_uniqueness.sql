WITH duplicate_installations AS (
  SELECT installation_id, COUNT(*) AS count
  FROM {{ ref('fact_installations') }}
  GROUP BY installation_id
  HAVING COUNT(*) > 1
)
SELECT installation_id FROM duplicate_installations