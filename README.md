<div align="center">

#  HR Analytics with MySQL

[![MySQL](https://img.shields.io/badge/MySQL-8.0+-4479A1?style=for-the-badge&logo=mysql&logoColor=white)](https://mysql.com)
[![Status](https://img.shields.io/badge/Status-Complete-success?style=for-the-badge)]()
[![License](https://img.shields.io/badge/License-MIT-blue?style=for-the-badge)](LICENSE)

**Production-ready HR analytics using advanced SQL techniques**

[View Queries](queries/)  [See Results](screenshots/)  [Schema](schema.sql)

</div>

---

##  Project Overview

End-to-end HR analytics project built in MySQL to analyze employee data for a mid-sized company (~50 employees). Designed to deliver actionable insights on headcount, attrition, salary trends, diversity, performance, and promotion readiness.

---

##  Business Questions Answered

| Question | SQL Technique | Key Insight |
|----------|--------------|-------------|
| Headcount & attrition by department | GROUP BY + HAVING | Department-wise analysis |
| Salary statistics (avg, median, min/max) | Aggregate Functions | Compensation benchmarks |
| Employee tenure & hiring trends | Date Functions | Workforce planning |
| Gender diversity percentage | Conditional Aggregation | Diversity metrics |
| Top 3 highest-paid per department | Window Functions (RANK) | Compensation outliers |
| Performance ranking | ROW_NUMBER() | Performance distribution |
| Promotion candidates | CTE + Filtering | High potential identification |
| Salary growth potential | AVG OVER PARTITION | Below-average salary detection |
| Manager team summary | JOINs | Team composition |

---

##  Key SQL Techniques

`sql
-- Example: Top 3 Highest Paid per Department
WITH ranked_salaries AS (
    SELECT 
        e.employee_id,
        e.name,
        d.department_name,
        s.salary,
        RANK() OVER (PARTITION BY d.department_id 
                     ORDER BY s.salary DESC) AS salary_rank
    FROM employees e
    JOIN departments d ON e.department_id = d.department_id
    JOIN salaries s ON e.employee_id = s.employee_id
)
SELECT * FROM ranked_salaries WHERE salary_rank <= 3;
`

### Techniques Demonstrated:
-  Advanced JOINs and filtering
-  Window functions (RANK, ROW_NUMBER, AVG OVER PARTITION BY)
-  CTEs for readability & modularity
-  Aggregations with GROUP BY and HAVING
-  Views for dashboard-ready consumption
-  Indexing for query performance

---

##  Project Structure

`
hr-analytics-mysql/
 schema.sql              # Database schema and sample data
 queries/                # All 12 advanced SQL queries
    01_headcount.sql
    02_salary_stats.sql
    ...
 screenshots/            # Query results and outputs
 README.md
`

---

##  Dashboard View

`hr_dashboard_view` — single flat table combining employee details, manager, salary, tenure, rating, and active status — ready for Power BI or Tableau.

---

##  Getting Started

1. **Import the schema**
   `ash
   mysql -u username -p database_name < schema.sql
   `

2. **Run queries from the `/queries` folder**

3. **View results in `/screenshots`**

---

##  Future Extensions

- [ ] Interactive dashboard in Power BI
- [ ] Predictive attrition model in Python
- [ ] Real-time data pipeline

---

##  Connect

Built as part of my #100DaysOfDataAnalytics challenge.

-  **Portfolio:** [amaninsights.vercel.app](https://amaninsights.vercel.app)
-  **LinkedIn:** [linkedin.com/in/aman2805](https://www.linkedin.com/in/aman2805)
-  **GitHub:** [github.com/amaninsights](https://github.com/amaninsights)

---

<div align="center">

** Star this repo if you found it helpful!**

</div>
