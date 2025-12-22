-- Question 7: Employees ranked by performance rating within their department (2024 ratings), showing ties properly
-- Answer:

WITH rating AS
(
    SELECT
        tst.name AS name,
        pr.rating AS rating,
        pr.rating_year AS rating_year,
        tst.dept_id AS dept_id,
        RANK() OVER (PARTITION BY tst.dept_id ORDER BY pr.rating DESC) AS ranking
    FROM performance_ratings pr
    JOIN test_employees tst ON tst.employee_id = pr.employee_id
    WHERE pr.rating_year = '2024' 
      AND tst.termination_date IS NULL
)
SELECT 
    dep.department,
    ra.name,
    ra.rating,
    ra.rating_year,
    ra.ranking
FROM rating ra
JOIN departments dep ON ra.dept_id = dep.dept_id;