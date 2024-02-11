CREATE OR REPLACE FUNCTION primeira_pl() RETURNS INTEGER AS
$$
DECLARE
    primeira_variavel INTEGER DEFAULT 3;
BEGIN
    primeira_variavel := primeira_variavel * 2;

    BEGIN
        primeira_variavel := 7;
    END;

    RETURN primeira_variavel;
END
$$ LANGUAGE plpgsql;


SELECT primeira_pl();
-----------------------------------------------------------------------------------------------------------------------
DROP FUNCTION IF EXISTS salario_ok(INTEGER);

CREATE OR REPLACE FUNCTION salario_ok(id_instrutor INTEGER) RETURNS VARCHAR AS
$$
DECLARE
    instrutor tb_instrutor%ROWTYPE;
BEGIN
    SELECT * FROM tb_instrutor WHERE id = id_instrutor INTO instrutor;

    -- If the instructor's salary is greater than 300, it's okay. Otherwise, it may need to be increased.
    IF instrutor.salario > 300 THEN
        RETURN 'Salário de ' || instrutor.nome || ' é ' || instrutor.salario || '. Salário está ok.';
    ELSEIF instrutor.salario = 300 THEN
        RETURN 'Salário de ' || instrutor.nome || ' é ' || instrutor.salario || '. Salário pode aumentar.';
    ELSE
        RETURN 'Salário está defasado. Aumento imediato para ' || instrutor.salario + 100 || ' é necessário.';
    END IF;
END
$$ LANGUAGE PLPGSQL;


SELECT salario_ok(1);
SELECT salario_ok(2);
SELECT salario_ok(3);
SELECT salario_ok(4);
SELECT salario_ok(5);
SELECT salario_ok(6);
SELECT salario_ok(7);
SELECT salario_ok(8);
SELECT salario_ok(9);
SELECT salario_ok(10);

-- Alternativamente podemos utilizar o WHEN para simplificar a função
CREATE OR REPLACE FUNCTION salario_ok(id_instrutor INTEGER) RETURNS VARCHAR AS
$$
DECLARE
    instrutor tb_instrutor%ROWTYPE;
BEGIN
    SELECT * FROM tb_instrutor WHERE id = id_instrutor INTO instrutor;
    RETURN CASE
               WHEN instrutor.salario > 300 THEN
                   'Salário de ' || instrutor.nome || ' é ' || instrutor.salario || '. Salário está ok.'
               WHEN instrutor.salario = 300 THEN
                   'Salário de ' || instrutor.nome || ' é ' || instrutor.salario || '. Salário pode aumentar.'
               ELSE
                   'Salário está defasado. Aumento imediato para ' || (instrutor.salario + 100) || ' é necessário.'
        END;
END;
$$ LANGUAGE PLPGSQL;

SELECT salario_ok(1);
-----------------------------------------------------------------------------------------------------------------------
DROP FUNCTION IF EXISTS tabuada(INTEGER);
CREATE OR REPLACE FUNCTION tabuada(numero INTEGER) RETURNS SETOF VARCHAR AS
$$
DECLARE
    num INTEGER;
BEGIN
    FOR num IN 1..10
        LOOP
            RETURN NEXT numero || ' x ' || num || ' = ' || (numero * num);
        END LOOP;
END;
$$ LANGUAGE plpgsql;

SELECT *
FROM tabuada(5);

DROP PROCEDURE IF EXISTS tabuada_ate_100();
CREATE OR REPLACE PROCEDURE tabuada_ate_100() AS
$$
DECLARE
    num           INTEGER;
    result_record RECORD;
BEGIN
    FOR num IN 1..100
        LOOP
            FOR result_record IN (SELECT * FROM tabuada(num))
                LOOP
                    RAISE NOTICE '%', result_record;
                END LOOP;
        END LOOP;
END;
$$ LANGUAGE plpgsql;

CALL tabuada_ate_100();