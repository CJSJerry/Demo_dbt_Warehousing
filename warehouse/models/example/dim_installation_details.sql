WITH installation_details AS (
    SELECT
        id AS installation_detail_id,
        name AS installation_name,
        description
    FROM {{ source('source_data', 'installation') }}
)
SELECT * FROM installation_details