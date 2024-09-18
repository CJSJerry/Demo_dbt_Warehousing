WITH missing_installations AS (
  SELECT d.date_key
  FROM {{ ref('dim_dates') }} d
  LEFT JOIN {{ source('source_data', 'installation') }} s
  ON TO_CHAR(s.installation_date, 'YYYYMMDD')::INT = d.date_key
  WHERE s.installation_date IS NULL
)
SELECT date_key FROM missing_installations