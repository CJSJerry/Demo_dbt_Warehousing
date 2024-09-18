WITH column_types AS (
    SELECT
        column_name,
        data_type
    FROM
        information_schema.columns
    WHERE
        table_name = 'dim_dates'
)
SELECT
    column_name,
    data_type
FROM
    column_types
WHERE
    (column_name IN ('date_key', 'day', 'month', 'quarter', 'year') AND data_type != 'integer')
    OR (column_name = 'date' AND data_type != 'date')
