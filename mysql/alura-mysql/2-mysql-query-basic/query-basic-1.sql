/*
    1 -
    2 -
    3 -
    4 -
    5 -
*/

DROP DATABASE IF EXISTS db_query_basic_1;
CREATE DATABASE IF NOT EXISTS db_query_basic_1;
USE db_query_basic_1;


CREATE TABLE IF NOT EXISTS pessoa_fisica
(
    id              BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    nome            VARCHAR(255)    NOT NULL,
    cpf             VARCHAR(11)     NOT NULL,
    rg              VARCHAR(9)      NOT NULL,
    data_nascimento DATE            NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS pessoa_juridica
(
    id                 BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    nome               VARCHAR(255)    NOT NULL,
    cnpj               VARCHAR(14)     NOT NULL,
    inscricao_estadual VARCHAR(12)     NOT NULL,
    data_fundacao      DATE            NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS endereco
(
    id          BIGINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    cep         VARCHAR(8)   NOT NULL,
    logradouro  VARCHAR(255) NOT NULL,
    bairro      VARCHAR(255) NOT NULL,
    localidade  VARCHAR(255) NOT NULL,
    uf          VARCHAR(2)   NOT NULL,
    gia         VARCHAR(255) NOT NULL,
    ddd         VARCHAR(2)   NOT NULL,
    siafi       VARCHAR(255) NOT NULL,
    complemento VARCHAR(255) NULL
);

CREATE TABLE IF NOT EXISTS cnh
(
    id                        BIGINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    data_validade             DATE            NOT NULL,
    numero_registro           VARCHAR(11)     NOT NULL,
    categoria                 VARCHAR(2)      NOT NULL,
    pessoa_fisica_id          BIGINT UNSIGNED NOT NULL,
    data_primeira_habilitacao DATE            NOT NULL,
    data_nascimento           DATE            NOT NULL,

    FOREIGN KEY (pessoa_fisica_id) REFERENCES pessoa_fisica (id)
);

CREATE TABLE IF NOT EXISTS cliente
(
    id                 BIGINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    pessoa_fisica_id   BIGINT UNSIGNED NULL,
    pessoa_juridica_id BIGINT UNSIGNED NULL,
    endereco_cliente   BIGINT UNSIGNED NOT NULL,
    cnh_id             BIGINT UNSIGNED NULL,

    FOREIGN KEY (pessoa_fisica_id) REFERENCES pessoa_fisica (id),
    FOREIGN KEY (pessoa_juridica_id) REFERENCES pessoa_juridica (id),
    FOREIGN KEY (endereco_cliente) REFERENCES endereco (id),
    FOREIGN KEY (cnh_id) REFERENCES cnh (id)
);


INSERT INTO pessoa_fisica (nome, cpf, rg, data_nascimento)
VALUES ('João Silva', '12345678901', '123456789', '1990-05-15'),
       ('Maria Santos', '98765432101', '987654321', '1985-08-22'),
       ('Carlos Oliveira', '55555555501', '555555555', '2000-03-05'),
       ('Ana Rodrigues', '33333333301', '333333333', '1997-11-30'),
       ('Luiz Souza', '99999999901', '999999999', '1987-06-25');


INSERT INTO pessoa_juridica (nome, cnpj, inscricao_estadual, data_fundacao)
VALUES ('ABC Empresas Ltda.', '12345678901234', '123456789012', '2000-05-10'),
       ('XYZ Corporations Inc.', '98765432109876', '987654321098', '1995-08-22'),
       ('Tech Solutions LLC', '55555555555555', '555555555555', '2010-03-15'),
       ('Global Services Ltd.', '77777777777777', '777777777777', '2008-11-30'),
       ('Swift Enterprises Ltda.', '11111111111111', '111111111111', '2012-06-25');


INSERT INTO endereco (cep, logradouro, bairro, localidade, uf, gia, ddd, siafi, complemento)
VALUES ('12345678', 'Avenida Principal', 'Centro', 'São Paulo', 'SP', '123456', '11', '1234', 'Apto 101'),
       ('98765432', 'Rua Comercial', 'Bela Vista', 'Rio de Janeiro', 'RJ', '987654', '21', '9876', NULL),
       ('55555555', 'Estrada da Praia', 'Beira-Mar', 'Fortaleza', 'CE', '555555', '85', '5555', 'Casa Azul'),
       ('33333333', 'Rua das Flores', 'Jardim Botânico', 'Curitiba', 'PR', '333333', '41', '3333', NULL),
       ('99999999', 'Avenida das Palmeiras', 'Praia da Rocha', 'Portimão', 'PT', '999999', '12', '9999',
        'Casa de Praia');


INSERT INTO cnh (data_validade, numero_registro, categoria, pessoa_fisica_id, data_primeira_habilitacao,
                 data_nascimento)
VALUES ('2025-05-15', '98765432101', 'B', 1, '2008-06-01', '1990-05-15'),
       ('2024-08-22', '55555555501', 'A', 3, '2010-04-10', '2000-03-05'),
       ('2023-11-30', '33333333301', 'AB', 4, '2016-01-20', '1997-11-30'),
       ('2025-06-25', '99999999901', 'C', 5, '2013-09-15', '1987-06-25');


INSERT INTO cliente (pessoa_fisica_id, pessoa_juridica_id, endereco_cliente, cnh_id)
VALUES (1, NULL, 1, 1),
       (NULL, 2, 2, NULL),
       (3, NULL, 3, 2),
       (4, NULL, 4, 3),
       (5, NULL, 5, 4);


SELECT *
FROM pessoa_fisica;
SELECT *
FROM pessoa_juridica;



SELECT *
FROM pessoa_fisica
WHERE TIMESTAMPDIFF(YEAR, data_nascimento, CURDATE()) > 30;


SELECT c.id                       AS cliente_id,
       COALESCE(pf.nome, pj.nome) AS nome_cliente,
       CONCAT(
               FLOOR(TIMESTAMPDIFF(YEAR, pf.data_nascimento, CURDATE())), ' anos e ',
               TIMESTAMPDIFF(MONTH, DATE_ADD(pf.data_nascimento, INTERVAL
                                             FLOOR(TIMESTAMPDIFF(YEAR, pf.data_nascimento, CURDATE())) YEAR),
                             CURDATE()), ' meses'
       )                          AS idade_com_anos_meses,
       cnh.numero_registro        AS numero_cnh,
       cnh.categoria              AS categoria_cnh
FROM cliente c
         LEFT JOIN pessoa_fisica pf ON c.pessoa_fisica_id = pf.id
         LEFT JOIN pessoa_juridica pj ON c.pessoa_juridica_id = pj.id
         LEFT JOIN cnh ON pf.id = cnh.pessoa_fisica_id
WHERE TIMESTAMPDIFF(YEAR, pf.data_nascimento, CURDATE()) BETWEEN 18 AND 40;


SELECT c.id                       AS cliente_id,
       COALESCE(pf.nome, pj.nome) AS nome_cliente,
       e.logradouro,
       e.bairro,
       e.localidade,
       e.uf
FROM cliente c
         JOIN endereco e ON c.endereco_cliente = e.id
         LEFT JOIN pessoa_fisica pf ON c.pessoa_fisica_id = pf.id
         LEFT JOIN pessoa_juridica pj ON c.pessoa_juridica_id = pj.id
WHERE e.localidade = 'São Paulo';
