Database Schema

Database Name: shop_db

Tables

customers – Stores customer information (name, email, password).

products – Stores product details (name, description, price, stock).

orders – Represents customer orders with status and order date.

order_items – Links products to orders with quantity and price.

Relationships

One-to-Many:

customers → orders (a customer can place many orders).

orders → order_items (an order can have multiple items).

Many-to-One:

order_items → products (each order item refers to a product).

Implementation

The schema was implemented with:

Primary keys for unique row identification.

Foreign keys to maintain referential integrity.

Constraints such as NOT NULL, UNIQUE, and ENUM.

Sample Data

Example entries were inserted into each table:

Customers: Alice and Bob

Products: Laptop, Phone, Headphones

Orders: Alice placed an order, Bob placed an order

Order Items: Linked products with order quantities

Example Queries and Results
1. Show all customers
SELECT * FROM customers;

2. Show all products
SELECT * FROM products;

3. Show all orders with customer names
SELECT o.id AS order_id, c.first_name, c.last_name, o.status, o.order_date
FROM orders o
JOIN customers c ON o.customer_id = c.id;

4. Show all order details (customers, products, quantities, prices)
SELECT c.first_name, c.last_name, o.id AS order_id, p.name AS product_name, oi.quantity, oi.price
FROM orders o
JOIN customers c ON o.customer_id = c.id
JOIN order_items oi ON o.id = oi.order_id
JOIN products p ON oi.product_id = p.id;

5. Calculate total amount spent by each customer
SELECT c.first_name, c.last_name, SUM(oi.quantity * oi.price) AS total_spent
FROM customers c
JOIN orders o ON c.id = o.customer_id
JOIN order_items oi ON o.id = oi.order_id
GROUP BY c.id;


# Assignment Screenshots

All screenshots for this assignment are stored in the [screenshots](./screenshots) folder.

Conclusion

The Shop Database project successfully demonstrates a functional relational database with well-structured tables, proper constraints, and relationships. Sample data and queries confirm that the database can handle core e-commerce operations such as managing customers, products, and orders.