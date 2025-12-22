-- Question 12: View for Power BI: Create a view hr_dashboard_view combining employee name, department, manager, salary, rating, tenure, active status
-- Answer:

CREATE VIEW hr_dashboard_view AS
SELECT
    tst.name AS name,
    dep.department AS department,
    dep.manager_name AS manager,
    tst.salary AS salary,
    pr.rating AS rating,
    TIMESTAMPDIFF(YEAR, hire_date, COALESCE(termination_date, CURDATE())) AS total_time,
    CASE
        WHEN tst.termination_date IS NULL THEN 'Yes'
        ELSE 'No'
    END AS active_status
FROM test_employees tst
JOIN departments dep ON tst.dept_id = dep.dept_id
JOIN performance_ratings pr ON pr.employee_id = tst.employee_id;