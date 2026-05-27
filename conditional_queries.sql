USE sales_db;

-- Find all products with price > 50.
SELECT * FROM products
WHERE price > 50;

-- Get all customers from the city 'Baku'.
SELECT * FROM customers
WHERE city = 'Baku';

-- Find products in the category 'Electronics'.
SELECT * FROM products
WHERE category = 'electronics';

-- Show orders created after '2024-01-01'.
SELECT * FROM orders
WHERE order_date > '2024-01-01';

-- List customers whose email ends with '@gmail.com'.
SELECT * FROM customers
WHERE email LIKE '%@gmail.com';

-- Products priced between 20 and 80.
SELECT * FROM products
WHERE price BETWEEN 20 AND 80;

-- Products not in category 'Clothing'.
SELECT * FROM products
WHERE category NOT IN ('Clothing');
