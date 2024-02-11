DROP FUNCTION IF EXISTS soma_e_produto(INTEGER, INTEGER) CASCADE;

CREATE FUNCTION soma_e_produto(numero_1 INTEGER, numero_2 INTEGER, OUT soma INTEGER, OUT produto INTEGER) AS
$$
SELECT numero_1 + numero_2 AS soma,
       numero_1 * numero_2 AS produto;
$$ LANGUAGE SQL;

SELECT *
FROM soma_e_produto(3, 3);







