-- CTE-schema 
CREATE TABLE employees (
    employee_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    manager_id INTEGER,
    department VARCHAR(50) NOT NULL,
    salary INTEGER
);

INSERT INTO employees (name, manager_id, department, salary) VALUES
('Alice', NULL, 'Sales', 60000),
('Bob', 1, 'Sales', 55000),
('Charlie', 1, 'Marketing', 62000),
('David', 2, 'Sales', 50000),
('Eve', 2, 'Sales', 48000),
('Frank', 3, 'Marketing', 58000),
('Grace', 3, 'Marketing', 56000);
