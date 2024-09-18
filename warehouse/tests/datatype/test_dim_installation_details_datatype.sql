WITH column_types AS (
    SELECT
        column_name,
        data_type
    FROM
        information_schema.columns
    WHERE
        table_name = 'dim_installation_details'
)
SELECT
    column_name,
    data_type
FROM
    column_types
WHERE
    (column_name = 'installation_detail_id' AND data_type != 'integer')
    OR (column_name IN ('installation_name', 'description') AND data_type != 'character varying')
    