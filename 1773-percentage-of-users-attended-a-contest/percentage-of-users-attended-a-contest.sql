# Write your MySQL query statement below
SELECT
    r.contest_id,
    ROUND(COUNT(DISTINCT r.user_id) / (SELECT COUNT(*) FROM users) * 100, 2) AS percentage
FROM register r
LEFT JOIN users u ON r.user_id = u.user_id
GROUP BY
    contest_id
ORDER BY
    percentage DESC,
    contest_id ASC