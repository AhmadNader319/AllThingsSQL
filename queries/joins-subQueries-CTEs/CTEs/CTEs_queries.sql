-- CTEs Practice (statements -> 1 to 5)

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



-- Statement5 :Find the downward recommendation chain for member ID 1: that is, the members they recommended, the members those members recommended, and so on. Return member ID and name, and order by ascending member id.
WITH RECURSIVE upward_recommendation AS (
    SELECT
        m.memid, m.firstname, m.surname, m.recommendedby
    FROM members AS m
    WHERE
        m.memid = 27
    UNION ALL
    SELECT
        m.memid, m.firstname, m.surname, m.recommendedby
    FROM
        members AS m
    INNER JOIN
        upward_recommendation AS ur
    ON
        m.memid = ur.recommendedby
)
SELECT
    ur.memid, ur.firstname, ur.surname
FROM
    upward_recommendation AS ur
where
    ur.memid <> 27
ORDER BY
    ur.memid DESC;
