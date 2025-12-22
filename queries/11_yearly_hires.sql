-- Question 11: Yearly hires trend: Number of hires per year (from hire_date)
-- Answer:

SELECT
    YEAR(hire_date) AS year,
    COUNT(*) AS total_hire
FROM test_employees
WHERE termination_date IS NULL
GROUP BY year
ORDER BY year;