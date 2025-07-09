# SQL Learning Resources

This repository serves as a comprehensive collection of SQL learning resources, organized by different query types and complexities. It includes examples for `JOIN` operations, `SUBQUERY` usage, `Common Table Expressions (CTEs)`, and practice problems from `sql-ex.ru`.

---

## SQL Queries

The `join_queries.sql` in [`queries/joins-subQueries-CTEs/join_queries.sql`](queries/joins-subQueries-CTEs/join_queries.sql) file is a learning resource showcasing different SQL `JOIN` operations and data manipulation techniques. It provides commented examples illustrating how to:

* Perform `INNER JOIN`, `LEFT JOIN`, `FULL OUTER JOIN`, and `CROSS JOIN` to combine data based on the `product_id`.
* Filter data using `WHERE` clauses for specific conditions.
* Sort results using `ORDER BY`.
* Aggregate data with `GROUP BY` and `COUNT`.
* Handle `NULL` values for better presentation using `COALESCE`.

---

## SQL Subqueries

The `sub_queries.sql` in [`queries/joins-subQueries-CTEs/sub_queries.sql`](queries/joins-subQueries-CTEs/sub_queries.sql) file is a learning resource showcasing subquerying operations and techniques. It provides commented examples illustrating how to:

* Filter based on **scalar subqueries**.
* Filter based on **column subqueries** (using `IN`).
* Filter based on **row subqueries** (using `=`).
* Filter based on **table subqueries** (in `FROM` clause).
* Filter based on **existence** (`EXISTS`).
* Filter data based on comparisons with the results of **aggregate functions** (like `AVG`, `MAX`, `MIN`, `SUM`, `COUNT`) calculated within a subquery.

---

## SQL CTEs

The `CTEs_queries.sql` in [`queries/joins-subQueries-CTEs/CTEs/CTEs_queries.sql`](queries/joins-subQueries-CTEs/CTEs/CTEs_queries.sql) file is a learning resource showcasing different CTE operations and techniques. It provides commented examples illustrating how to:

* Create **simple CTEs** for basic data selection.
* Use CTEs to **calculate aggregate values** (e.g., average salary) and then filter main queries based on these results.
* **Rank data** within groups (e.g., employees by salary within each department) using window functions in CTEs.
* Find specific ranked values (e.g., the second highest salary) across the entire dataset.
* Implement **recursive CTEs** to traverse hierarchical data structures, such as finding recommendation chains.

---

## SQL-Ex.ru Practice Problems

The `sql-ex.ru` directory contains solutions and schema setups for practice problems from the [sql-ex.ru](http://sql-ex.ru/) website, specifically focusing on the "Computer Firm" database.

The schema for the `computer_firm` database is defined in [`queries/sql-ex.ru/computer_firm/computer_firm_schema.sql`](queries/sql-ex.ru/computer_firm/computer_firm_schema.sql).

Solutions are categorized by difficulty level within the `select_learning_stage` directory:

* **Easy Level 1:**
* **Intermediate Level 2:**
* **Hard Level 3:**
* **Advanced Level 4:**
