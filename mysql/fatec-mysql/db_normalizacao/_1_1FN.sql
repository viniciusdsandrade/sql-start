/*
 1FN - First Normal Form Rules:
    1 - Using row order to convey information is not permitted.
    2 - Mixing data types within the same column is not permitted.
    3 - Having a table without a primary key is not permitted.
    4 - Repeating groups are not permitted.
 */

DROP DATABASE IF EXISTS db_1fn;
CREATE DATABASE IF NOT EXISTS db_1fn;
USE db_1fn;

CREATE TABLE IF NOT EXISTS tb_beatle_height
(
    name         VARCHAR(20),
    height_in_cm DECIMAL(5, 2)
);

INSERT INTO tb_beatle_height (name, height_in_cm)
VALUES ('John', 180.34),
       ('John', 177.8),
       ('John', 173.99),
       ('Paul', 180.34),
       ('Paul', 173.99),
       ('Paul', 177.8),
       ('Paul', 180.34),
       ('George', 180.34),
       ('George', 177.8),
       ('George', 173.99),
       ('Ringo', 177.8),
       ('Ringo', 173.99),
       ('Ringo', 180.34);

SELECT *
FROM tb_beatle_height;

CREATE TABLE IF NOT EXISTS tb_beatle_height_1fn
(
    name         VARCHAR(20) PRIMARY KEY,
    height_in_cm DECIMAL(5, 2)
);

INSERT INTO tb_beatle_height_1fn (name, height_in_cm)
VALUES ('John', 180.34),
       ('Paul', 180.34),
       ('George', 180.34),
       ('Ringo', 180.34);

SELECT *
FROM tb_beatle_height_1fn;


DROP TABLE IF EXISTS tb_player_inventory;


CREATE TABLE IF NOT EXISTS tb_player_inventory
(
    player_id VARCHAR(120),
    inventory VARCHAR(120)
);

# This is a Terrible design, because it is not 1FN
# Impratical to query and update
INSERT INTO tb_player_inventory (player_id, inventory)
VALUES ('jdog21', '2 amulets, 4 rings'),
       ('gilal19', '18 copper coins'),
       ('trev73', '3 shields, 5 arrows, 30 copper coins, 5 rings');

SELECT *
FROM tb_player_inventory;

CREATE TABLE IF NOT EXISTS tb_player_inventory_1fn
(
    player_id     VARCHAR(120),
    item_type     VARCHAR(120),
    item_quantity INT UNSIGNED,

    PRIMARY KEY (player_id, item_type)
);

INSERT INTO tb_player_inventory_1fn (player_id, item_type, item_quantity)
VALUES ('jdog21', 'amulet', 2),
       ('jdog21', 'ring', 4),
       ('gilal19', 'copper coin', 18),
       ('trev73', 'shield', 3),
       ('trev73', 'arrow', 5),
       ('trev73', 'copper coin', 30),
       ('trev73', 'ring', 7);

