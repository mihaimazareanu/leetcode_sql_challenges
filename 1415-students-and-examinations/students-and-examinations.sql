# Write your MySQL query statement below
WITH student_subjects AS (
    SELECT 
        st.student_id,
        st.student_name,
        su.subject_name
    FROM students st
    CROSS JOIN subjects su
)
SELECT 
    ss.student_id,
    ss.student_name,
    ss.subject_name,
    COUNT(ex.subject_name) AS attended_exams
FROM student_subjects ss
LEFT JOIN examinations ex
    ON ss.student_id = ex.student_id
   AND ss.subject_name = ex.subject_name
GROUP BY
    ss.student_id,
    ss.student_name,
    ss.subject_name
ORDER BY
    ss.student_id,
    ss.subject_name