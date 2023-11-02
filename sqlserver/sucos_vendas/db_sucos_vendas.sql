DROP DATABASE IF EXISTS SUCOS_VENDAS; -- Dropa o banco de dados "SUCOS_VENDAS" se ele existir
CREATE DATABASE SUCOS_VENDAS; -- Cria o banco de dados "SUCOS_VENDAS"
DROP TABLE IF EXISTS [TABELA DE CLIENTE]; -- Remove a tabela "TABELA DE CLIENTE" se ela existir
DROP TABLE IF EXISTS [TABELA DE PRODUTOS]; -- Remove a tabela "TABELA DE PRODUTOS" se ela existir
DROP TABLE IF EXISTS [TABELA DE VENDEDORES]; -- Remove a tabela "TABELA DE VENDEDORES" se ela existir

-- Cria a tabela "TABELA DE CLIENTE" com as colunas especificadas
CREATE TABLE [TABELA DE CLIENTE] 
(
    [CPF]                [CHAR](11) NOT NULL PRIMARY KEY,
    [NOME]               [VARCHAR](150),
    [RUA]                [VARCHAR](150),
    [COMPLEMENTO]        [VARCHAR](150),
    [BAIRRO]             [VARCHAR](150),
    [ESTADO]             [VARCHAR](150),
    [CEP]                [CHAR](8),
    [DATA DE NASCIMENTO] [DATE],
    [IDADE]              [SMALLINT],
    [SEXO]               [CHAR](1),
    [LIMITE DE CREDITO]  [MONEY],
    [PRIMEIRA COMPRA]    [BIT]
);

-- Cria a tabela "TABELA DE PRODUTOS" com as colunas especificadas
CREATE TABLE [TABELA DE PRODUTOS]
(
    [CODIGO DE PRODUTO]   [VARCHAR](20) PRIMARY KEY,
    [NOME DO PRODUTO]     [VARCHAR](50),
    [EMBALAGEM]           [VARCHAR](50),
    [TAMANHO]             [VARCHAR](50),
    [SABOR]               [VARCHAR](50),
    [PRECO DE LISTA]      [SMALLMONEY]
);

-- Cria a tabela "TABELA DE VENDEDORES" com as colunas especificadas
CREATE TABLE [TABELA DE VENDEDORES]
(
    [MATRICULA]           [VARCHAR](5) NOT NULL PRIMARY KEY,
    [NOME]                [VARCHAR](100),
    [PERCENTUAL COMISSAO] [FLOAT]
);


INSERT INTO [TABELA DE PRODUTOS] VALUES (
	'1040107',
	'Light - 350 ml - Mel�ncia',
	'Lata',
	'350ml',
	'Melancia',
	4.56
);

INSERT INTO [TABELA DE PRODUTOS] VALUES (
	'1040108',
	'Light - 350 ml - Morango',
	'Lata',
	'350ml',
	'Morango',
	4.56
);

INSERT INTO [TABELA DE PRODUTOS] VALUES (
	'1040109',
	'Cl�ssico - 500 ml - Laranja',
	'Garrafa',
	'500ml',
	'Laranja',
	5.99
);

INSERT INTO [TABELA DE PRODUTOS] VALUES (
	'1040110',
	'Premium - 1 litro - Abacaxi',
	'Garrafa',
	'1 litro',
	'Abacaxi',
	8.99
);

INSERT INTO [TABELA DE PRODUTOS] VALUES (
	'1040111',
	'Fresco - 200 ml - Uva',
	'Lata',
	'200ml',
	'Uva',
	3.29
);

INSERT INTO [TABELA DE PRODUTOS] 
VALUES
    ('1040108', 'Light - 350 ml - Morango', 'Lata', '350ml', 'Morango', 4.56),
    ('1040109', 'Cl�ssico - 500 ml - Laranja', 'Garrafa', '500ml', 'Laranja', 5.99),
    ('1040110', 'Premium - 1 litro - Abacaxi', 'Garrafa', '1 litro', 'Abacaxi', 8.99),
    ('1040111', 'Fresco - 200 ml - Uva', 'Lata', '200ml', 'Uva', 3.29);

INSERT INTO [TABELA DE CLIENTE] ([CPF], [NOME], [RUA], [COMPLEMENTO], [BAIRRO], [ESTADO], [CEP], [DATA DE NASCIMENTO], [IDADE], [SEXO], [LIMITE DE CREDITO], [PRIMEIRA COMPRA]) 
VALUES
('12345678901', 'Jo�o da Silva', 'Rua das Flores', 'Apt 302', 'Centro', 'SP', '12345678', '1990-05-15', 32, 'M', 5000.00, 1),
('98765432101', 'Maria Santos', 'Av. Principal', 'Casa 10', 'Jardim Bot�nico', 'RJ', '98765432', '1985-12-20', 37, 'F', 6000.00, 1),
('11122233344', 'Carlos Souza', 'Rua do Com�rcio', 'Sala 5', 'Centro', 'MG', '11122233', '1982-03-10', 40, 'M', 4500.00, 1),
('55566677788', 'Ana Ferreira', 'Av. da Praia', 'Casa 3', 'Beira Mar', 'CE', '55566677', '1987-08-25', 35, 'F', 5500.00, 1),
('99900011122', 'Pedro Pereira', 'Rua dos Pinheiros', 'Apt 101', 'Jardim Paulista', 'SP', '99900011', '1995-06-03', 28, 'M', 4800.00, 1);


INSERT INTO [TABELA DE VENDEDORES] ([MATRICULA], [NOME],[PERCENTUAL COMISSAO])
VALUES
('00236', 'Cl�udia Morais', 8),
('00237', 'Marcela Ferreira', 9),
('00238', 'M�rcio Almeida', 8);

INSERT INTO [TABELA DE PRODUTOS] ([CODIGO DE PRODUTO], [NOME DO PRODUTO], [EMBALAGEM], [TAMANHO], [SABOR], [PRECO DE LISTA])
VALUES
('1042712', 'Linha Citros - 700 ml - Lim�o', 'Garrafa', '700 ml', 'Lim�o', 4.90),
('788975', 'Peda�os de Frutas - 1,5 Litros - Ma�a', 'PET', '1,5 Litros', 'Ma�a', 18.01),
('1002767', 'Videira do Campo - 700 ml - Cereja/Ma�a', 'Garrafa', '700 ml', 'Cereja/Ma�a', 8.41),
('231776', 'Festival de Sabores - 700 ml - A�ai', 'Garrafa', '700 ml', 'A�ai', 13.31),
('479745', 'Clean - 470 ml - Laranja', 'Garrafa', '470 ml', 'Laranja', 3.76),
('1051518', 'Frescor do Ver�o - 470 ml - Lim�o', 'Garrafa', '470 ml', 'Lim�o', 3.29),
('1101035', 'Linha Refrescante - 1 Litro - Morango/Lim�o', 'PET', '1 Litro', 'Morango/Lim�o', 9.01),
('229900', 'Peda�os de Frutas - 350 ml - Ma�a', 'Lata', '350 ml', 'Ma�a', 4.21),
('1086543', 'Linha Refrescante - 1 Litro - Manga', 'PET', '1 Litro', 'Manga', 11.01),
('695594', 'Festival de Sabores - 1,5 Litros - A�ai', 'PET', '1,5 Litros', 'A�ai', 28.51),
('838819', 'Clean - 1,5 Litros - Laranja', 'PET', '1,5 Litros', 'Laranja', 12.01),
('326779', 'Linha Refrescante - 1,5 Litros - Manga', 'PET', '1,5 Litros', 'Manga', 16.51),
('520380', 'Peda�os de Frutas - 1 Litro - Ma�a', 'PET', '1 Litro', 'Ma�a', 12.01),
('1041119', 'Linha Citros - 700 ml - Lima/Lim�o', 'Garrafa', '700 ml', 'Lima/Lim�o', 4.90),
('243083', 'Festival de Sabores - 1,5 Litros - Maracuj�', 'PET', '1,5 Litros', 'Maracuj�', 10.51),
('394479', 'Sabor da Montanha - 700 ml - Cereja', 'Garrafa', '700 ml', 'Cereja', 8.40),
('746596', 'Light - 1,5 Litros - Melancia', 'PET', '1,5 Litros', 'Melancia', 19.50),
('773912', 'Clean - 1 Litro - Laranja', 'PET', '1 Litro', 'Laranja', 8.01),
('826490', 'Linha Refrescante - 700 ml - Morango/Lim�o', 'Garrafa', '700 ml', 'Morango/Lim�o', 6.31),
('723457', 'Festival de Sabores - 700 ml - Maracuj�', 'Garrafa', '700 ml', 'Maracuj�', 4.91),
('812829', 'Clean - 350 ml - Laranja', 'Lata', '350 ml', 'Laranja', 2.80),
('290478', 'Videira do Campo - 350 ml - Melancia', 'Lata', '350 ml', 'Melancia', 4.56),
('783663', 'Sabor da Montanha - 700 ml - Morango', 'Garrafa', '700 ml', 'Morango', 7.70),
('235653', 'Frescor do Ver�o - 350 ml - Manga', 'Lata', '350 ml', 'Manga', 3.85),
('1002334', 'Linha Citros - 1 Litro - Lima/Lim�o', 'PET', '1 Litro', 'Lima/Lim�o', 7.00),
('1013793', 'Videira do Campo - 2 Litros - Cereja/Ma�a', 'PET', '2 Litros', 'Cereja/Ma�a', 24.01),
('1096818', 'Linha Refrescante - 700 ml - Manga', 'Garrafa', '700 ml', 'Manga', 7.71),
('1022450', 'Festival de Sabores - 2 Litros - A�ai', 'PET', '2 Litros', 'A�ai', 38.01);

INSERT INTO [TABELA DE PRODUTOS]
VALUES
('1042712','Linha Citros - 700 ml - Lim�o','Garrafa','Lim�o','700 ml',4.90),
('788975','Peda�os de Frutas - 1,5 Litros - Ma�a','PET','Ma�a','1,5 Litros',18.01),
('1002767','Videira do Campo - 700 ml - Cereja/Ma�a','Garrafa','Cereja/Ma�a','700 ml',8.41),
('231776','Festival de Sabores - 700 ml - A�ai','Garrafa','A�ai','700 ml',13.31),
('479745','Clean - 470 ml - Laranja','Garrafa','Laranja','470 ml',3.76),
('1051518','Frescor do Ver�o - 470 ml - Lim�o','Garrafa','Lim�o','470 ml',3.29),
('1101035','Linha Refrescante - 1 Litro - Morango/Lim�o','PET','Morango/Lim�o','1 Litro',9.01),
('229900','Peda�os de Frutas - 350 ml - Ma�a','Lata','Ma�a','350 ml',4.21),
('1086543','Linha Refrescante - 1 Litro - Manga','PET','Manga','1 Litro',11.01),
('695594','Festival de Sabores - 1,5 Litros - A�ai','PET','A�ai','1,5 Litros',28.51),
('838819','Clean - 1,5 Litros - Laranja','PET','Laranja','1,5 Litros',12.01),
('326779','Linha Refrescante - 1,5 Litros - Manga','PET','Manga','1,5 Litros',16.51),
('520380','Peda�os de Frutas - 1 Litro - Ma�a','PET','Ma�a','1 Litro',12.01),
('1041119','Linha Citros - 700 ml - Lima/Lim�o','Garrafa','Lima/Lim�o','700 ml',4.90),
('243083','Festival de Sabores - 1,5 Litros - Maracuj�','PET','Maracuj�','1,5 Litros',10.51),
('394479','Sabor da Montanha - 700 ml - Cereja','Garrafa','Cereja','700 ml',8.40),
('746596','Light - 1,5 Litros - Melancia','PET','Melancia','1,5 Litros',19.50),
('773912','Clean - 1 Litro - Laranja','PET','Laranja','1 Litro',8.01),
('826490','Linha Refrescante - 700 ml - Morango/Lim�o','Garrafa','Morango/Lim�o','700 ml',6.31),
('723457','Festival de Sabores - 700 ml - Maracuj�','Garrafa','Maracuj�','700 ml',4.91),
('812829','Clean - 350 ml - Laranja','Lata','Laranja','350 ml',2.80),
('290478','Videira do Campo - 350 ml - Melancia','Lata','Melancia','350 ml',4.56),
('783663','Sabor da Montanha - 700 ml - Morango','Garrafa','Morango','700 ml',7.70),
('235653','Frescor do Ver�o - 350 ml - Manga','Lata','Manga','350 ml',3.85),
('1002334','Linha Citros - 1 Litro - Lima/Lim�o','PET','Lima/Lim�o','1 Litro',7.00),
('1013793','Videira do Campo - 2 Litros - Cereja/Ma�a','PET','Cereja/Ma�a','2 Litros',24.01),
('1096818','Linha Refrescante - 700 ml - Manga','Garrafa','Manga','700 ml',7.71),
('1022450','Festival de Sabores - 2 Litros - A�ai','PET','A�ai','2 Litros',38.01);

-- Selecionar todos os registros da tabela de clientes
SELECT * FROM [TABELA DE CLIENTE];

-- Selecionar todos os registros da tabela de produtos
SELECT * FROM [TABELA DE PRODUTOS];

-- Selecionar todos os registros da tabela de vendedores
SELECT * FROM [TABELA DE VENDEDORES];

-- Selecionar o campo "ESTADO" duas vezes da tabela de clientes
SELECT [ESTADO], [ESTADO] FROM [TABELA DE CLIENTE];

-- Selecionar os campos "NOME" e "ESTADO" da tabela de clientes e ordenar pelo campo "NOME"
SELECT [NOME], [ESTADO] FROM [TABELA DE CLIENTE]
ORDER BY [NOME];

-- Selecionar os campos "NOME" e "ESTADO" da tabela de clientes, renomeando-os e ordenando pelo "NOME"
SELECT [NOME] AS 'Cliente', [ESTADO] AS 'UF' FROM [TABELA DE CLIENTE]
ORDER BY [NOME];

-- Selecionar valores distintos do campo "SABOR" da tabela de produtos
SELECT DISTINCT [SABOR] FROM [TABELA DE PRODUTOS];

-- Excluir todos os registros da tabela de produtos
DELETE FROM [TABELA DE PRODUTOS];

-- Selecionar os campos "NOME" e "ESTADO" da tabela de clientes onde "PRIMEIRA COMPRA" � igual a 1 e ordenar pelo "NOME"
SELECT [NOME] AS 'NOME DO CLIENTE', [ESTADO] AS 'UF', [PRIMEIRA COMPRA]
FROM [TABELA DE CLIENTE]
WHERE [PRIMEIRA COMPRA] = 1
ORDER BY [NOME];

-- Selecionar todos os registros da tabela de produtos onde o "PRECO DE LISTA" � menor ou igual a 7.70 e ordenar pelo "PRECO DE LISTA"
SELECT * FROM [TABELA DE PRODUTOS]
WHERE [PRECO DE LISTA] <= 7.70
ORDER BY [PRECO DE LISTA];

-- Selecionar os campos "NOME" e "DATA DE NASCIMENTO" da tabela de clientes onde a "DATA DE NASCIMENTO" � posterior a '1995-12-31'
SELECT [NOME] AS 'Nomes', [DATA DE NASCIMENTO]
FROM [TABELA DE CLIENTE]
WHERE [DATA DE NASCIMENTO] > '1995-12-31';

-- Selecionar os campos "NOME" e "DATA DE NASCIMENTO" da tabela de clientes onde o ano de nascimento seja posterior a 1995
SELECT [NOME], [DATA DE NASCIMENTO]
FROM [TABELA DE CLIENTE]
WHERE YEAR([DATA DE NASCIMENTO]) > 1995;

-- Selecionar os campos "NOME," "BAIRRO," "ESTADO," e "PRIMEIRA COMPRA" da tabela de clientes onde "PRIMEIRA COMPRA" � igual a 1 e "ESTADO" � igual a 'SP'
SELECT [NOME], [BAIRRO], [ESTADO], [PRIMEIRA COMPRA]
FROM [TABELA DE CLIENTE]
WHERE [PRIMEIRA COMPRA] = 1 AND [ESTADO] = 'SP'; 

-- Para praticar ainda mais a utiliza��o de filtros no SQL, te desafio a trazer as consultas abaixo:
-- 1 - Liste os vendedores que possuem comiss�o menor ou igual a 8%.
-- 2 - Liste os produtos que custam menos de 6 reais e est�o dispon�veis em lata.
-- 3 - Mostre todos os clientes que n�o s�o de S�o Paulo nem do Rio de Janeiro.

-- 1 - Liste os vendedores que possuem comiss�o menor ou igual a 8%.
SELECT * FROM [TABELA DE VENDEDORES] 
WHERE [PERCENTUAL COMISSAO] <= 8;

-- 2 - Liste os produtos que custam menos de 6 reais e est�o dispon�veis em lata.
SELECT * FROM [TABELA DE PRODUTOS]
WHERE [PRECO DE LISTA] < 6 AND [EMBALAGEM] = 'Lata';

-- 3 - Mostre todos os clientes que n�o s�o de S�o Paulo nem do Rio de Janeiro.
-- Abordagem 1: Usando a cl�usula NOT IN
SELECT * FROM [TABELA DE CLIENTE]
WHERE [ESTADO] NOT IN ('SP', 'RJ');

-- Abordagem 2: Usando a cl�usula NOT LIKE
SELECT * FROM [TABELA DE CLIENTE]
WHERE [ESTADO] NOT LIKE 'SP' AND [ESTADO] NOT LIKE 'RJ';

-- Abordagem 3: Usando subconsulta e UNION
SELECT * FROM [TABELA DE CLIENTE]
WHERE [ESTADO] NOT IN (SELECT 'SP' UNION SELECT 'RJ');

-- Atualiza o pre�o de lista de produtos em lata, reduzindo em 10%.
UPDATE [TABELA DE PRODUTOS]
SET [PRECO DE LISTA] = [PRECO DE LISTA] * 0.9
WHERE [EMBALAGEM] = 'Lata';

-- Atualiza a embalagem e o pre�o de um produto espec�fico com base no c�digo de produto.
UPDATE [TABELA DE PRODUTOS]
SET [EMBALAGEM] = 'Garrafa', [PRECO DE LISTA] = 8.10
WHERE [CODIGO DE PRODUTO] = '229900';

-- Deleta um produto espec�fico com base no c�digo de produto.
DELETE FROM [TABELA DE PRODUTOS]
WHERE [CODIGO DE PRODUTO] = '1022450';

-- Seleciona todos os registros da tabela de produtos onde o sabor seja igual a 'Manga', 'Laranja' ou 'Melancia'.
SELECT * FROM [TABELA DE PRODUTOS] WHERE SABOR IN ('Manga', 'Laranja', 'Melancia');