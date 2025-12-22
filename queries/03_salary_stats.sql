-- Question 3: Average, median, min, max salary by department (for active employees)
-- Answer:

SELECT
    department,
    AVG(salary) AS average_salary,
    MIN(salary) AS minimum_salary,
    MAX(salary) AS maximum_salary,
    AVG(salary) AS median_salary
FROM (
    SELECT
        dep.department AS department,
        tst.salary,
        ROW_NUMBER() OVER (PARTITION BY dep.department ORDER BY tst.salary) AS rn,
        COUNT(*) OVER (PARTITION BY dep.department) AS cnt
    FROM test_employees tst
    JOIN departments dep ON tst.dept_id = dep.dept_id
    WHERE tst.termination_date IS NULL
) t
WHERE rn IN (FLOOR((cnt + 1) / 2), CEIL((cnt + 1) / 2))
GROUP BY department;