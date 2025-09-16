# Write your MySQL query statement below
SELECT 
    product.product_name,
    year, 
    price
FROM 
    sales
LEFT JOIN product ON sales.product_id = product.product_id