-- Comando para ver quais os bancos de dados existentes na sua Máquina
SELECT NAME
FROM sys.databases;

-- Comando para ver quais tabelas existem em um determinado banco de dados existente
USE SUCOS_FRUTAS; -- Substitua "SeuBancoDeDados" pelo nome do banco de dados que você deseja explorar.
SELECT TABLE_NAME
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_TYPE = 'BASE TABLE';


-- CREATE DATABASE SUCOS_FRUTAS;
DROP TABLE IF EXISTS ITENS_NOTAS_FISCAIS;
DROP TABLE IF EXISTS NOTAS_FISCAIS;
DROP TABLE IF EXISTS TABELA_DE_CLIENTES;
DROP TABLE IF EXISTS TABELA_DE_PRODUTOS;
DROP TABLE IF EXISTS TABELA_DE_VENDEDORES;

-- Verifica se a tabela TABELA_DE_CLIENTES já existe antes de criá-la
IF NOT EXISTS (SELECT 1
               FROM INFORMATION_SCHEMA.TABLES
               WHERE TABLE_NAME = 'TABELA_DE_CLIENTES')
    BEGIN
        CREATE TABLE TABELA_DE_CLIENTES
        (
            CPF                VARCHAR(11) PRIMARY KEY,
            NOME               VARCHAR(100) NULL,
            ENDERECO_1         VARCHAR(150) NULL,
            ENDERECO_2         VARCHAR(150) NULL,
            BAIRRO             VARCHAR(50)  NULL,
            CIDADE             VARCHAR(50)  NULL,
            ESTADO             VARCHAR(2)   NULL,
            CEP                VARCHAR(8)   NULL,
            DATA_DE_NASCIMENTO DATE         NULL,
            IDADE              INTEGER      NULL,
            GENERO             VARCHAR(1)   NULL,
            LIMITE_DE_CREDITO  FLOAT        NULL,
            VOLUME_DE_COMPRA   FLOAT        NULL,
            PRIMEIRA_COMPRA    BIT          NULL
        );
    END;

-- Repita o mesmo processo para as outras tabelas

IF NOT EXISTS (SELECT 1
               FROM INFORMATION_SCHEMA.TABLES
               WHERE TABLE_NAME = 'TABELA_DE_PRODUTOS')
    BEGIN
        CREATE TABLE TABELA_DE_PRODUTOS
        (
            CODIGO_DO_PRODUTO VARCHAR(10) PRIMARY KEY,
            NOME_DO_PRODUTO   VARCHAR(50) NULL,
            EMBALAGEM         VARCHAR(20) NULL,
            TAMANHO           VARCHAR(10) NULL,
            SABOR             VARCHAR(20) NULL,
            PRECO_DE_LISTA    FLOAT       NOT NULL
        );
    END;

IF NOT EXISTS (SELECT 1
               FROM INFORMATION_SCHEMA.TABLES
               WHERE TABLE_NAME = 'TABELA_DE_VENDEDORES')
    BEGIN
        CREATE TABLE TABELA_DE_VENDEDORES
        (
            MATRICULA           VARCHAR(5) PRIMARY KEY,
            NOME                VARCHAR(100) NULL,
            PERCENTUAL_COMISSAO FLOAT        NULL,
            DATA_ADMISSAO       DATE         NULL,
            DE_FERIAS           BIT          NULL,
            BAIRRO              VARCHAR(50)  NULL
        );
    END;

IF NOT EXISTS (SELECT 1
               FROM INFORMATION_SCHEMA.TABLES
               WHERE TABLE_NAME = 'NOTAS_FISCAIS')
    BEGIN
        CREATE TABLE NOTAS_FISCAIS
        (
            NUMERO     INTEGER PRIMARY KEY,
            CPF        VARCHAR(11) NOT NULL,
            MATRICULA  VARCHAR(5)  NOT NULL,
            DATA_VENDA DATE        NULL,
            IMPOSTO    FLOAT       NOT NULL,
            FOREIGN KEY (MATRICULA) REFERENCES TABELA_DE_VENDEDORES (MATRICULA),
            FOREIGN KEY (CPF) REFERENCES TABELA_DE_CLIENTES (CPF)
        );
    END;

IF NOT EXISTS (SELECT 1
               FROM INFORMATION_SCHEMA.TABLES
               WHERE TABLE_NAME = 'ITENS_NOTAS_FISCAIS')
    BEGIN
        CREATE TABLE ITENS_NOTAS_FISCAIS
        (
            CODIGO_DO_PRODUTO VARCHAR(10) NOT NULL,
            NUMERO            INTEGER     NOT NULL,
            QUANTIDADE        INTEGER     NOT NULL,
            PRECO             FLOAT       NOT NULL,
            PRIMARY KEY (NUMERO, CODIGO_DO_PRODUTO),
            FOREIGN KEY (CODIGO_DO_PRODUTO) REFERENCES TABELA_DE_PRODUTOS (CODIGO_DO_PRODUTO),
            FOREIGN KEY (NUMERO) REFERENCES NOTAS_FISCAIS (NUMERO)
        );
    END;

SELECT COUNT(*) AS 'TABELA_DE_CLIENTES' FROM TABELA_DE_CLIENTES ;
SELECT COUNT(*) AS 'TABELA_DE_PRODUTOS' FROM TABELA_DE_PRODUTOS ;
SELECT COUNT(*) AS 'TABELA_DE_VENDEDORES' FROM TABELA_DE_VENDEDORES ;
SELECT COUNT(*) AS 'NOTAS_FISCAIS' FROM NOTAS_FISCAIS ;
SELECT COUNT(*) AS 'ITENS_NOTAS_FISCAIS' FROM ITENS_NOTAS_FISCAIS ;