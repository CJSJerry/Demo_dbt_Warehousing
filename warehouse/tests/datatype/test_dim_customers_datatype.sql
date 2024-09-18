WITH column_types AS (
    SELECT
        column_name,
        data_type
    FROM
        information_schema.columns
    WHERE
        table_name = 'dim_customers'
)
SELECT
    column_name,
    data_type
FROM
    column_types
WHERE
    (column_name IN ('customer_id', 'country_id') AND data_type != 'integer')
    OR (column_name IN ('customer_name', 'email', 'country_name', 'region') AND data_type != 'character varying')
    OR (column_name = 'is_premium_customer' AND data_type != 'boolean')
