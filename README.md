## SQL Queries

The `sql_queries.sql` file provides a practical demonstration of SQL `JOIN` operations for analyzing transaction and inventory data. It includes queries that:

* Retrieve basic transaction and product information.
* Combine data from the `transaction_data` and `inventory_data` tables using `INNER JOIN` to find matching records.
* Utilize `LEFT JOIN` to show all transactions and associated product details (if available), as well as identify transactions with missing product information.
* Employ `FULL OUTER JOIN` to display all records from both tables, highlighting matches and non-matches.
* Demonstrate the use of `CROSS JOIN` for a complete combination of all records.
* Filter results based on specific criteria using the `WHERE` clause (e.g., product category, price, unit of sale).
* Order query results using `ORDER BY`.
* Aggregate data using `GROUP BY` and `COUNT` to determine the number of transactions per product.
* Use the `COALESCE` function to improve the readability of results by handling `NULL` values.

These queries serve as examples of how to effectively combine and analyze related datasets using SQL.
