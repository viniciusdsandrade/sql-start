/*
    1 -
    2 -
    3 -
    4 -
    5 -
*/

DROP SCHEMA IF EXISTS tb_core_4;
CREATE SCHEMA IF NOT EXISTS tb_core_4;
USE tb_core_4;

CREATE TABLE IF NOT EXISTS products
(
    id    BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    name  VARCHAR(255)    NOT NULL,
    price DECIMAL(10, 2)  NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS categories
(
    id   BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    name VARCHAR(255)    NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS products_categories
(
    product_id  INT NOT NULL,
    category_id INT NOT NULL,
    PRIMARY KEY (product_id, category_id),
    FOREIGN KEY (product_id) REFERENCES products (id),
    FOREIGN KEY (category_id) REFERENCES categories (id)
);

INSERT INTO products (name, price)
VALUES ('TV', 1000.00);
INSERT INTO products (name, price)
VALUES ('Mouse', 100.00);
INSERT INTO products (name, price)
VALUES ('Monitor', 500.00);
INSERT INTO products (name, price)
VALUES ('Tablet', 1000.00);
INSERT INTO products (name, price)
VALUES ('HD Case', 80.00);

INSERT INTO categories (name)
VALUES ('Electronics');
INSERT INTO categories (name)
VALUES ('Computer');

INSERT INTO products_categories (product_id, category_id)
VALUES (1, 1);
INSERT INTO products_categories (product_id, category_id)
VALUES (1, 2);
INSERT INTO products_categories (product_id, category_id)
VALUES (2, 2);
INSERT INTO products_categories (product_id, category_id)
VALUES (3, 1);
INSERT INTO products_categories (product_id, category_id)
VALUES (4, 1);
INSERT INTO products_categories (product_id, category_id)
VALUES (5, 2);


SELECT * FROM products;
SELECT * FROM categories;
SELECT * FROM products_categories;