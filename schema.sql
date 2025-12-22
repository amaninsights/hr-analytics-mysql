-- ============================================================
-- HR Analytics Schema
-- ============================================================

-- Clean start
DROP TABLE IF EXISTS attendance;
DROP TABLE IF EXISTS performance_ratings;
DROP TABLE IF EXISTS test_employees;
DROP TABLE IF EXISTS departments;

-- ------------------------------------------------------------
-- Departments master
-- dept_id is a controlled key (NOT auto-generated)
-- ------------------------------------------------------------
CREATE TABLE departments (
    dept_id INT PRIMARY KEY,
    department VARCHAR(50) NOT NULL UNIQUE,
    manager_name VARCHAR(100) NOT NULL
);

-- Load departments
LOAD DATA INFILE '/path/to/departments.csv'
INTO TABLE departments
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(dept_id, department, manager_name);

-- ------------------------------------------------------------
-- Employees
-- termination_date NULL = active employee
-- ------------------------------------------------------------
CREATE TABLE test_employees (
    employee_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    gender ENUM('Male', 'Female', 'Other'),
    hire_date DATE NOT NULL,
    termination_date DATE,
    salary DECIMAL(10,2),
    dept_id INT NOT NULL,
    CONSTRAINT fk_employee_department
        FOREIGN KEY (dept_id) REFERENCES departments(dept_id)
);

-- Load employees
LOAD DATA INFILE '/path/to/test_employees.csv'
INTO TABLE test_employees
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(employee_id, name, gender, hire_date, termination_date, salary, dept_id);

-- ------------------------------------------------------------
-- Performance ratings
-- ------------------------------------------------------------
CREATE TABLE performance_ratings (
    rating_id INT PRIMARY KEY,
    employee_id INT NOT NULL,
    rating_year YEAR NOT NULL,
    rating TINYINT CHECK (rating BETWEEN 1 AND 5),
    CONSTRAINT fk_rating_employee
        FOREIGN KEY (employee_id) REFERENCES test_employees(employee_id)
);

-- Load performance ratings
LOAD DATA INFILE '/path/to/performance_ratings.csv'
INTO TABLE performance_ratings
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(rating_id, employee_id, rating_year, rating);
