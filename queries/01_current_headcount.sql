-- Question 1: Current headcount by department (only active employees — termination_date IS NULL)
-- Answer:
SELECT COUNT(*) AS total_current_employee 
FROM test_employees
WHERE termination_date IS NULL;
