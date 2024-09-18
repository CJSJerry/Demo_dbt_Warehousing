WITH customers AS (
    SELECT
        c.id AS customer_id,
        c.name AS customer_name,
        c.email,
        c.country_id,
        co.name AS country_name,
        co.region,
        c.premium_customer::boolean AS is_premium_customer
    FROM {{ source('source_data', 'customer') }} c
    JOIN {{ source('source_data', 'country') }} co
    ON c.country_id = co.id
)
SELECT * FROM customers