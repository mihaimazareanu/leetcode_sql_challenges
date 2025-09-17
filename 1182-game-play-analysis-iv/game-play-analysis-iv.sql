# Write your MySQL query statement below
SELECT 
    ROUND(
        COUNT(DISTINCT CASE 
            WHEN a2.player_id IS NOT NULL 
            THEN a1.player_id 
            END) 
        / COUNT(DISTINCT a1.player_id), 
        2
    ) AS fraction
FROM (
    SELECT 
        player_id, 
        MIN(event_date) AS first_login
    FROM 
        activity
    GROUP BY 
        player_id
) a1
LEFT JOIN activity a2 ON 
    a1.player_id = a2.player_id
   AND a2.event_date = DATE_ADD(a1.first_login, INTERVAL 1 DAY)