CREATE DATABASE IF NOT EXISTS products;

USE products;

CREATE TABLE products (
id INT PRIMARY KEY,
code VARCHAR(10),
price DOUBLE,
amount INT,
description VARCHAR(200),
status bit(1)
);

INSERT INTO products (id, code, name, price, amount, description, status)
VALUES
(1, 'P001', 'Product A', 120000.50, 10, 'Product 1 - Basic item', b'1'),
(2, 'P002', 'Product B', 450000.00, 5, 'Product 2 - Premium quality', b'1'),
(3, 'P003', 'Product C', 99000.99, 20, 'Product 3 - Discounted item', b'0'),
(4, 'P004', 'Product D', 250000.75, 15, 'Product 4 - Best seller', b'1'),
(5, 'P005', 'Product E', 310000.00, 8, 'Product 5 - Limited edition', b'1'),
(6, 'P006', 'Product F', 150000.25, 30, 'Product 6 - Popular choice', b'0'),
(7, 'P007', 'Product G', 78000.00, 25, 'Product 7 - Low cost', b'1'),
(8, 'P008', 'Product H', 600000.00, 12, 'Product 8 - High-end item', b'1'),
(9, 'P009', 'Product I', 215000.45, 18, 'Product 9 - Mid-range', b'0'),
(10,'P010', 'Product J', 990000.00, 3, 'Product 10 - Luxury product', b'1');

CREATE UNIQUE INDEX product_code
ON products(code);

ALTER TABLE products
MODIFY name VARCHAR(100) AFTER code;

CREATE UNIQUE INDEX i_product_name_price
ON products(name, price);

DROP INDEX product_code ON products;
DROP INDEX i_product_name_price ON products;

EXPLAIN SELECT * FROM products WHERE name = 'Product I';

-- -----------------------------------------------

CREATE VIEW new_table AS
SELECT code, name, price, status
FROM products;

CREATE OR REPLACE VIEW new_table AS
SELECT code, name, price, amount, status
FROM products WHERE name = 'Product C';

DROP VIEW new_table;

DELIMITER $$
CREATE PROCEDURE get_product ()
BEGIN
    SELECT * FROM products;
END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE update_product(IN old_id INT, IN new_id INT)
BEGIN
UPDATE products
SET id = new_id
WHERE id = old_id;
END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE delete_product(IN p_id INT)
BEGIN
DELETE FROM products
WHERE id = p_id;
END $$
DELIMITER ;