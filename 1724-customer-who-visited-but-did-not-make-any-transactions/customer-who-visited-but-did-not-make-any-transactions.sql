SELECT
    customer_id,
    COUNT(*) AS count_no_trans
FROM (
    SELECT
        v.customer_id,
        v.visit_id
    FROM visits v
    LEFT JOIN transactions t 
        ON v.visit_id = t.visit_id
    GROUP BY v.visit_id, v.customer_id
    HAVING SUM(CASE WHEN t.amount IS NOT NULL THEN 1 ELSE 0 END) = 0
) sub
GROUP BY customer_id