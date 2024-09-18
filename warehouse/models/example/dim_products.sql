WITH products AS (
    SELECT
        p.id AS product_id,
        p.reference AS product_reference,
        p.name AS product_name,
        p.price::FLOAT,
        p.category_id,
        pc.name AS category_name
    FROM {{ source('source_data', 'product') }} p
    JOIN {{ source('source_data', 'product_category') }} pc
    ON p.category_id = pc.id
)
SELECT * FROM products