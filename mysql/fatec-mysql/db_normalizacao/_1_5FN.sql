/*
 5FN - Fourth Normal Form Rules:
    1 - The table (which must be in 4FN) cannot be describable as the logical result of joining some other tables together
 */

DROP DATABASE IF EXISTS db_5fn;
CREATE DATABASE IF NOT EXISTS db_5fn;
USE db_5fn;

/*
Brand: Frosty's
    Flavors: Vanilla, Chocolate, Strawberry, Mint Chocolate Chip

Brand: Alpine
    Flavors: Vanilla, Raisin

Brand: Ice Queen
    Flavors: Vanilla, Strawberry, Mint Chocolate Chip
 */

CREATE TABLE IF NOT EXISTS tb_preferred_ice_cream_products_by_person
(
    person VARCHAR(50) NOT NULL,
    brand  VARCHAR(50) NOT NULL,
    flavor VARCHAR(50) NOT NULL,

    PRIMARY KEY (person, brand, flavor)
);

INSERT INTO tb_preferred_ice_cream_products_by_person (person, brand, flavor)
VALUES ('Jason', 'Frosty´s', 'Vanilla'),
       ('Jason', 'Frosty´s', 'Chocolate'),
       ('Suzy', 'Alpine', 'Vanilla'),
       ('Suzy', 'Alpine', 'Rum Raisin'),
       ('Suzy', 'Ice Queen', 'Mint Chocolate Chip'),
       ('Suzy', 'Ice Queen', 'Strawberry');


CREATE TABLE IF NOT EXISTS tb_preferred_brands_by_person
(
    person VARCHAR(50) NOT NULL,
    brand  VARCHAR(50) NOT NULL,

    PRIMARY KEY (person, brand)
);

INSERT INTO tb_preferred_brands_by_person (person, brand)
VALUES ('Jason', 'Frosty´s'),
       ('Jason', 'Alpine'),
       ('Suzy', 'Alpine'),
       ('Suzy', 'Ice Queen');

CREATE TABLE IF NOT EXISTS tb_available_flavors_by_brand
(
    brand  VARCHAR(50) NOT NULL,
    flavor VARCHAR(50) NOT NULL,

    PRIMARY KEY (brand, flavor)
);

INSERT INTO tb_available_flavors_by_brand (brand, flavor)
VALUES ('Frosty´s', 'Vanilla'),
       ('Frosty´s', 'Chocolate'),
       ('Frosty´s', 'Strawberry'),
       ('Frosty´s', 'Mint Chocolate Chip'),
       ('Alpine', 'Vanilla'),
       ('Alpine', 'Rum Raisin'),
       ('Ice Queen', 'Vanilla'),
       ('Ice Queen', 'Strawberry'),
       ('Ice Queen', 'Mint Chocolate Chip');

CREATE TABLE IF NOT EXISTS tb_preferred_flavors_by_person
(
    person VARCHAR(50) NOT NULL,
    flavor VARCHAR(50) NOT NULL,

    PRIMARY KEY (person, flavor)
);

INSERT INTO tb_preferred_flavors_by_person (person, flavor)
VALUES ('Jason', 'Vanilla'),
       ('Jason', 'Chocolate'),
       ('Suzy', 'Vanilla'),
       ('Suzy', 'Rum Raisin'),
       ('Suzy', 'Mint Chocolate Chip'),
       ('Suzy', 'Strawberry');

SELECT pbrand.Person,
       bf.Brand,
       bf.Flavor
FROM tb_preferred_brands_by_person AS pbrand
         INNER JOIN
     tb_preferred_flavors_by_person AS pflavor
     ON pbrand.Person = pflavor.Person
         INNER JOIN
     tb_available_flavors_by_brand AS bf
     ON pbrand.Brand = bf.Brand AND
        pflavor.Flavor = bf.Flavor
ORDER BY pbrand.Person, bf.Brand, bf.Flavor;