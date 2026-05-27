# 🛒 Sales Database — SQL Task

A relational database project for an e-commerce platform built with MySQL.

---

## 🛠️ Tech Stack

- **Database Engine:** MySQL 8.0
- **Language:** SQL

---

## 📐 Database Schema

Four interconnected tables:

1. `customers` — Customer profiles (id, first_name, last_name, email, city)
2. `products` — Product inventory (id, name, category, price)
3. `orders` — Order records linking customers to purchases (id, customer_id, order_date)
4. `order_items` — Junction table with order details (id, order_id, product_id, quantity)

---

## 📁 File Structure

| File | Description |
|------|-------------|
| `database_backup.sql` | Full schema + all INSERT data |
| `simple_queries.sql` | Basic SELECT queries |
| `conditional_queries.sql` | WHERE, BETWEEN, LIKE, IN queries |
| `aggregate_functions.sql` | COUNT, AVG, SUM, MAX, GROUP BY |
| `join_queries.sql` | INNER JOIN, LEFT JOIN, multi-table queries |

---
