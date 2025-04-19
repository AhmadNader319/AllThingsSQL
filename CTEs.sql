-- CTEs Practice

-- Statement1 : Write a simple CTE that lists all employees and their department.
WITH EmployeeDepartments AS (
    SELECT name, department
    FROM employees
)
SELECT name, department
FROM EmployeeDepartments;

-- Statement2 : Write a CTE that calculates the average salary of all employees.
-- Then, write a query that selects the names of employees who earn more than this average salary using the CTE.
WITH AverageSalary AS (
    SELECT AVG(salary) AS avg_salary
    FROM employees
)
SELECT e.name
FROM employees e, AverageSalary av
WHERE e.salary > av.avg_salary;


-- Statement3 : Write a CTE that ranks employees within each department based on their salary in descending order.
-- Include their name, department, salary, and the rank.
WITH RankedSalaries AS (
    SELECT
        name,
        department,
        salary,
        RANK() OVER (PARTITION BY department ORDER BY salary DESC) AS salary_rank
    FROM
        employees
)
SELECT name, department, salary, salary_rank
FROM RankedSalaries;

-- Statement4 : Using a CTE, find the second highest salary in the entire company.
WITH RankedSalaries AS (
    SELECT DISTINCT
        salary,
        DENSE_RANK() OVER (ORDER BY salary DESC) AS salary_rank
    FROM
        employees
)
SELECT salary
FROM RankedSalaries
WHERE salary_rank = 2
LIMIT 1;

-- Statement5 : Write a recursive CTE to list all the managers in the hierarchy
-- (employees who have at least one direct report). Include their name and employee ID.
-- (Hint: You might need to adapt the previous recursive CTE.)


-- Complex Level

-- Statement6 : Write a recursive CTE to display the entire management chain for each employee,
-- from themselves up to the top manager. The output should include the employee's name and a concatenated string
-- showing their chain of command (e.g., "Grace -> Frank -> Charlie -> Alice").


-- Statement7 : Write a CTE that finds all employees who earn more than the average salary of their direct manager.
-- If an employee has no manager, compare their salary to the average salary of all employees.





-- Statement8 : Write a recursive CTE to calculate the total number of employees in the subtree managed by each employee
-- (including themselves). The output should include the manager's name and the count of their direct and indirect reports.
