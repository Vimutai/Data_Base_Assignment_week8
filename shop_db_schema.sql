-- Drop old database if it exists
DROP DATABASE IF EXISTS shop_db;
CREATE DATABASE shop_db CHARACTER SET = 'utf8mb4' COLLATE = 'utf8mb4_general_ci';
USE shop_db;

-- Drop tables in correct order (avoid foreign key issues)
DROP TABLE IF EXISTS order_items;
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS customers;

-- Customers table
CREATE TABLE customers (
  id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  email VARCHAR(255) NOT NULL UNIQUE,
  password_hash VARCHAR(255) NOT NULL,
  first_name VARCHAR(100) NOT NULL,
  last_name VARCHAR(100),
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB;

-- Products table
CREATE TABLE products (
  id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  description TEXT,
  price DECIMAL(10,2) NOT NULL,
  stock INT NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Orders table
CREATE TABLE orders (
  id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  customer_id BIGINT UNSIGNED NOT NULL,
  order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  status ENUM('pending','shipped','delivered','cancelled') DEFAULT 'pending',
  FOREIGN KEY (customer_id) REFERENCES customers(id) ON DELETE CASCADE
);

-- Order items table
CREATE TABLE order_items (
  id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  order_id BIGINT UNSIGNED NOT NULL,
  product_id BIGINT UNSIGNED NOT NULL,
  quantity INT NOT NULL,
  price DECIMAL(10,2) NOT NULL,
  FOREIGN KEY (order_id) REFERENCES orders(id) ON DELETE CASCADE,
  FOREIGN KEY (product_id) REFERENCES products(id) ON DELETE CASCADE
);

-- ===========================
-- Sample Data
-- ===========================

-- Insert sample customers
INSERT INTO customers (email, password_hash, first_name, last_name) VALUES
('alice@example.com', 'hash1', 'Alice', 'Wonder'),
('bob@example.com', 'hash2', 'Bob', 'Builder');

-- Insert sample products
INSERT INTO products (name, description, price, stock) VALUES
('Laptop', '15-inch laptop', 1200.00, 10),
('Phone', 'Latest smartphone', 800.00, 25),
('Headphones', 'Noise cancelling', 150.00, 40);

-- Insert sample orders
INSERT INTO orders (customer_id, status) VALUES
(1, 'pending'),
(2, 'shipped');

-- Insert sample order_items
INSERT INTO order_items (order_id, product_id, quantity, price) VALUES
(1, 1, 1, 1200.00),  -- Alice bought 1 Laptop
(1, 3, 2, 150.00),   -- Alice bought 2 Headphones
(2, 2, 1, 800.00);   -- Bob bought 1 Phone
