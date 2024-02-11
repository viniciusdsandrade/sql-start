DROP TYPE IF EXISTS dois_valores;

-- Cria um tipo de dado que representa uma tupla com dois valores inteiros
CREATE TYPE dois_valores AS
(
    soma    INTEGER,
    produto INTEGER
);

-- Cria uma função que retorna uma tupla com dois valores inteiros
DROP FUNCTION IF EXISTS soma_e_produto;
CREATE FUNCTION soma_e_produto(IN numero_1 INTEGER, IN numero_2 INTEGER) RETURNS dois_valores AS
$$
SELECT numero_1 + numero_2 AS soma, numero_1 * numero_2 AS produto;

$$ LANGUAGE SQL;

SELECT *
FROM soma_e_produto(3, 3);

INSERT INTO tb_instrutor (nome, salario, nascimento)
VALUES ('Fulano', 300, '1990-01-01'),
       ('Ciclano', 400, '1990-01-01'),
       ('Beltrano', 500, '1990-01-01'),
       ('João', 600, '1990-01-01'),
       ('Maria', 700, '1990-01-01'),
       ('José', 800, '1990-01-01'),
       ('Ana', 900, '1990-01-01'),
       ('Pedro', 1000, '1990-01-01'),
       ('Paulo', 1100, '1990-01-01'),
       ('Carlos', 1200, '1990-01-01');

SELECT * FROM tb_instrutor;


DROP FUNCTION IF EXISTS instrutores_bem_pagos;

CREATE FUNCTION instrutores_bem_pagos(valor_salario DECIMAL)
    RETURNS TABLE
            (
                nome       TEXT,
                salario    DECIMAL,
                nascimento DATE
            )
AS
$$
SELECT nome,
       salario,
       nascimento
FROM tb_instrutor
WHERE salario > valor_salario;
$$ LANGUAGE SQL;

SELECT *
FROM instrutores_bem_pagos(300);

--------------------------------------- Alternativamente ---------------------------------------
CREATE TYPE instrutor AS
(
    nome       TEXT,
    salario    DECIMAL,
    nascimento DATE
);

DROP FUNCTION IF EXISTS instrutores_bem_pagos;
CREATE FUNCTION instrutores_bem_pagos(valor_salario DECIMAL) RETURNS SETOF instrutor
AS
$$
SELECT nome,
       salario,
       nascimento
FROM tb_instrutor
WHERE salario > valor_salario;
$$ LANGUAGE SQL;

SELECT *
FROM instrutores_bem_pagos(300);
