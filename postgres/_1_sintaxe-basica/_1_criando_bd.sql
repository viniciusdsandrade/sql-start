SELECT NOW();
--

-- Criação do banco de dados
DROP DATABASE IF EXISTS db_postgres_escola;
CREATE DATABASE db_postgres_escola;

--
/*
Table 8.1. Data Types
Name	                            Aliases	            Description
bigint	                            int8	            signed eight-byte integer
bigserial	                        serial8	            autoincrementing eight-byte integer
bit [ (n) ]	 	                                        fixed-length bit string
bit varying [ (n) ]	                varbit [ (n) ]	    variable-length bit string
boolean	                            bool	            logical Boolean (true/false)
box	 	                                                rectangular box on a plane
bytea	 	                                            binary data (“byte array”)
character [ (n) ]	                char [ (n) ]	    fixed-length character string
character varying [ (n) ]	        varchar [ (n) ]	    variable-length character string
cidr	 	                                            IPv4 or IPv6 network address
circle	 	                                            circle on a plane
date	 	                                            calendar date (year, month, day)
double precision	                float8	            double precision floating-point number (8 bytes)
inet	 	                                            IPv4 or IPv6 host address
integer	                            int, int4	        signed four-byte integer
interval [ fields ] [ (p) ]	 	                        time span
json	 	                                            textual JSON data
jsonb	 	                                            binary JSON data, decomposed
line	 	                                            infinite line on a plane
lseg	 	                                            line segment on a plane
macaddr	 	                                            MAC (Media Access Control) address
macaddr8	 	                                        MAC (Media Access Control) address (EUI-64 format)
money	 	                                            currency amount
numeric [ (p, s) ]	                 decimal [ (p, s) ]	exact numeric of selectable precision
path	 	                                            geometric path on a plane
pg_lsn	 	                                            PostgreSQL Log Sequence Number
pg_snapshot	 	                                        user-level transaction ID snapshot
point	 	                                            geometric point on a plane
polygon	 	                                            closed geometric path on a plane
real	                            float4	            single precision floating-point number (4 bytes)
smallint	                        int2	            signed two-byte integer
smallserial	                        serial2	            autoincrementing two-byte integer
serial	                            serial4	            autoincrementing four-byte integer
text	 	                                            variable-length character string
time [ (p) ] [ without time zone ]	 	                time of day (no time zone)
time [ (p) ] with time zone	    timetz	                time of day, including time zone
timestamp [ (p) ] [ without time zone ]	 	            date and time (no time zone)
timestamp [ (p) ] with time zone	timestamptz	        date and time, including time zone
tsquery	 	                                            text search query
ts vector	 	                                        text search document
txid_snapshot	 	                                    user-level transaction ID snapshot (deprecated; see pg_snapshot)
uuid	 	                                            universally unique identifier
xml	 	                                                XML data
 */

DROP TABLE IF EXISTS tb_aluno;
DROP TABLE IF EXISTS tb_curso;

CREATE TABLE tb_aluno
(
    id              SERIAL,
    nome            VARCHAR(255),
    cpf             CHAR(11),
    observacao      TEXT,
    idade           INTEGER,
    dinheiro        NUMERIC(10, 2),
    altura          REAL,
    ativo           BOOLEAN,
    data_nascimento DATE,
    hora_aula       TIME,
    matriculado_em  TIMESTAMP,

    PRIMARY KEY (id)
);

-- Inserção de dados
INSERT INTO tb_aluno (nome, cpf, observacao, idade, dinheiro, altura, ativo, data_nascimento, hora_aula, matriculado_em)
VALUES ('Fulano', '12345678901', 'Aluno muito dedicado', 25, 1000.00, 1.75, TRUE, '1995-01-01', '08:00:00', NOW()),
       ('Ciclano', '12345678902', 'Aluno muito dedicado', 25, 1000.00, 1.75, TRUE, '1995-01-01', '08:00:00', NOW()),
       ('Beltrano', '12345678903', 'Aluno muito dedicado', 25, 1000.00, 1.75, TRUE, '1995-01-01', '08:00:00', NOW());

SELECT *
FROM tb_aluno;

DROP TABLE tb_aluno;

--Excluindo um registro da tabela
DELETE
FROM tb_aluno
WHERE id = 1;

SELECT nome AS "Nome do Aluno", cpf AS "CPF do Aluno"
FROM tb_aluno;

SELECT *
FROM aluno
WHERE cpf IS NULL;

SELECT *
FROM aluno
WHERE idade BETWEEN 10 AND 20;

SELECT *
FROM tb_aluno
WHERE nome LIKE 'F%'
  AND cpf IS NOT NULL;

CREATE TABLE tb_curso
(
    id            SERIAL,
    nome          VARCHAR(255),
    carga_horaria INTEGER,

    PRIMARY KEY (id)
);

INSERT INTO tb_curso (nome, carga_horaria)
VALUES ('Java', 40),
       ('Python', 40),
       ('C#', 40),
       ('PHP', 40),
       ('Ruby', 40);

CREATE TABLE tb_aluno_curso
(
    id_aluno INTEGER,
    id_curso INTEGER
);

INSERT INTO tb_aluno_curso (id_aluno, id_curso)
VALUES (1, 1),
       (1, 2),
       (2, 1),
       (2, 2),
       (3, 1),
       (3, 2);

--
SELECT a.nome AS "Nome do Aluno",
       c.nome AS "Nome do Curso"
FROM tb_aluno a
         JOIN tb_aluno_curso ac ON a.id = ac.id_aluno
         JOIN tb_curso c ON ac.id_curso = c.id;

-- LEFT JOIN
SELECT a.nome AS "Nome do Aluno",
       c.nome AS "Nome do Curso"
FROM tb_aluno a
         LEFT JOIN tb_aluno_curso ac ON a.id = ac.id_aluno
         LEFT JOIN tb_curso c ON ac.id_curso = c.id;

-- FULL JOIN
SELECT a.nome AS "Nome do Aluno",
       c.nome AS "Nome do Curso"
FROM tb_aluno a
         FULL JOIN tb_aluno_curso ac ON a.id = ac.id_aluno
         FULL JOIN tb_curso c ON ac.id_curso = c.id;

-- RIGHT JOIN
SELECT a.nome AS "Nome do Aluno",
       c.nome AS "Nome do Curso"
FROM tb_aluno a
         RIGHT JOIN tb_aluno_curso ac ON a.id = ac.id_aluno
         RIGHT JOIN tb_curso c ON ac.id_curso = c.id;

-- CROSS JOIN
SELECT a.nome AS "Nome do Aluno",
       c.nome AS "Nome do Curso"
FROM tb_aluno a
         CROSS JOIN tb_aluno_curso ac
         CROSS JOIN tb_curso c
