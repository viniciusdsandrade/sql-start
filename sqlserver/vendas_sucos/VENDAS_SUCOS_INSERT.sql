INSERT INTO PRODUTOS (CODIGO, DESCRITOR, SABOR, TAMANHO, EMBALAGEM, PRECO_LISTA)
VALUES ('1040107', 'Light - 350 ml - Melancia', 'Melancia', '350 ml', 'Lata', 4.56);

SELECT *
FROM VENDEDORES;

SELECT *
FROM [TABELA DE VENDEDORES];

BEGIN TRANSACTION
SELECT *
FROM [TABELA DE VENDEDORES]
UPDATE VENDEDORES
SET COMISSAO = COMISSAO * 2;
COMMIT


BEGIN TRANSACTION

INSERT INTO VENDEDORES
VALUES ('239','Maria Joana','Copacabana',0.2,
'2015-01-01',1);

SELECT * FROM VENDEDORES

ROLLBACK


INSERT INTO PRODUTOS
SELECT CODIGO_DO_PRODUTO AS CODIGO,
       NOME_DO_PRODUTO   AS DESCRITOR,
       SABOR,
       TAMANHO,
       EMBALAGEM,
       PRECO_DE_LISTA    AS PRECO_LISTA
FROM SUCOS_FRUTAS.DBO.TABELA_DE_PRODUTOS
WHERE CODIGO_DO_PRODUTO <> '1040107';

SELECT *
FROM CLIENTES;


UPDATE [dbo].[CLIENTES]
SET [ENREDECO] = 'R. Jorge Emilio 23',
    [BAIRRO]   = 'Santo Amaro',
    [CIDADE]   = 'São Paulo',
    [ESTADO]   = 'SP',
    [CEP]      = '8833223'
WHERE [CPF] = '19290992743'

UPDATE [dbo].[CLIENTES]
SET [VOLUME_COMPRA] = [VOLUME_COMPRA] * 1.2
WHERE [ESTADO] = 'RJ'

SELECT A.CPF
FROM [dbo].[CLIENTES] A
         INNER JOIN [dbo].[VENDEDORES] B
                    ON A.[BAIRRO] = B.[BAIRRO]


INSERT INTO PRODUTOS
    (CODIGO, DESCRITOR, SABOR, TAMANHO, EMBALAGEM, PRECO_LISTA)
VALUES ('1001001', 'Sabor dos Alpes 700 ml - Manga', 'Manga', '700 ml', 'Garrafa', 7.50),
       ('1001000', 'Sabor dos Alpes 700 ml - Melão', 'Melão', '700 ml', 'Garrafa', 7.50),
       ('1001002', 'Sabor dos Alpes 700 ml - Graviola', 'Graviola', '700 ml', 'Garrafa', 7.50),
       ('1001003', 'Sabor dos Alpes 700 ml - Tangerina', 'Tangerina', '700 ml', 'Garrafa', 7.50),
       ('1001004', 'Sabor dos Alpes 700 ml - Abacate', 'Abacate', '700 ml', 'Garrafa', 7.50),
       ('1001005', 'Sabor dos Alpes 700 ml - Açai', 'Açai', '700 ml', 'Garrafa', 7.50),
       ('1001006', 'Sabor dos Alpes 1 Litro - Manga', 'Manga', '1 Litro', 'Garrafa', 7.50),
       ('1001007', 'Sabor dos Alpes 1 Litro - Melão', 'Melão', '1 Litro', 'Garrafa', 7.50),
       ('1001008', 'Sabor dos Alpes 1 Litro - Graviola', 'Graviola', '1 Litro', 'Garrafa', 7.50),
       ('1001009', 'Sabor dos Alpes 1 Litro - Tangerina', 'Tangerina', '1 Litro', 'Garrafa', 7.50),
       ('1001010', 'Sabor dos Alpes 1 Litro - Abacate', 'Abacate', '1 Litro', 'Garrafa', 7.50),
       ('1001011', 'Sabor dos Alpes 1 Litro - Açai', 'Açai', '1 Litro', 'Garrafa', 7.50);


SELECT *
FROM [PRODUTOS]
WHERE SUBSTRING([DESCRITOR], 1, 15) = 'Sabor dos Alpes';


SELECT *
FROM PRODUTOS
WHERE CODIGO = '1001000';


DELETE
FROM PRODUTOS
WHERE CODIGO = '1001000';

SELECT COUNT(*)
FROM SUCOS_FRUTAS.DBO.TABELA_DE_PRODUTOS;

SELECT COUNT(*)
FROM PRODUTOS;

SELECT *
FROM PRODUTOS
WHERE CODIGO NOT IN (SELECT CODIGO_DO_PRODUTO
                     FROM SUCOS_FRUTAS.DBO.TABELA_DE_PRODUTOS);

DELETE
FROM PRODUTOS
WHERE CODIGO NOT IN (SELECT CODIGO_DO_PRODUTO
                     FROM SUCOS_FRUTAS.DBO.TABELA_DE_PRODUTOS);