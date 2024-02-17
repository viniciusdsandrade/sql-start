/*
 2FN - Second Normal Form Rules:
    1 - Each non-key attribute must depend on the entire primary key.
 */

DROP DATABASE IF EXISTS db_2fn;
CREATE DATABASE IF NOT EXISTS db_2fn;
USE db_2fn;

CREATE TABLE IF NOT EXISTS tb_player_inventory
(
    player_id     VARCHAR(50)  NOT NULL,
    item_type     VARCHAR(50)  NOT NULL,
    item_quantity INT UNSIGNED NOT NULL,
    player_rating VARCHAR(50)  NOT NULL,

    PRIMARY KEY (player_id, item_type)
);

# Anomaly Same player with different ratings
INSERT INTO tb_player_inventory (player_id, item_type, item_quantity, player_rating)
VALUES ('jdog21', 'amulets', 2, 'Advanced'),
       ('jdog21', 'rings', 4, 'Intermediate'),
       ('gila19', 'copper coins', 18, 'Beginner'),
       ('trev73', 'Shields', 3, 'Advanced'),
       ('trev73', 'arrows', 5, 'Beginner'),
       ('trev73', 'copper coins', 30, 'Intermediate'),
       ('trev73', 'rings', 7, 'Advanced');

# Non-key attributes: {item_quantity, player_rating}
# {player_id, item_type} -> {item_quantity} (OK)
# {player_id, item_type} -> {player_rating} (NOK)

CREATE TABLE IF NOT EXISTS tb_player_2fn
(
    player_id     VARCHAR(50) NOT NULL,
    player_rating VARCHAR(50) NOT NULL,

    PRIMARY KEY (player_id)
);

INSERT INTO tb_player_2fn (player_id, player_rating)
VALUES ('jdog21', 'Advanced'),
       ('gila19', 'Beginner'),
       ('trev73', 'Advanced'),
       ('tina42', 'Beginner');

CREATE TABLE IF NOT EXISTS tb_player_inventory_2fn
(
    player_id     VARCHAR(50)  NOT NULL,
    item_type     VARCHAR(50)  NOT NULL,
    item_quantity INT UNSIGNED NOT NULL,
    PRIMARY KEY (player_id, item_type)
);

# {player_id} -> {player_rating} (OK)

INSERT INTO tb_player_inventory_2fn (player_id, item_type, item_quantity)
VALUES ('jdog21', 'amulets', 2),
       ('jdog21', 'rings', 4),
       ('gila19', 'copper coins', 18),
       ('trev73', 'Shields', 3),
       ('trev73', 'arrows', 5),
       ('trev73', 'copper coins', 30),
       ('trev73', 'rings', 7);

# {player_id, item_type} -> {player_quantity} (OK)