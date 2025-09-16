# Write your MySQL query statement below
SELECT
    DISTINCT tweet_id
FROM
    tweets
WHERE
    LENGTH(content) > 15