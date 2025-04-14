--------------------------------------------------------------------------------\
-- 1. Transaction ID, time, and price per unit for each transaction.\
--    (INNER JOIN: Get matching transactions and product prices)\
--------------------------------------------------------------------------------\
SELECT t.transaction_id, t.time AS transaction_time, i.price_unit\
FROM transaction_data AS t INNER JOIN inventory_data AS i ON t.product_id = i.product_id;\
\
--------------------------------------------------------------------------------\
-- 2. All transaction details with the product name.\
--    (INNER JOIN: Combine transactions with their product names)\
--------------------------------------------------------------------------------\
SELECT t.*, i.product_name\
FROM transaction_data AS t INNER JOIN inventory_data AS i ON t.product_id = i.product_id;\
\
--------------------------------------------------------------------------------\
-- 3. All transactions and the product name if available.\
--    (LEFT JOIN: Show all transactions, and product name if it exists)\
--------------------------------------------------------------------------------\
SELECT t.*, i.product_name\
FROM transaction_data AS t LEFT JOIN inventory_data AS i ON t.product_id = i.product_id;\
\
--------------------------------------------------------------------------------\
-- 4. Transactions with no matching product in inventory.\
--    (LEFT JOIN + WHERE NULL: Find transactions without product info)\
--------------------------------------------------------------------------------\
SELECT t.transaction_id, t.product_id\
FROM transaction_data AS t LEFT JOIN inventory_data AS i ON t.product_id = i.product_id\
WHERE i.product_id IS NULL;\
\
--------------------------------------------------------------------------------\
-- 5. All product info and the transaction ID if there were any.\
--    (LEFT JOIN: Show all products, and transaction ID if it exists)\
--------------------------------------------------------------------------------\
SELECT i.*, t.transaction_id\
FROM inventory_data AS i LEFT JOIN transaction_data AS t ON i.product_id = t.product_id;\
\
--------------------------------------------------------------------------------\
-- 6. Products with no recorded transactions.\
--    (LEFT JOIN + WHERE NULL: Find products without transactions)\
--------------------------------------------------------------------------------\
SELECT i.*\
FROM inventory_data AS i LEFT JOIN transaction_data AS t ON i.product_id = t.product_id\
WHERE t.transaction_id IS NULL;\
\
--------------------------------------------------------------------------------\
-- 7. Combine all records, showing matching info where possible.\
--    (FULL OUTER JOIN: Show everything from both tables, matching where possible)\
--------------------------------------------------------------------------------\
SELECT COALESCE(t.transaction_id::TEXT, '') AS transaction_id, t.time, t.product_id AS transaction_product_id, i.*\
FROM transaction_data AS t FULL OUTER JOIN inventory_data AS i ON t.product_id = i.product_id;\
\
--------------------------------------------------------------------------------\
-- 8. Show either transaction ID or product name for all records.\
--    (FULL OUTER JOIN + COALESCE: Display either transaction or product info)\
--------------------------------------------------------------------------------\
SELECT COALESCE(t.transaction_id::TEXT, 'No Transaction') AS transaction_info, COALESCE(i.product_name, 'No Product') AS product_info\
FROM transaction_data AS t FULL OUTER JOIN inventory_data AS i ON t.product_id = i.product_id;\
\
--------------------------------------------------------------------------------\
-- 9. Every transaction combined with every product.\
--    (CROSS JOIN: Combine all transactions with all products)\
--------------------------------------------------------------------------------\
SELECT t.transaction_id, i.product_name\
FROM transaction_data AS t CROSS JOIN inventory_data AS i;\
\
--------------------------------------------------------------------------------\
-- 10. Transactions with product name for 'Electronics' only.\
--     (INNER JOIN + WHERE: Get transactions and names for electronic products)\
--------------------------------------------------------------------------------\
SELECT t.*, i.product_name\
FROM transaction_data AS t INNER JOIN inventory_data AS i ON t.product_id = i.product_id\
WHERE i.product_type = 'Electronics';\
\
--------------------------------------------------------------------------------\
-- 11. All transactions with product name and time, ordered by time.\
--     (LEFT JOIN + ORDER BY: Show all transactions, names, and order by time)\
--------------------------------------------------------------------------------\
SELECT t.transaction_id, i.product_name, t.time AS transaction_time\
FROM transaction_data AS t LEFT JOIN inventory_data AS i ON t.product_id = i.product_id\
ORDER BY t.time DESC;\
\
--------------------------------------------------------------------------------\
-- 12. Number of transactions for each product name.\
--     (INNER JOIN + GROUP BY + COUNT: Count transactions per product)\
--------------------------------------------------------------------------------\
SELECT i.product_name, COUNT(t.transaction_id) AS number_of_transactions\
FROM transaction_data AS t INNER JOIN inventory_data AS i ON t.product_id = i.product_id\
GROUP BY i.product_name;\
\
--------------------------------------------------------------------------------\
-- 13. Total transactions for each product (including those with none).\
--     (LEFT JOIN + GROUP BY + COUNT: Count all transactions per product)\
--------------------------------------------------------------------------------\
SELECT i.product_name, COUNT(t.transaction_id) AS total_transactions\
FROM inventory_data AS i LEFT JOIN transaction_data AS t ON i.product_id = t.product_id\
GROUP BY i.product_name;\
\
--------------------------------------------------------------------------------\
-- 14. Combine transaction and inventory data based on product ID.\
--     (INNER JOIN: Combine matching transaction and product data)\
--------------------------------------------------------------------------------\
SELECT *\
FROM transaction_data AS t INNER JOIN inventory_data AS i ON t.product_id = i.product_id;\
\
--------------------------------------------------------------------------------\
-- 15. Transaction ID and product name for all associated records.\
--     (INNER JOIN: Get transaction IDs and product names)\
--------------------------------------------------------------------------------\
SELECT t.transaction_id, i.product_name\
FROM transaction_data AS t INNER JOIN inventory_data AS i ON t.product_id = i.product_id;\
\
--------------------------------------------------------------------------------\
-- 16. Transaction ID (or 'No Transaction') and product name for all products.\
--     (LEFT JOIN + COALESCE: Show transaction status and name for all products)\
--------------------------------------------------------------------------------\
SELECT COALESCE(t.transaction_id::TEXT, 'No Transaction') AS transaction_info, i.product_name\
FROM inventory_data AS i LEFT JOIN transaction_data AS t ON i.product_id = t.product_id;\
\
--------------------------------------------------------------------------------\
-- 17. Transactions with product name and price for products over 50.\
--     (INNER JOIN + WHERE: Get transactions, names, and prices for expensive products)\
--------------------------------------------------------------------------------\
SELECT t.*, i.product_name, i.price_unit\
FROM transaction_data AS t INNER JOIN inventory_data AS i ON t.product_id = i.product_id\
WHERE i.price_unit > 50;\
\
--------------------------------------------------------------------------------\
-- 18. Transaction ID and unit price of the product if available.\
--     (LEFT JOIN: Show transaction ID and product price if it exists)\
--------------------------------------------------------------------------------\
SELECT t.transaction_id, i.price_unit\
FROM transaction_data AS t LEFT JOIN inventory_data AS i ON t.product_id = i.product_id;\
\
--------------------------------------------------------------------------------\
-- 19. Show either transaction ID (or 'No Transaction') and product name\
--     (or 'No Product').\
--     (FULL OUTER JOIN + COALESCE: Display transaction or 'None', and product or 'None')\
--------------------------------------------------------------------------------\
SELECT COALESCE(t.transaction_id::TEXT, 'No Transaction') AS transaction_info, COALESCE(i.product_name, 'No Product') AS product_info\
FROM transaction_data AS t FULL OUTER JOIN inventory_data AS i ON t.product_id = i.product_id;\
\
--------------------------------------------------------------------------------\
-- 20. Transactions and product name for products sold by 'kg'.\
--     (INNER JOIN + WHERE: Get transactions and names for products sold by kg)\
--------------------------------------------------------------------------------\
SELECT t.transaction_id, i.product_name, i.unit\
FROM transaction_data AS t INNER JOIN inventory_data AS i ON t.product_id = i.product_id\
WHERE i.unit = 'kg';}
