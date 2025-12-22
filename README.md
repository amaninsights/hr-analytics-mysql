# HR Analytics Project – MySQL

End-to-end HR analytics project built in MySQL to analyze employee data for a mid-sized company (~50 employees).  

Designed to deliver actionable insights on headcount, attrition, salary trends, diversity, performance, and promotion readiness.

## Business Questions Answered
- Current headcount & attrition rate by department  
- Salary statistics (avg, median, min/max) by department  
- Employee tenure and yearly hiring trends  
- Gender diversity percentage  
- Top 3 highest-paid employees per department  
- Performance ranking within departments  
- Promotion candidates (high rating + tenure)  
- Salary growth potential (employees below dept average)  
- Manager team summary  

## Key SQL Techniques Used
- Advanced JOINs and filtering  
- Window functions (RANK, ROW_NUMBER, AVG OVER PARTITION BY)  
- CTEs for readability & modularity  
- Aggregations with GROUP BY and HAVING  
- Views for dashboard-ready consumption  
- Indexing for query performance  

## Database Schema
See `schema.sql` for full table creation and data.

## Queries
All 12 advanced queries in `/queries` folder with detailed comments.

## Screenshots
Query outputs & results in `/screenshots` folder.

## Dashboard View
`hr_dashboard_view` — single flat table combining employee details, manager, salary, tenure, rating, and active status — ready for Power BI or Tableau.

## Future Extensions
- Interactive dashboard in Power BI  
- Predictive attrition model in Python  

Built as part of my #100DaysOfDataAnalytics challenge.

Portfolio: [amaninsights.vercel.app](https://amaninsights.vercel.app)  
LinkedIn: [linkedin.com/in/aman2805](https://www.linkedin.com/in/aman2805)  
GitHub: [github.com/Sarohaa199](https://github.com/Sarohaa199)  

Let's connect! 🚀 #DataAnalytics #SQL #HR #MySQL