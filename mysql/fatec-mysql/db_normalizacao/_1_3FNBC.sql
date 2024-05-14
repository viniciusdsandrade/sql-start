/*
 BCNF (Boyce-Codd Normal Form) is a higher level of normalization than 3NF (Third Normal Form).:
 */

DROP DATABASE IF EXISTS db_bcnf;
CREATE DATABASE IF NOT EXISTS db_bcnf;
USE db_bcnf;

CREATE TABLE IF NOT EXISTS tb_monthly_widget_sales
(
    sales_year  INT NOT NULL,
    sales_month INT NOT NULL,
    widget_sold INT NOT NULL,

    PRIMARY KEY (sales_year, sales_month)
);

INSERT INTO tb_monthly_widget_sales (sales_year, sales_month, widget_sold)
VALUES (2021, 'November', 1581),
       (2021, 'December', 1927),
       (2021, 'January', 1343);

# {sales_year, sales_month} -> {widget_sold}

/*
 3FN - Third Normal Form Rules:
    Every non-key attribute in a table should depended
    on the key,
    the whole key, and
    nothing but the key.
 */

CREATE TABLE IF NOT EXISTS tb_storage_locker_reservations_1
(
    locket_id              INT  NOT NULL,
    reservation_start_date DATE NOT NULL,
    reservation_end_date   DATE NOT NULL,
    reservation_end_day    ENUM (
        'Monday',
        'Tuesday',
        'Wednesday',
        'Thursday',
        'Friday',
        'Saturday',
        'Sunday')               NOT NULL,

    PRIMARY KEY (locket_id, reservation_start_date)
);

CREATE TABLE IF NOT EXISTS tb_storage_locker_reservations_2
(
    locket_id              INT  NOT NULL,
    reservation_start_date DATE NOT NULL,
    reservation_end_date   DATE NOT NULL,
    reservation_end_day    ENUM (
        'Monday',
        'Tuesday',
        'Wednesday',
        'Thursday',
        'Friday',
        'Saturday',
        'Sunday')               NOT NULL,

    PRIMARY KEY (locket_id, reservation_end_date)
);

INSERT INTO tb_storage_locker_reservations_1 (locket_id,
                                              reservation_start_date,
                                              reservation_end_date,
                                              reservation_end_day)
VALUES (221, '2019-05-14', '2019-06-12', 'Wednesday'),
       (308, '2019-06-07', '2019-06-12', 'Wednesday'),
       (537, '2019-05-14', '2019-05-17', 'Friday');


INSERT INTO tb_storage_locker_reservations_2 (locket_id,
                                              reservation_start_date,
                                              reservation_end_date,
                                              reservation_end_day)
VALUES (221, '2019-05-14', '2019-06-12', 'Wednesday'),
       (308, '2019-06-07', '2019-06-12', 'Wednesday'),
       (537, '2019-05-14', '2019-05-17', 'Friday');


/*
 Can define primary as:
 1 - {locket_id, reservation_start_date}
 or
 2 - {locket_id, reservation_end_date}

 */

/*
 Is this table in 2FN? NO, Its not in 2FN.
 */

/*
    INFORMAL -->
    2FN - Second Normal Form Rules:
    We can´t have a non-key attribute that depends on part of the key

    FORMAL -->
    2FN - Second Normal Form Rules:
    We can't have a non-prime attribute that depends on part of a candidate key.

    Candidate Key - an attribute(or combination fo attributes) that uniquely identifies a row in the table.
    Prime Attribute - an attribute that belongs to at least one candidate key.
    Non-Prime Attribute - an attribute that does not belong to any candidate key.


    our candidate keys:
    1 - {locket_id, reservation_start_date}
    2 - {locket_id, reservation_end_date}
 */

/*
    INFORMAL -->
    3FN - Third Normal Form Rules:
    Each non-key attribute should depend on the keu, the whole key, and nothing but the key.

    FORMAL -->
    3FN - Third Normal Form Rules:
    Each non-prime attribute in a table should depend on every candidate key;
    it should never depend on part of a candidate key;
    and it should never depend on another non-prime attribute.
 */

CREATE TABLE IF NOT EXISTS tb_most_popular_movies_of_the_year
(
    release_year           INT          NOT NULL,
    popularity_ranking     INT          NOT NULL,
    movie_title            VARCHAR(100) NOT NULL,
    release_year_and_month DATE         NOT NULL,

    PRIMARY KEY (release_year, release_year_and_month, popularity_ranking)
);

/*
 Candidate keys:
    1 - {movie_title}
    2 - {release_year, release_year_and_month}
    3 - {release_year_and_month, popularity_ranking}
 Every attribute in the table is a prime attribute

 {release_year, release_year_and_month} -> {release_year}
 */

/*
 BOYCE-CODD NORMAL FORM (BCNF)
 With the exception of trivial functional dependencies,
   every functional dependency in the table is a dependency on a super key.
 */

CREATE TABLE IF NOT EXISTS tb_most_popular_movies_of_the_year_bcnf
(
    release_year       INT          NOT NULL,
    popularity_ranking INT          NOT NULL,
    movie_title        VARCHAR(100) NOT NULL,
    release_month      VARCHAR(100) NOT NULL,

    PRIMARY KEY (release_year, release_month, popularity_ranking)
);