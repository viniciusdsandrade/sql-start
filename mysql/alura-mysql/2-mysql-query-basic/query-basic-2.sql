/*
    1 - Listar todos os produtos de uma categoria específica com seus preços
    2 - Calcular o total de vendas por método de pagamento
    3 - Encontrar o cliente que fez mais compras
    4 - Calcular a receita total por categoria de produtos
*/

DROP SCHEMA IF EXISTS db_query_basic_2;
CREATE SCHEMA IF NOT EXISTS db_query_basic_2;
USE db_query_basic_2;

SHOW TABLES;

SELECT *
FROM products;
SELECT *
FROM category;
SELECT *
FROM product_category;
SELECT *
FROM client;
SELECT *
FROM address;
SELECT *
FROM payment_method;
SELECT *
FROM `order`;
SELECT *
FROM order_item;

CREATE TABLE IF NOT EXISTS products
(
    id         BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    name       VARCHAR(255)   NOT NULL,
    price      DECIMAL(10, 2) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS category
(
    id          BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    name        VARCHAR(255) NOT NULL,
    description VARCHAR(255) NOT NULL,
    created_at  TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at  TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS product_category
(
    id          BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    product_id  BIGINT UNSIGNED NOT NULL,
    category_id BIGINT UNSIGNED NOT NULL,
    created_at  TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at  TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (product_id) REFERENCES products (id),
    FOREIGN KEY (category_id) REFERENCES category (id)
);

CREATE TABLE IF NOT EXISTS client
(
    id               BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    name             VARCHAR(255) NOT NULL,
    email            VARCHAR(255) NOT NULL,
    password         VARCHAR(255) NOT NULL,
    birth_date       DATE         NOT NULL,
    oficial_document VARCHAR(255) NOT NULL,
    created_at       TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at       TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS address
(
    id           BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    client_id    BIGINT UNSIGNED NOT NULL,
    street       VARCHAR(255)    NOT NULL,
    number       VARCHAR(255)    NOT NULL,
    complement   VARCHAR(255)    NOT NULL,
    neighborhood VARCHAR(255)    NOT NULL,
    city         VARCHAR(255)    NOT NULL,
    state        VARCHAR(255)    NOT NULL,
    country      VARCHAR(255)    NOT NULL,
    zip_code     VARCHAR(255)    NOT NULL,
    created_at   TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at   TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (client_id) REFERENCES client (id)
);

CREATE TABLE IF NOT EXISTS payment_method
(
    id          BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    description ENUM ('CREDIT_CARD', 'DEBIT_CARD', 'BOLETO', 'PIX') NOT NULL
);

INSERT INTO payment_method (description)
VALUES ('CREDIT_CARD'),
       ('DEBIT_CARD'),
       ('BOLETO'),
       ('PIX');

CREATE TABLE IF NOT EXISTS `order`
(
    id         BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    client_id  BIGINT UNSIGNED NOT NULL,
    address_id BIGINT UNSIGNED NOT NULL,
    payment_id BIGINT UNSIGNED NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (client_id) REFERENCES client (id),
    FOREIGN KEY (address_id) REFERENCES address (id),
    FOREIGN KEY (payment_id) REFERENCES payment_method (id)
);

CREATE TABLE IF NOT EXISTS order_item
(
    id         BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    order_id   BIGINT UNSIGNED NOT NULL,
    product_id BIGINT UNSIGNED NOT NULL,
    quantity   INT             NOT NULL,
    price      DECIMAL(10, 2)  NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (order_id) REFERENCES `order` (id),
    FOREIGN KEY (product_id) REFERENCES products (id)
);

INSERT INTO products (name, price)
VALUES ('Laptop Dell XPS 13', 1099.99),
       ('Smartphone iPhone 13 Pro', 999.99),
       ('Smart TV Samsung 4K', 799.99),
       ('Headphones Sony WH-1000XM4', 349.99),
       ('Digital Camera Canon EOS 5D Mark IV', 2499.99),
       ('Gaming Console Xbox Series X', 499.99),
       ('Coffee Maker Keurig K-Elite', 129.99),
       ('Fitness Tracker Fitbit Charge 5', 149.99),
       ('Smartwatch Apple Watch Series 7', 399.99),
       ('Bluetooth Speaker Bose SoundLink Revolve', 199.99);

INSERT INTO category (name, description)
VALUES ('Laptops', 'High-performance laptops and ultrabooks'),
       ('Smartphones', 'Latest smartphones from top brands'),
       ('Televisions', '4K and OLED TVs for home entertainment'),
       ('Audio', 'Headphones, speakers, and audio accessories'),
       ('Cameras', 'Digital cameras and photography equipment'),
       ('Gaming', 'Video game consoles and accessories'),
       ('Appliances', 'Home and kitchen appliances'),
       ('Wearables', 'Fitness trackers and smartwatches'),
       ('Accessories', 'Tech accessories and gadgets'),
       ('Home & Living', 'Home improvement and living essentials');

INSERT INTO product_category (product_id, category_id)
VALUES (1, 1),
       (2, 1),
       (2, 2),
       (3, 2),
       (4, 3),
       (5, 3),
       (6, 4),
       (7, 4),
       (8, 5),
       (9, 5),
       (10, 6),
       (1, 7),
       (2, 8),
       (3, 9),
       (4, 10),
       (5, 7),
       (6, 8),
       (7, 9),
       (8, 10),
       (9, 7),
       (10, 8);

INSERT INTO client (name, email, password, birth_date, oficial_document)
VALUES ('John Doe', 'john.doe@email.com', 'password123', '1990-01-15', '12345678901'),
       ('Jane Smith', 'jane.smith@email.com', 'password456', '1985-07-20', '98765432101'),
       ('Mike Johnson', 'mike.johnson@email.com', 'password789', '1995-03-10', '65432109876'),
       ('Alice Brown', 'alice.brown@email.com', 'pass1234', '1980-12-05', '45678901234'),
       ('Robert Lee', 'robert.lee@email.com', 'securepass', '1992-06-28', '78901234567'),
       ('Emily White', 'emily.white@email.com', 'mypassword', '1988-09-17', '23456789012'),
       ('David Davis', 'david.davis@email.com', '123456', '1983-04-30', '56789012345'),
       ('Olivia Wilson', 'olivia.wilson@email.com', 'pass7890', '1998-02-22', '67890123456'),
       ('James Miller', 'james.miller@email.com', 'letmein123', '1993-11-25', '78901234567'),
       ('Sophia Moore', 'sophia.moore@email.com', 'testpass', '1989-08-12', '89012345678');

INSERT INTO address (client_id, street, number, complement, neighborhood, city, state, country, zip_code)
VALUES (1, '123 Main St', 'Apt 4B', 'Near Park', 'Downtown', 'Cityville', 'Stateville', 'Countryland', '12345-678'),
       (2, '456 Elm St', 'Unit 7', 'Corner Shop', 'Suburbia', 'Villagetown', 'Stateville', 'Countryland', '23456-789'),
       (3, '789 Oak Rd', 'Unit 12', 'Next to Mall', 'Residential', 'Townville', 'Stateville', 'Countryland',
        '34567-890'),
       (4, '101 Pine Ave', 'Suite 5', 'Across School', 'Greenbelt', 'Parktown', 'Stateville', 'Countryland',
        '45678-901'),
       (5, '202 Cedar Ln', 'Apt 8C', 'By Lake', 'Riverside', 'Lakeville', 'Stateville', 'Countryland', '56789-012'),
       (6, '303 Birch Pl', 'Unit 3D', 'Near Gym', 'Suburbia', 'Gymtown', 'Stateville', 'Countryland', '67890-123'),
       (7, '404 Spruce Ct', 'Apt 6A', 'Close to Library', 'Residential', 'Librarytown', 'Stateville', 'Countryland',
        '78901-234'),
       (8, '505 Redwood Dr', 'Unit 10', 'By Hospital', 'Medical District', 'Hospitown', 'Stateville', 'Countryland',
        '89012-345'),
       (9, '606 Fir Rd', 'Suite 1B', 'By Park', 'Parkside', 'Parksville', 'Stateville', 'Countryland', '90123-456'),
       (10, '707 Maple Ave', 'Apt 2D', 'By School', 'Educational', 'Schoolville', 'Stateville', 'Countryland',
        '01234-567');

-- Inserções na tabela `order`
INSERT INTO `order` (client_id, address_id, payment_id)
VALUES (1, 1, 1),
       (2, 2, 2),
       (3, 3, 3),
       (4, 4, 4),
       (5, 5, 1),
       (6, 6, 2),
       (7, 7, 3),
       (8, 8, 4),
       (9, 9, 1),
       (10, 10, 2);

INSERT INTO order_item (order_id, product_id, quantity, price)
VALUES (1, 1, 2, 219.99),
       (2, 2, 1, 999.99),
       (3, 3, 4, 399.99),
       (4, 4, 3, 49.99),
       (5, 5, 2, 2499.99),
       (6, 6, 1, 499.99),
       (7, 7, 5, 149.99),
       (8, 8, 1, 149.99),
       (9, 9, 3, 399.99),
       (10, 10, 2, 199.99);

SELECT *
FROM products;

SELECT *
FROM category;

SELECT *
FROM product_category;

SELECT *
FROM client;

SELECT *
FROM address;

SELECT *
FROM payment_method;

SELECT *
FROM `order`;

SELECT *
FROM order_item;

SELECT p.name, p.price
FROM products p
         INNER JOIN product_category pc ON p.id = pc.product_id
         INNER JOIN category c ON pc.category_id = c.id
WHERE c.name = 'Smartphones';

SELECT pm.description AS payment_method, SUM(oi.quantity * oi.price) AS total_sales
FROM `order` o
         INNER JOIN payment_method pm ON o.payment_id = pm.id
         INNER JOIN order_item oi ON o.id = oi.order_id
GROUP BY pm.description;

SELECT c.name AS category, SUM(oi.quantity * oi.price) AS total_revenue
FROM category c
         LEFT JOIN product_category pc ON c.id = pc.category_id
         LEFT JOIN products p ON pc.product_id = p.id
         LEFT JOIN order_item oi ON p.id = oi.product_id
GROUP BY c.id
ORDER BY total_revenue DESC;