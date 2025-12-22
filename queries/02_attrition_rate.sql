-- Question 2: Attrition rate overall and by department
-- (Attrition = employees who left in 2025 / average headcount in 2025)
-- Answer:

SELECT
    COUNT(CASE WHEN termination_date BETWEEN '2025-01-01' AND '2025-12-31' THEN 1 END) * 1.0 /
    (
        (SELECT COUNT(*) FROM test_employees WHERE hire_date <= '2025-01-01' AND (termination_date IS NULL OR termination_date > '2025-01-01'))
        +
        (SELECT COUNT(*) FROM test_employees WHERE hire_date <= '2025-12-31' AND (termination_date IS NULL OR termination_date > '2025-12-31'))
    ) / 2
    AS attrition_rate_2025
FROM test_employees;

WITH dept_stats AS (
    SELECT 
        dept_id,
        COUNT(CASE WHEN termination_date BETWEEN '2025-01-01' AND '2025-12-31' THEN 1 END) AS leavers_2025,
        COUNT(CASE WHEN hire_date <= '2025-01-01' AND (termination_date IS NULL OR termination_date > '2025-01-01') THEN 1 END) AS headcount_start,
        COUNT(CASE WHEN hire_date <= '2025-12-31' AND (termination_date IS NULL OR termination_date > '2025-12-31') THEN 1 END) AS headcount_end
    FROM test_employees
    GROUP BY dept_id
)
SELECT 
    d.department,
    COALESCE(ds.leavers_2025, 0) AS leavers,
    (ds.headcount_start + ds.headcount_end) / 2.0 AS avg_headcount,
    ROUND(COALESCE(ds.leavers_2025, 0) * 1.0 / NULLIF((ds.headcount_start + ds.headcount_end) / 2.0, 0), 4) AS attrition_rate_2025
FROM departments d
LEFT JOIN dept_stats ds ON d.dept_id = ds.dept_id
ORDER BY attrition_rate_2025 DESC;