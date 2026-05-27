USE sales_db;

-- Show all orders with the customer's full name.
SELECT o.id, o.customer_id, o.order_date,
       CONCAT(c.first_name, ' ', c.last_name) AS full_name
FROM orders AS o
JOIN customers AS c ON o.customer_id = c.id;

/*
List each ordered product with:
  product name
  quantity
  order date
*/
SELECT p.name, oi.quantity, o.order_date
FROM products AS p
JOIN order_items AS oi ON p.id = oi.product_id
JOIN orders      AS o  ON oi.order_id = o.id;

-- Show how many total items each customer purchased.
SELECT c.id, c.first_name, c.last_name, c.email, c.city,
       SUM(oi.quantity) AS total_items
FROM customers AS c
JOIN orders      AS o  ON c.id = o.customer_id
JOIN order_items AS oi ON o.id = oi.order_id
GROUP BY c.id, c.first_name, c.last_name, c.email, c.city;

/*
Calculate total amount spent by each customer
(price x quantity)
*/
SELECT c.id, c.first_name, c.last_name, c.email, c.city,
       SUM(oi.quantity * p.price) AS total_spent
FROM customers AS c
JOIN orders      AS o  ON c.id          = o.customer_id
JOIN order_items AS oi ON o.id          = oi.order_id
JOIN products    AS p  ON oi.product_id = p.id
GROUP BY c.id, c.first_name, c.last_name, c.email, c.city;

-- Show all orders (with product details) placed in 2024.
SELECT o.id, o.customer_id, o.order_date,
       p.id AS product_id, p.name, p.category, p.price
FROM orders AS o
JOIN order_items AS oi ON o.id          = oi.order_id
JOIN products    AS p  ON oi.product_id = p.id
WHERE YEAR(o.order_date) = 2024;

-- Show customers who have never placed an order.
SELECT c.id, c.first_name, c.last_name, c.email, c.city
FROM customers AS c
LEFT JOIN orders AS o ON c.id = o.customer_id
WHERE o.id IS NULL;

-- Find the top 5 customers by total items purchased.
SELECT c.id, c.first_name, c.last_name, c.email, c.city,
       SUM(oi.quantity) AS total_items
FROM customers AS c
JOIN orders      AS o  ON c.id = o.customer_id
JOIN order_items AS oi ON o.id = oi.order_id
GROUP BY c.id, c.first_name, c.last_name, c.email, c.city
ORDER BY total_items DESC
LIMIT 5;
