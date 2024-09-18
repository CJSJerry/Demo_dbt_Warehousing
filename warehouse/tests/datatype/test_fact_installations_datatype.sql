WITH column_types AS (
    SELECT
        column_name,
        data_type
    FROM
        information_schema.columns
    WHERE
        table_name = 'fact_installations'
)
SELECT
    column_name,
    data_type
FROM
    column_types
WHERE
    (column_name IN ('installation_id', 'product_id', 'customer_id', 'installation_date_key', 'installation_detail_id') 
    AND data_type != 'integer')