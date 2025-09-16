# Write your MySQL query statement below
with process_table AS (
SELECT
    machine_id,
    process_id,
    MAX(CASE activity_type WHEN 'end' THEN timestamp END) - MAX(CASE activity_type WHEN 'start' THEN timestamp END) AS process_time
FROM 
    activity
GROUP BY
    machine_id,
    process_id
)
SELECT
    machine_id,
    ROUND(AVG(process_time), 3) AS processing_time
FROM 
    process_table
GROUP BY
    machine_id