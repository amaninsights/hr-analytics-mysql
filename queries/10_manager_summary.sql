-- Question 10: Manager summary: For each manager, number of direct reports, average salary, and average rating
-- Answer:

WITH cte AS (
    SELECT
        dept_id,
        COUNT(*) AS direct_reports,
        ROUND(AVG(salary), 2) AS avg_salary,
        ROUND(AVG(rating), 2) AS avg_rating
    FROM test_employees tst
    JOIN performance_ratings pr ON tst.employee_id = pr.employee_id
    WHERE termination_date IS NULL
    GROUP BY dept_id
)
SELECT
    dep.manager_name,
    cte.direct_reports,
    cte.avg_salary,
    cte.avg_rating
FROM cte
JOIN departments dep ON cte.dept_id = dep.dept_id;