
CREATE DATABASE IF NOT EXISTS sales_db;
USE sales_db;


DROP TABLE IF EXISTS order_items;
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS customers;

CREATE TABLE customers (
    id         INT          NOT NULL AUTO_INCREMENT,
    first_name VARCHAR(30)  NOT NULL,
    last_name  VARCHAR(30)  NOT NULL,
    email      VARCHAR(40)  NOT NULL,
    city       VARCHAR(30)  NOT NULL,
    PRIMARY KEY (id),
    UNIQUE KEY email (email),
    CONSTRAINT customers_chk_1 CHECK (email LIKE '%@%.%')
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO customers VALUES
(1,  'Ali',    'Hasanov',   'ali.hasanov@gmail.com',   'Baku'),
(2,  'Nigar',  'Mammadova', 'nigar.m@gmail.com',       'Baku'),
(3,  'Rashad', 'Aliyev',    'rashad.a@gmail.com',      'Sumgait'),
(4,  'Leyla',  'Huseynova', 'leyla.h@gmail.com',       'Ganja'),
(5,  'Orkhan', 'Rahimov',   'orkhan.r@gmail.com',      'Baku'),
(6,  'Aysel',  'Karimova',  'aysel.k@gmail.com',       'Shaki'),
(7,  'Elvin',  'Ismayilov', 'elvin.i@gmail.com',       'Baku'),
(8,  'Samira', 'Aliyeva',   'samira.a@gmail.com',      'Lankaran'),
(9,  'Tural',  'Muradov',   'tural.m@gmail.com',       'Ganja'),
(10, 'Gunay',  'Safarova',  'gunay.s@gmail.com',       'Baku');

-- ----------------------------
-- Table: products
-- ----------------------------
CREATE TABLE products (
    id       INT           NOT NULL AUTO_INCREMENT,
    name     VARCHAR(30)   NOT NULL,
    category VARCHAR(30)   NOT NULL,
    price    DECIMAL(10,2) NOT NULL,
    PRIMARY KEY (id),
    UNIQUE KEY name (name)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO products VALUES
(1,  'Wireless Mouse',      'electronics',  15.00),
(2,  'Mechanical Keyboard', 'electronics',  45.00),
(3,  'USB-C Cable',         'electronics',   8.00),
(4,  'Laptop Stand',        'electronics',  25.00),
(5,  'Monitor 24 inch',     'electronics', 120.00),
(6,  'Notebook A5',         'stationery',    3.00),
(7,  'Ballpoint Pen',       'stationery',    1.50),
(8,  'Backpack',            'accessories',  35.00),
(9,  'Water Bottle',        'accessories',  12.00),
(10, 'Desk Lamp',           'home',         20.00),
(11, 'Headphones',          'electronics',  60.00),
(12, 'Phone Charger',       'electronics',  18.00);

-- ----------------------------
-- Table: orders
-- ----------------------------
CREATE TABLE orders (
    id          INT  NOT NULL AUTO_INCREMENT,
    customer_id INT  NOT NULL,
    order_date  DATE NOT NULL,
    PRIMARY KEY (id),
    KEY customer_id (customer_id),
    CONSTRAINT orders_ibfk_1 FOREIGN KEY (customer_id) REFERENCES customers (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO orders VALUES
(1,  1,  '2026-05-01'),
(2,  2,  '2026-05-01'),
(3,  3,  '2026-05-02'),
(4,  4,  '2026-05-02'),
(5,  5,  '2026-05-03'),
(6,  6,  '2026-05-03'),
(7,  7,  '2026-05-04'),
(8,  8,  '2026-05-04'),
(9,  9,  '2026-05-05'),
(10, 10, '2026-05-05'),
(11, 1,  '2026-05-06'),
(12, 2,  '2026-05-06'),
(13, 3,  '2026-05-07'),
(14, 4,  '2026-05-07'),
(15, 5,  '2026-05-08'),
(16, 6,  '2026-05-08'),
(17, 7,  '2026-05-09'),
(18, 8,  '2026-05-09');

-- ----------------------------
-- Table: order_items
-- ----------------------------
CREATE TABLE order_items (
    id         INT NOT NULL AUTO_INCREMENT,
    order_id   INT NOT NULL,
    product_id INT NOT NULL,
    quantity   INT NOT NULL,
    PRIMARY KEY (id),
    KEY order_id (order_id),
    KEY product_id (product_id),
    CONSTRAINT order_items_ibfk_1 FOREIGN KEY (order_id)   REFERENCES orders (id),
    CONSTRAINT order_items_ibfk_2 FOREIGN KEY (product_id) REFERENCES products (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO order_items VALUES
(1,  1,  2,  1),
(2,  1,  7,  2),
(3,  2,  8,  1),
(4,  3,  1,  2),
(5,  3,  3,  1),
(6,  4,  6,  3),
(7,  5,  3,  2),
(8,  5,  9,  1),
(9,  6,  9,  1),
(10, 7,  4,  1),
(11, 7,  1,  1),
(12, 8,  11, 1),
(13, 9,  5,  1),
(14, 10, 12, 2),
(15, 10, 7,  3),
(16, 11, 7,  5),
(17, 12, 10, 1),
(18, 13, 2,  1),
(19, 13, 3,  2),
(20, 14, 8,  2),
(21, 15, 6,  4),
(22, 15, 9,  2),
(23, 16, 1,  1),
(24, 17, 3,  3),
(25, 18, 9,  2);
