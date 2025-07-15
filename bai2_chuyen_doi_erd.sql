CREATE TABLE suppliers (
id INT PRIMARY KEY,
name VARCHAR(50),
address VARCHAR(50)
);

CREATE TABLE phone (
phone VARCHAR(10),
supplier_id INT,
FOREIGN KEY (supplier_id) REFERENCES suppliers (id)
);

CREATE TABLE orders (
id INT PRIMARY KEY,
date VARCHAR(20),
supplier_id INT,
FOREIGN KEY (supplier_id) REFERENCES suppliers (id)
);

CREATE TABLE export_ticket (
id INT PRIMARY KEY,
date VARCHAR(20)
);

CREATE TABLE import_ticket (
id INT PRIMARY KEY,
date VARCHAR(20)
);

CREATE TABLE material (
id INT PRIMARY KEY,
name VARCHAR(20)
-- FOREIGN KEY (supplier_id) REFERENCES suppliers (id)
);

CREATE TABLE export_material (
material_id INT,
export_id INT,
amount INT,
price FLOAT,
FOREIGN KEY (export_id) REFERENCES export_ticket(id),
FOREIGN KEY (material_id) REFERENCES material(id),
PRIMARY KEY (export_id, material_id)
);

CREATE TABLE import_material (
material_id INT,
import_id INT,
amount INT,
price FLOAT,
FOREIGN KEY (import_id) REFERENCES import_ticket(id),
FOREIGN KEY (material_id) REFERENCES material(id),
PRIMARY KEY (import_id, material_id)
);

CREATE TABLE order_material (
material_id INT,
order_id INT,
FOREIGN KEY (order_id) REFERENCES orders(id),
FOREIGN KEY (material_id) REFERENCES material(id),
PRIMARY KEY (order_id, material_id)
);