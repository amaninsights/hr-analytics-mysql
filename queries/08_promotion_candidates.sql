-- Question 8: Promotion candidates: Employees with rating >= 4 in 2024 AND tenure > 2 years
-- Answer:

SELECT
    tst.employee_id,
    tst.name,
    pr.rating AS rating,
    TIMESTAMPDIFF(YEAR, tst.hire_date, CURDATE()) AS total_years
FROM performance_ratings pr
JOIN test_employees tst ON pr.employee_id = tst.employee_id
WHERE (pr.rating >= 4 AND pr.rating_year = '2024')
  AND (TIMESTAMPDIFF(YEAR, tst.hire_date, CURDATE()) >= 2)
  AND tst.termination_date IS NULL;