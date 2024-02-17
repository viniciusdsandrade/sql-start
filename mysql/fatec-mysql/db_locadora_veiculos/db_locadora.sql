DROP DATABASE IF EXISTS db_locadora;
CREATE DATABASE IF NOT EXISTS db_locadora;
USE db_locadora;

CREATE TABLE IF NOT EXISTS tb_endereco
(
    id          BIGINT UNSIGNED AUTO_INCREMENT,
    cep         VARCHAR(8)  NOT NULL,
    numero      VARCHAR(10) NOT NULL,
    complemento VARCHAR(100),

    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS tb_status_seguro
(
    id   TINYINT UNSIGNED AUTO_INCREMENT,
    nome ENUM ('ATIVO', 'INATIVO') NOT NULL,

    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS tb_tamanho_automovel
(
    id   TINYINT UNSIGNED AUTO_INCREMENT,
    nome ENUM ('PEQUENO', 'MÉDIO', 'GRANDE') NOT NULL,

    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS tb_cor_veiculo_locadora
(
    id   TINYINT UNSIGNED AUTO_INCREMENT,
    nome ENUM (
        'BRANCO',
        'PRETO',
        'PRATA',
        'CINZA',
        'VERMELHO',
        'AZUL',
        'VERDE',
        'AMARELO',
        'LARANJA',
        'ROSA') NOT NULL,

    PRIMARY KEY (id)
);