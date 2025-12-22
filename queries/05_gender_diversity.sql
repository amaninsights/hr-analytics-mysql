-- Question 5: Gender diversity % by department (percentage of Female, Male, Other)
-- Answer:

SELECT
    dep.department,
    gender,
    COUNT(*),
    ROUND(
        COUNT(*) * 100.0 / SUM(COUNT(*)) OVER (PARTITION BY tst.dept_id),
        2
    ) AS gender_percentage
FROM test_employees tst
JOIN departments dep ON tst.dept_id = dep.dept_id
WHERE tst.termination_date IS NULL
GROUP BY tst.dept_id, gender
ORDER BY dep.department;