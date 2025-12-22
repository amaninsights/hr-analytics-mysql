-- Question 6: Top 3 highest-paid employees in each department (use window function)
-- Answer:

WITH CTE AS 
(
    SELECT 
        *,
        RANK() OVER (PARTITION BY dept_id ORDER BY salary DESC) AS ranking
    FROM test_employees
    WHERE termination_date IS NULL
)
SELECT 
    dep.department,
    cte.name,
    cte.salary
FROM departments dep 
JOIN CTE ON dep.dept_id = cte.dept_id
WHERE cte.ranking <= 3;