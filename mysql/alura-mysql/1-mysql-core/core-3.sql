/*
    1 - Inserir um registro | Inserir varios registros
    2 - Atualizar um registro | Atualizar varios registros
    3 - Excluir um registro | Excluir varios registros
    4 - Consultar um registro | Consultar varios registros
*/

DROP SCHEMA IF EXISTS db_core_3;
CREATE SCHEMA IF NOT EXISTS db_core_3;
USE db_core_3;

CREATE TABLE IF NOT EXISTS tb_pessoa
(
    id_pessoa BIGINT UNSIGNED  NOT NULL AUTO_INCREMENT,
    nome      VARCHAR(50)      NOT NULL,
    sobrenome VARCHAR(50)      NOT NULL,
    idade     TINYINT UNSIGNED NOT NULL,

    PRIMARY KEY (id_pessoa)
);

INSERT INTO tb_pessoa (nome, sobrenome, idade)
VALUES ('João', 'Silva', 30);
INSERT INTO tb_pessoa (nome, sobrenome, idade)
VALUES ('Maria', 'Silva', 25);

INSERT INTO tb_pessoa (nome, sobrenome, idade)
VALUES ('João', 'Silva', 30),
       ('Maria', 'Silva', 25);

SELECT *
FROM tb_pessoa;

UPDATE tb_pessoa
SET nome = 'João Pedro'
WHERE id_pessoa = 1;

UPDATE tb_pessoa
SET nome = 'João Pedro'
WHERE nome = 'João';

DELETE
FROM tb_pessoa
WHERE id_pessoa = 1;