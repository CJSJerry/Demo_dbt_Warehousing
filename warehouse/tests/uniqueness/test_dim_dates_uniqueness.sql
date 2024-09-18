WITH duplicate_dates AS (
  SELECT date_key, COUNT(*) AS count
  FROM {{ ref('dim_dates') }}
  GROUP BY date_key
  HAVING COUNT(*) > 1
)
SELECT date_key FROM duplicate_dates