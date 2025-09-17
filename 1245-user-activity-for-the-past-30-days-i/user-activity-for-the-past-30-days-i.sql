# Write your MySQL query statement below
SELECT
    activity_date AS day,
    COUNT(DISTINCT user_id) AS active_users
FROM
    activity
WHERE 
    activity_date > DATE_ADD(DATE('2019-07-27'), INTERVAL -30 DAY) AND activity_date <= DATE('2019-07-27')
GROUP BY
    day
ORDER BY
    day