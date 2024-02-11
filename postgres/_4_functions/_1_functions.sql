-- Função que receba dois números e retorne a soma deles.
CREATE FUNCTION soma_dois_numeros(numero_1 INTEGER, numero_2 INTEGER) RETURNS INTEGER AS
$$
SELECT numero_1 + numero_2;
$$ LANGUAGE SQL;

-- Chamando a função 'soma_dois_numeros'
SELECT soma_dois_numeros(2, 2);

-- Excluindo a função 'soma_dois_numeros'
DROP FUNCTION soma_dois_numeros;


DROP TABLE tb_instrutor;
CREATE TABLE tb_instrutor
(
    id         SERIAL,
    nome       VARCHAR(255)   NOT NULL,
    salario    DECIMAL(10, 2) NOT NULL,
    nascimento DATE           NOT NULL,

    PRIMARY KEY (id)
);

INSERT INTO tb_instrutor (nome, salario, nascimento)
VALUES ('Fulano', 1000, '2001-12-06'),
       ('Ciclano', 2000, '2002-12-06'),
       ('Beltrano', 3000, '2003-12-06');

-- Função que receba um instrutor e retorne o dobro do salário.
CREATE FUNCTION dobro_do_salario(tb_instrutor) RETURNS DECIMAL AS
$$
SELECT $1.salario * 2 AS dobro;
$$ LANGUAGE SQL;

-- Função que receba um instrutor e retorne a idade.
CREATE FUNCTION idade_instrutor(tb_instrutor) RETURNS INTEGER AS
$$
SELECT EXTRACT(YEAR FROM AGE(CURRENT_DATE, $1.nascimento)) AS idade;
$$ LANGUAGE SQL;

-- Query que chama as funções 'dobro_do_salario' e 'idade_instrutor' além do nome, salário e nascimento do instrutor.
SELECT nome,
       salario,
       nascimento,
       dobro_do_salario(tb_instrutor) AS salario_desejado,
       idade_instrutor(tb_instrutor)  AS idade
FROM tb_instrutor;

