-- Question 9: Salary growth potential: Employees whose salary is below department average (show % below average)
-- Answer:

WITH CTE AS (
    SELECT *, 
           AVG(salary) OVER (PARTITION BY dept_id) AS avg_salary
    FROM test_employees
    WHERE termination_date IS NULL
)
SELECT 
    dep.department,
    cte.name,
    cte.employee_id,
    cte.salary,
    cte.avg_salary,
    ROUND(cte.salary / cte.avg_salary * 100, 2) AS percentage_loss
FROM CTE
JOIN departments dep ON cte.dept_id = dep.dept_id
WHERE salary < avg_salary;