USE sales_db;

-- Count total number of products.
SELECT COUNT(*) AS total_products FROM products;

-- Calculate average product price.
SELECT AVG(price) AS avg_price FROM products;

-- Count total number of customers.
SELECT COUNT(*) AS total_customers FROM customers;

-- Sum the quantities of all sold items.
SELECT SUM(quantity) AS total_quantity FROM order_items;

-- Count how many orders each customer made.
SELECT customer_id, COUNT(id) AS total_orders
FROM orders
GROUP BY customer_id;

-- Find the highest priced product.
SELECT MAX(price) AS highest_price FROM products;

-- Count how many products belong to each category.
SELECT category, COUNT(id) AS product_count
FROM products
GROUP BY category;
