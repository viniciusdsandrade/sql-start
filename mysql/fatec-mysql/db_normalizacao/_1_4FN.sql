/*
 4FN - Fourth Normal Form Rules:
    1 - Mutivalued Dependencies in a Table must be multivalued dependencies on the key
 */

DROP DATABASE IF EXISTS db_4fn;
CREATE DATABASE IF NOT EXISTS db_4fn;
USE db_4fn;

CREATE TABLE IF NOT EXISTS tb_model_colours_and_styles_available
(
    model  VARCHAR(50) NOT NULL,
    colour VARCHAR(50) NOT NULL,
    style  VARCHAR(50) NOT NULL,

    PRIMARY KEY (model, colour, style)
);

INSERT INTO tb_model_colours_and_styles_available (model, colour, style)
VALUES ('Tweety', 'Yellow', 'Bungalow'),
       ('Tweety', 'Yellow', 'Duplex'),
       ('Tweety', 'blue', 'Bungalow'),
       ('Tweety', 'blue', 'Duplex'),
       ('metro', 'brown', 'high-rise'),
       ('metro', 'brown', 'modular'),
       ('metro', 'grey', 'high-rise'),
       ('metro', 'grey', 'modular'),
       ('Prairie', 'Brown', 'Bungalow'),
       ('Prairie', 'Brown', 'Duplex'),
       ('Prairie', 'Beige', 'Bungalow'),
       ('Prairie', 'Beige', 'Duplex'),
       ('Prairie', 'Green', 'Bungalow');

# {model} ->> {colour}
# {model} ->> {style}

/*
 Model "Tweety"
    colors: in Yellow and Blue
    styles: in Bungalow and Duplex

Model "Metro"
    colors: in Brown and Grey
    styles: in High-Rise and Modular

Model "Prairie"
    colors: in Brown, Beige and Green
    styles: in Bungalow and Duplex
 */

CREATE TABLE IF NOT EXISTS tb_model_colors_available
(
    model  VARCHAR(50) NOT NULL,
    colour VARCHAR(50) NOT NULL,

    PRIMARY KEY (model)
);

CREATE TABLE IF NOT EXISTS tb_model_styles_available
(
    model VARCHAR(50) NOT NULL,
    style VARCHAR(50) NOT NULL,

    PRIMARY KEY (model)
);

INSERT INTO tb_model_colors_available (model, colour)
VALUES ('Tweety', 'Yellow'),
       ('Tweety', 'Blue'),
       ('Metro', 'Brown'),
       ('Metro', 'Grey'),
       ('Prairie', 'Brown'),
       ('Prairie', 'Beige');

INSERT INTO tb_model_styles_available (model, style)
VALUES ('Tweety', 'Bungalow'),
       ('Tweety', 'Duplex'),
       ('Metro', 'High-Rise'),
       ('Metro', 'Modular'),
       ('Prairie', 'Bungalow'),
       ('Prairie', 'Duplex');