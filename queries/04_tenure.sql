-- Question 4: Tenure in years for each active employee (from hire_date to today), and average tenure by department
-- Answer:

SELECT 
    *,
    TIMESTAMPDIFF(YEAR, hire_date, CURDATE()) AS total_year_employeed
FROM test_employees;

-- average tenure by department
SELECT
    dep.department,
    AVG(TIMESTAMPDIFF(YEAR, hire_date, CURDATE())) AS total_year_employeed
FROM test_employees tst
JOIN departments dep ON tst.dept_id = dep.dept_id
GROUP BY dep.department;