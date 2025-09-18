# Write your MySQL query statement below

SELECT
    s.product_id,
    sa.year AS first_year,
    s.quantity,
    s.price
FROM
    sales s
JOIN (
    SELECT
        product_id,
        MIN(year) AS year
    FROM
        sales
    GROUP BY
        product_id
) sa
ON s.product_id = sa.product_id
AND s.year = sa.year