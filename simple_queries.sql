USE sales_db;

-- Select all products.
SELECT * FROM products;

-- Show only product names and prices.
SELECT name, price FROM products;

-- List all customers.
SELECT * FROM customers;

-- Show distinct categories from products.
SELECT DISTINCT category FROM products;

-- Get the first 10 products.
SELECT * FROM products LIMIT 10;
