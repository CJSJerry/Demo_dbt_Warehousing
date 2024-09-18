WITH raw_dates AS (
    SELECT DISTINCT
        installation_date AS date
    FROM {{ source('source_data', 'installation') }}
),
dates AS (
    SELECT
        date AS date,
        EXTRACT(DAY FROM date) AS day,
        EXTRACT(MONTH FROM date) AS month,
        EXTRACT(QUARTER FROM date) AS quarter,
        EXTRACT(YEAR FROM date) AS year
    FROM raw_dates
)
SELECT
    TO_CHAR(date, 'YYYYMMDD')::INT AS date_key,
    date,
    day::INT,
    month::INT,
    quarter::INT,
    year::INT
FROM dates
