/*
 3FN - Third Normal Form Rules:
    1 - Every non-key attribute in a table should depended
    on the key,
    the whole key, and
    nothing but the key.
 */

DROP DATABASE IF EXISTS db_3fn;
CREATE DATABASE IF NOT EXISTS db_3fn;
USE db_3fn;

/*
 Skill Level
    1,2,3 - Beginner
    4,5,6 - Intermediate
    7,8,9,10 - Advanced
 */

CREATE TABLE tb_player
(
    player_id          VARCHAR(36),
    player_rating      VARCHAR(36),
    player_skill_level INT UNSIGNED,

    PRIMARY KEY (player_id)
);

# Inconsistency:
INSERT INTO tb_player (player_id, player_rating, player_skill_level)
VALUES ('jdog21', 'Intermediate', 4),
       ('gila19', 'Beginner', 4),
       ('trev73', 'Advanced', 8),
       ('tina42', 'Beginner', 1);

# {player_id} -> {player_skill_level}
# {player_id} -> {player_skill_level} -> {player_rating}

CREATE TABLE tb_player_3fn
(
    player_id          VARCHAR(36),
    player_skill_level INT UNSIGNED,

    PRIMARY KEY (player_id)
);

CREATE TABLE IF NOT EXISTS tb_player_skill_levels_3fn
(
    player_skill_level INT UNSIGNED,
    player_rating      VARCHAR(36),

    PRIMARY KEY (player_skill_level)
);

INSERT INTO tb_player_3fn (player_id, player_skill_level)
VALUES ('jdog21', 4),
       ('gila19', 4),
       ('trev73', 8),
       ('tina42', 1);

INSERT INTO tb_player_skill_levels_3fn (player_skill_level, player_rating)
VALUES (1, 'Beginner'),
       (2, 'Beginner'),
       (3, 'Beginner'),
       (4, 'Intermediate'),
       (5, 'Intermediate'),
       (6, 'Intermediate'),
       (7, 'Advanced'),
       (8, 'Advanced'),
       (9, 'Advanced'),
       (10, 'Advanced');