WITH source_data AS (
  SELECT DISTINCT installation_date AS date
  FROM {{ source('source_data', 'installation') }}
),
warehouse_data AS (
  SELECT date, day, month, quarter, year
  FROM {{ ref('dim_dates') }}
)
SELECT s.date
FROM source_data s
LEFT JOIN warehouse_data w
ON s.date = w.date
WHERE EXTRACT(DAY FROM s.date) != w.day
   OR EXTRACT(MONTH FROM s.date) != w.month
   OR EXTRACT(QUARTER FROM s.date) != w.quarter
   OR EXTRACT(YEAR FROM s.date) != w.year