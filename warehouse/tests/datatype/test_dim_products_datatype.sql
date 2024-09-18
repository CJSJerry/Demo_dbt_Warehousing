WITH column_types AS (
    SELECT
        column_name,
        data_type
    FROM
        information_schema.columns
    WHERE
        table_name = 'dim_products'
)
SELECT
    column_name,
    data_type
FROM
    column_types
WHERE
    (column_name IN ('product_id', 'category_id') AND data_type != 'integer')
    OR (column_name IN ('product_reference', 'product_name', 'category_name') AND data_type != 'character varying')
    OR (column_name = 'price' AND data_type != 'double precision')
