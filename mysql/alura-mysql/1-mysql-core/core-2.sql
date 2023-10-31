/*
    1 - Criar uma tabela caso não exista
    2 - Modificar tabela
    3 - Deletar tabela caso exista
*/

DROP DATABASE IF EXISTS db_core_2;
CREATE SCHEMA IF NOT EXISTS db_core_2;
USE db_core_2;

CREATE TABLE IF NOT EXISTS tb_pessoa
(
    id_pessoa INT UNSIGNED     NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nome      VARCHAR(100)     NOT NULL,
    sobrenome VARCHAR(100)     NOT NULL,
    idade     TINYINT UNSIGNED NOT NULL
);

CREATE TABLE IF NOT EXISTS tb_cidade
(
    id_cidade INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nome      VARCHAR(100) NOT NULL,
    uf        CHAR(2)      NOT NULL
);

ALTER TABLE tb_pessoa
    ADD COLUMN email VARCHAR(100) NOT NULL AFTER sobrenome;

ALTER TABLE tb_pessoa
    DROP COLUMN email;

/* Como adicionar chaves */
ALTER TABLE tb_pessoa
    ADD COLUMN id_cidade INT UNSIGNED NOT NULL AFTER id_pessoa,
    ADD CONSTRAINT fk_tb_pessoa_tb_cidade FOREIGN KEY (id_cidade) REFERENCES tb_cidade (id_cidade);

/* Como remover chaves */
ALTER TABLE tb_pessoa
    DROP FOREIGN KEY fk_tb_pessoa_tb_cidade;

ALTER TABLE tb_pessoa
    DROP COLUMN id_cidade;

DROP TABLE IF EXISTS tb_pessoa;