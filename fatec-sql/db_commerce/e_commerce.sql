#BACKUP DATABASE e_commerce
#TO DISK = 'D:\Systems_Analysis_and_Development_FATEC\ADS_FATEC\1_semestre\banco_de_dados\exercicios\Exe11'
#WITH DIFFERENTIAL;

#DROP DATABASE IF EXISTS e_commerce;
CREATE DATABASE IF NOT EXISTS e_commerce;
USE e_commerce;
SET SQL_SAFE_UPDATES = 0;
#------------------------------------------------------------------------------------------------------------#
SELECT * FROM statusPagamento;
SELECT * FROM tipoPagamento;
SELECT * FROM endereco;

SELECT * FROM categoria;
SELECT * FROM produtoCategoriaDetalhes;

SELECT * FROM produto;
SELECT * FROM produtoNome;
SELECT * FROM produtoDescricao;
SELECT * FROM produtoQuantidade;

SELECT * FROM cliente;
SELECT * FROM pagamentoTipoCliente;
SELECT * FROM clientePessoaFisica;
SELECT * FROM clientePessoaJuridica;
SELECT * FROM clienteEnderecoDetalhes;
SELECT * FROM contatoCliente;

SELECT * FROM cliente;
SELECT * FROM contatoCliente;
SELECT * FROM pedido;
SELECT * FROM itemPedido;

SELECT * FROM pedido;
SELECT * FROM itemPedido;
SELECT * FROM statusPedido;
SELECT * FROM pedidoStatus;
SELECT * FROM pedidoDataEntrega;

SELECT * FROM transportadora;
SELECT * FROM transportadoraContato;
SELECT * FROM transportadoraEndereco;
SELECT * FROM transportePedido;

SELECT * FROM pagamento;
#------------------------------------------------------------------------------------------------------------#
#0 - Lista completa dos pedidos realizado pelo id_cliente = x
SELECT * FROM pedido WHERE id_cliente = 18;

#0 - Todos os Pedidos realizados entre 2 datas
SELECT * FROM pedido WHERE data_pedido BETWEEN '2023-01-01' AND '2023-12-31';

#1 - Lista de produtos em ordem crescente de preço
SELECT * FROM produto ORDER BY preco ASC;

#2 - Obter o número total de encomendas por tipo de cliente:
SELECT CASE 
         WHEN cpj.id_cliente IS NOT NULL THEN 'Pessoa Jurídica' 
         WHEN cpf.id_cliente IS NOT NULL THEN 'Pessoa Física' 
         ELSE 'Unknown' 
       END as tipo_cliente, COUNT(p.id_pedido) as total_pedidos
FROM pedido AS p
LEFT JOIN clientePessoaJuridica AS cpj ON p.id_cliente = cpj.id_cliente
LEFT JOIN clientePessoaFisica AS cpf ON p.id_cliente = cpf.id_cliente
GROUP BY tipo_cliente;

#3 - acessorio_automovelNumero total de vendas
SELECT SUM(quantidade) AS 'Total de produtos Vendidos'
FROM itemPedido;

#4 - Contar o número de pedidos em cada status:
SELECT s.id_status_pedido AS 'Status', s.descricao AS 'Descricao', COUNT(p.id_pedido) AS 'Total de Pedidos'
FROM statusPedido AS s
LEFT JOIN pedidoStatus AS ps ON s.id_status_pedido = ps.id_status_pedido
LEFT JOIN pedido AS p ON ps.id_pedido = p.id_pedido
GROUP BY s.id_status_pedido, s.descricao;

#5 - Encontrar a receita total gerada por cada cliente:
SELECT c.id_cliente AS 'ID', CONCAT(c.nome, ' ', c.sobrenome) AS 'Cliente', SUM(p.preco * ip.quantidade) AS 'Receita'
FROM cliente c
JOIN pedido pe ON c.id_cliente = pe.id_cliente
JOIN itemPedido ip ON pe.id_pedido = ip.id_pedido
JOIN produto p ON ip.id_produto = p.id_produto
GROUP BY c.id_cliente, c.nome
ORDER BY SUM(p.preco * ip.quantidade);

SELECT SUM(p.preco * ip.quantidade) AS 'Receita'
FROM pedido pe
JOIN itemPedido ip ON pe.id_pedido = ip.id_pedido
JOIN produto p ON ip.id_produto = p.id_produto;

#6 - Cotar quantidade de itens por cliente, consequentemente por pedido
SELECT c.id_cliente AS 'ID', CONCAT(c.nome, ' ', c.sobrenome) AS 'Cliente', SUM(ip.quantidade) AS 'quantidadeTotal'
FROM cliente AS c
INNER JOIN pedido AS p ON c.id_cliente = p.id_cliente
INNER JOIN itemPedido AS ip ON ip.id_pedido = p.id_pedido
GROUP BY c.id_cliente, 'quantidadeTotal'
ORDER BY SUM(ip.quantidade) ASC;

#7 - Determinar o número total de produtos em estoque separados por nome:
SELECT pn.nome AS 'Produto', SUM(pq.quantidade) AS 'Quantidade Total'
FROM produtoQuantidade pq
JOIN produtoNome pn ON pq.id_produto = pn.id_produto
GROUP BY pn.nome
ORDER BY SUM(pq.quantidade) DESC;

#8 - Encontrar a receita total gerada por cada cliente  :
SELECT c.id_cliente AS 'ID', concat(c.nome, ' ',c.sobrenome)  AS 'Cliente', SUM(p.preco * ip.quantidade) AS 'Total'
FROM cliente c
JOIN pedido pe ON c.id_cliente = pe.id_cliente
JOIN itemPedido ip ON pe.id_pedido = ip.id_pedido
JOIN produto p ON ip.id_produto = p.id_produto
GROUP BY c.id_cliente, c.nome;

#9 - Tipos de pagamentos mais utilizados:
SELECT tp.descricao_tipo_pagamento AS 'Tipo de pagamento' , COUNT(p.id_pedido)  AS 'Quantidade de compras'
	FROM tipoPagamento AS tp
	LEFT JOIN pagamento AS p ON tp.id_tipo_pagamento = p.id_tipo_pagamento
	GROUP BY tp.descricao_tipo_pagamento;
    
#9.1 - Tipo de pagamento utilizado por cada cliente e a quantidade de vezes que foi utilizada
SELECT concat(c.nome, ' ',c.sobrenome)  AS 'Cliente', tp.descricao_tipo_pagamento AS 'Formato de pagamento', pc.quantidade 'Quantidade'
FROM cliente AS c
JOIN pagamentoTipoCliente pc ON c.id_cliente = pc.id_cliente
JOIN tipoPagamento tp ON pc.id_tipo_pagamento = tp.id_tipo_pagamento
ORDER BY c.nome ASC; 

#10 - Encontrar o número total de produtos vendidos para cada categoria:
SELECT c.id_categoria AS 'ID', c.nome AS 'Categoria', SUM(ip.quantidade) AS 'Quantidade total'  FROM categoria c 
JOIN produtoCategoriaDetalhes pcd ON c.id_categoria = pcd.id_categoria
JOIN produto p ON pcd.id_produto = p.id_produto
JOIN itemPedido ip ON p.id_produto = ip.id_produto
GROUP BY c.id_categoria, c.nome
ORDER BY SUM(ip.quantidade) DESC;

#11 - Encontrar o número de clientes ativos que fizeram uma compra no último mês:
SELECT COUNT(DISTINCT p.id_cliente) AS 'Cliente ativos'
FROM pedido as p
WHERE p.data_pedido >= DATE_SUB(NOW(), INTERVAL 1 MONTH);
	
#11.1 - Selecione o nome dos clientes ativos no ultimo mes e a quantidade de itens relativas a cada cliente
SELECT CONCAT(c.nome, ' ', c.sobrenome) AS 'Cliente', SUM(ip.quantidade) as 'Quantidade' 
FROM pedido AS p 
INNER JOIN cliente AS c ON c.id_cliente = p.id_cliente
INNER JOIN itemPedido AS ip ON ip.id_pedido = p.id_pedido
WHERE p.data_pedido >= DATE_SUB(NOW(), INTERVAL 1 MONTH)
GROUP BY c.id_cliente
ORDER BY SUM(ip.quantidade) ASC;

#12 - Encontrar os 10 produtos mais populares com base no número total de unidades vendidas:
SELECT pn.nome AS 'Produto', SUM(ip.quantidade) AS 'QuantidadeTotal'
FROM produto AS p
INNER JOIN produtoNome AS pn ON p.id_produto = pn.id_produto
INNER JOIN itemPedido AS ip ON p.id_produto = ip.id_produto
GROUP BY pn.nome
ORDER BY SUM(ip.quantidade) DESC
LIMIT 10;

#13 - Nome dos clientes que compraram mais de 69 unidades e a respectiviva quantidade:
SELECT c.nome AS 'Cliente', SUM(ip.quantidade) AS 'Quantidade'
FROM cliente AS c
INNER JOIN pedido AS p ON c.id_cliente = p.id_cliente
INNER JOIN itemPedido AS ip ON ip.id_pedido = p.id_pedido
GROUP BY c.nome
HAVING SUM(ip.quantidade) >= 60
ORDER BY SUM(ip.quantidade) ASC;

#14 - Email dos clientes que compraram menos de 60 unidades nas suas compras na primeira semana de abril
SELECT CONCAT(c.nome, ' ', c.sobrenome) AS 'Cliente', cc.email AS 'E-Mail', SUM(ip.quantidade) AS 'Quantidade'
FROM cliente AS c
INNER JOIN contatoCliente AS cc ON c.id_cliente = cc.id_cliente
INNER JOIN pedido AS p ON c.id_cliente = p.id_cliente
INNER JOIN itemPedido AS ip ON ip.id_pedido = p.id_pedido
WHERE p.data_pedido BETWEEN '2023-05-01' AND '2023-05-07'
GROUP BY CONCAT(c.nome, ' ', c.sobrenome), cc.email
HAVING SUM(ip.quantidade) < 60
ORDER BY SUM(ip.quantidade) DESC;

#15 - Quais os tipos dos 10 clientes e seus respectivos nomes e email que teve a maior quantiade de unidades compradas na primeira semana de  Maio
SELECT CASE 
         WHEN cpj.id_cliente IS NOT NULL THEN 'Pessoa Jurídica' 
         WHEN cpf.id_cliente IS NOT NULL THEN 'Pessoa Física'
         ELSE 'Unknown' 
       END AS tipo_cliente, SUM(ip.quantidade) AS 'Quantidade', CONCAT(c.nome, ' ', c.sobrenome) AS 'Cliente', cc.email AS 'E-Mail'
FROM pedido AS p
LEFT JOIN clientePessoaJuridica AS cpj ON p.id_cliente = cpj.id_cliente
LEFT JOIN clientePessoaFisica AS cpf ON p.id_cliente = cpf.id_cliente
INNER JOIN itemPedido AS ip ON ip.id_pedido = p.id_pedido
INNER JOIN cliente AS C ON  p.id_cliente = c.id_cliente
INNER JOIN  contatoCliente AS cc ON c.id_cliente = cc.id_cliente
WHERE MONTH(data_pedido) = 5 
GROUP BY tipo_cliente, CONCAT(c.nome, ' ', c.sobrenome), cc.email
ORDER BY SUM(ip.quantidade) DESC
LIMIT 10;
-----------------------------------------------------------------------------------------------
#ENUM('Pendente', 'Aprovado', 'Rejeitado')
-- Criação da tabela statusPagamento
CREATE TABLE statusPagamento (
    id_status_pagamento TINYINT UNSIGNED NOT NULL,
    statusPagamentoDescricao VARCHAR(30) NOT NULL,
    PRIMARY KEY(id_status_pagamento)
);

#ENUM('CartaoCredito', 'CartaoDebito', 'Pix')
-- Criação da tabela tipoPagamento
CREATE TABLE tipoPagamento (
    id_tipo_pagamento TINYINT UNSIGNED AUTO_INCREMENT,
    descricao_tipo_pagamento VARCHAR(30) NOT NULL,
    PRIMARY KEY(id_tipo_pagamento)
);

-- Criação da tabela categoria
CREATE TABLE categoria (
    id_categoria MEDIUMINT UNSIGNED AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    descricao VARCHAR(80) NOT NULL,
    PRIMARY KEY (id_categoria)
);

-- Criação da tabela endereco
CREATE TABLE endereco (
    id_endereco INT UNSIGNED AUTO_INCREMENT NOT NULL,
    CEP VARCHAR(8) NOT NULL,
    numero MEDIUMINT UNSIGNED NOT NULL,
    complemento VARCHAR(60) NOT NULL,
    PRIMARY KEY(id_endereco, CEP, numero),
    INDEX idx_CEP (CEP)
);

-- Criação da tabela produto
CREATE TABLE produto (
    id_produto INT UNSIGNED AUTO_INCREMENT,
    codigo_barra VARCHAR(20) NOT NULL,
    preco DECIMAL(10,2) NOT NULL,
    PRIMARY KEY(id_produto),
    INDEX idx_codigo_barra (codigo_barra),
    UNIQUE(codigo_barra)
);

CREATE TABLE produtoNome (
    id_produto INT UNSIGNED NOT NULL,
    nome VARCHAR(100) NOT NULL,
    PRIMARY KEY(id_produto),
    
    FOREIGN KEY (id_produto) REFERENCES produto(id_produto)
		ON DELETE CASCADE
		ON UPDATE CASCADE
);

CREATE TABLE produtoDescricao (
    id_produto INT UNSIGNED NOT NULL,
    descricao VARCHAR(100) NOT NULL,
    PRIMARY KEY(id_produto),
    
    FOREIGN KEY (id_produto) REFERENCES produto(id_produto)
		ON DELETE CASCADE
		ON UPDATE CASCADE
);

-- Create the produtoQuantidade table
CREATE TABLE produtoQuantidade (
    id_produto INT UNSIGNED NOT NULL,
    quantidade MEDIUMINT UNSIGNED NOT NULL,
    PRIMARY KEY (id_produto),
    
    FOREIGN KEY (id_produto) REFERENCES produto (id_produto)
    ON DELETE CASCADE
	ON UPDATE CASCADE
);

-- Criação da tabela ProdutoCategoria
CREATE TABLE produtoCategoriaDetalhes (
    id_produto INT UNSIGNED NOT NULL,
    id_categoria MEDIUMINT UNSIGNED NOT NULL,
    PRIMARY KEY (id_produto, id_categoria),
    
    FOREIGN KEY (id_produto) REFERENCES produto(id_produto)
		ON DELETE CASCADE
		ON UPDATE CASCADE,
    
    FOREIGN KEY (id_categoria) REFERENCES categoria(id_categoria)
		ON DELETE CASCADE
		ON UPDATE CASCADE
);

-- Create the table cliente
CREATE TABLE cliente (
    id_cliente INT UNSIGNED AUTO_INCREMENT,
    nome VARCHAR(30) NOT NULL,
    sobrenome VARCHAR(40) NULL,
    PRIMARY KEY(id_cliente)
);

-- Criação da tabela pagamentoTipoCliente
CREATE TABLE pagamentoTipoCliente (
    id_cliente INT UNSIGNED NOT NULL,
    id_tipo_pagamento TINYINT UNSIGNED NOT NULL,
    quantidade MEDIUMINT UNSIGNED NOT NULL,
    PRIMARY KEY (id_cliente, id_tipo_pagamento),
    
    FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente)
		ON DELETE CASCADE
		ON UPDATE CASCADE,
    
    FOREIGN KEY (id_tipo_pagamento) REFERENCES tipoPagamento(id_tipo_pagamento)
		ON DELETE CASCADE
		ON UPDATE CASCADE
);

-- Create the clientePessoaJuridica table
CREATE TABLE clientePessoaJuridica (
    id_cliente INT UNSIGNED NOT NULL,
    CNPJ VARCHAR(14) NOT NULL,
    inscricao_estadual VARCHAR(12) NOT NULL,
    PRIMARY KEY (CNPJ, id_cliente),
    UNIQUE (id_cliente),
    UNIQUE (CNPJ),
    INDEX idx_CNPJ (CNPJ),
    
    FOREIGN KEY (id_cliente) REFERENCES cliente (id_cliente)
		ON DELETE CASCADE
		ON UPDATE CASCADE
);

-- Create the clientePessoaFisica table
CREATE TABLE clientePessoaFisica (
    id_cliente INT UNSIGNED NOT NULL,
    CPF VARCHAR(11) NOT NULL,
    PRIMARY KEY (CPF, id_cliente),
    UNIQUE (id_cliente),
    UNIQUE (CPF),
    INDEX idx_CPF (CPF), 
    
    FOREIGN KEY (id_cliente) REFERENCES cliente (id_cliente)
		ON DELETE CASCADE
		ON UPDATE CASCADE
);

CREATE TABLE clienteEnderecoDetalhes (
    id_cliente INT UNSIGNED NOT NULL,
    id_endereco INT UNSIGNED NOT NULL,
    UNIQUE(id_endereco),
    PRIMARY KEY (id_cliente, id_endereco),
     
    FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente)
		ON DELETE CASCADE
		ON UPDATE CASCADE,
    
    FOREIGN KEY (id_endereco) REFERENCES endereco(id_endereco)
		ON DELETE CASCADE
		ON UPDATE CASCADE
);

-- Create the contatoCliente table
CREATE TABLE contatoCliente (
    id_contato_cliente INT UNSIGNED AUTO_INCREMENT,
    id_cliente INT UNSIGNED NOT NULL,
    telefone VARCHAR(20) NOT NULL,
    email VARCHAR(100) NOT NULL,
	INDEX idx_email (email),
    INDEX idx_telefone (telefone),
    PRIMARY KEY (id_contato_cliente, id_cliente),
    
    FOREIGN KEY (id_cliente) REFERENCES cliente (id_cliente)
		ON DELETE CASCADE
		ON UPDATE CASCADE
);

-- Criação da tabela pedido
CREATE TABLE pedido (
    id_pedido BIGINT UNSIGNED AUTO_INCREMENT,
    id_cliente INT UNSIGNED NOT NULL,
    data_pedido DATETIME NOT NULL,
    UNIQUE(data_pedido, id_cliente),
    PRIMARY KEY (id_pedido, data_pedido),
    
    FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente)
		ON DELETE CASCADE
		ON UPDATE CASCADE
);

-- Criação da tabela ItemPedido
CREATE TABLE itemPedido (
    id_item_pedido BIGINT UNSIGNED AUTO_INCREMENT,
    id_pedido BIGINT UNSIGNED NOT NULL,
    id_produto INT UNSIGNED NOT NULL,
    quantidade MEDIUMINT UNSIGNED NOT NULL,
    PRIMARY KEY(id_item_pedido),
    
    FOREIGN KEY (id_pedido) REFERENCES pedido(id_pedido)
		ON DELETE CASCADE
		ON UPDATE CASCADE,
    
    FOREIGN KEY (id_produto) REFERENCES produto(id_produto)
		ON DELETE CASCADE
		ON UPDATE CASCADE
);

#ENUM('Pendente', 'Processando', 'Enviado', 'Entregue', 'Cancelado')
#criacao da tabela statusPedido
CREATE TABLE statusPedido(
	id_status_pedido TINYINT UNSIGNED AUTO_INCREMENT,
	descricao  VARCHAR(30) NOT NULL,
    PRIMARY KEY (id_status_pedido)
);

CREATE TABLE pedidoStatus (
    id_pedido BIGINT UNSIGNED NOT NULL,
    id_status_pedido TINYINT UNSIGNED NOT NULL,
    PRIMARY KEY (id_pedido, id_status_pedido),
    
    FOREIGN KEY (id_pedido) REFERENCES pedido(id_pedido)
		ON DELETE CASCADE
		ON UPDATE CASCADE,
    
    FOREIGN KEY (id_status_pedido) REFERENCES statusPedido(id_status_pedido)
		ON DELETE CASCADE
		ON UPDATE CASCADE
);

CREATE TABLE pedidoDataEntrega (
    id_pedido BIGINT UNSIGNED NOT NULL,
    data_entrega DATETIME NULL,
    PRIMARY KEY(id_pedido),
    
    FOREIGN KEY (id_pedido) REFERENCES pedido(id_pedido)
		ON DELETE CASCADE
		ON UPDATE CASCADE
);

-- Criação da tabela transportadora
CREATE TABLE transportadora (
    id_transportadora INT UNSIGNED AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    PRIMARY KEY(id_transportadora)
);

CREATE TABLE transportadoraContato (
    id_transportadora INT UNSIGNED NOT NULL,
    email VARCHAR(100) NOT NULL,
    telefone VARCHAR(20) NOT NULL,
	INDEX idx_email (email),
    INDEX idx_telefone (telefone),
    PRIMARY KEY (id_transportadora),
    
    FOREIGN KEY (id_transportadora) REFERENCES transportadora (id_transportadora)
		ON DELETE CASCADE
		ON UPDATE CASCADE
);

CREATE TABLE transportadoraEndereco (
    id_transportadora INT UNSIGNED NOT NULL,
    id_endereco INT UNSIGNED NOT NULL,
	UNIQUE(id_endereco),
    PRIMARY KEY (id_transportadora, id_endereco),
    
    FOREIGN KEY (id_transportadora) REFERENCES transportadora (id_transportadora)
		ON DELETE CASCADE
		ON UPDATE CASCADE,
    
    FOREIGN KEY (id_endereco) REFERENCES endereco (id_endereco)
		ON DELETE CASCADE
		ON UPDATE CASCADE
);

-- Create the table transportePedido
CREATE TABLE transportePedido (
    id_transportadora INT UNSIGNED NOT NULL,
    id_pedido BIGINT UNSIGNED NOT NULL,
    PRIMARY KEY(id_pedido, id_transportadora),
    
    FOREIGN KEY(id_pedido) REFERENCES pedido(id_pedido)
		ON DELETE CASCADE
		ON UPDATE CASCADE,
    
    FOREIGN KEY(id_transportadora) REFERENCES transportadora(id_transportadora)
		ON DELETE CASCADE
		ON UPDATE CASCADE
);

CREATE TABLE pagamento (
    id_pagamento INT UNSIGNED AUTO_INCREMENT,
    id_pedido BIGINT UNSIGNED NOT NULL,
    id_tipo_pagamento TINYINT UNSIGNED NOT NULL,
    id_status_pagamento TINYINT UNSIGNED NOT NULL,
    PRIMARY KEY(id_pagamento),
    
    FOREIGN KEY (id_pedido) REFERENCES pedido(id_pedido)
		ON DELETE CASCADE
		ON UPDATE CASCADE,
    
    FOREIGN KEY (id_tipo_pagamento) REFERENCES tipoPagamento(id_tipo_pagamento)
		ON DELETE CASCADE
		ON UPDATE CASCADE,
    
    FOREIGN KEY (id_status_pagamento) REFERENCES statusPagamento(id_status_pagamento)
		ON DELETE CASCADE
		ON UPDATE CASCADE
);
#---------------------------------------------------------------------------------------------------------------------------#
-- Populando a tabela statusPagamento
INSERT INTO statusPagamento (id_status_pagamento, statusPagamentoDescricao)
VALUES (1, 'Pendente'),
       (2, 'Aprovado'),
       (3, 'Rejeitado');

-- Populando a tabela tipoPagamento
INSERT INTO tipoPagamento (descricao_tipo_pagamento)
VALUES ('CartaoCredito'),
       ('CartaoDebito'),
       ('Pix');

-- Inserção na tabela categoriaNome
INSERT INTO categoria (nome, descricao) VALUES
('Eletrônicos', 'Produtos eletrônicos, como celulares, TVs, eletrodomésticos, etc.'),
('Roupas', 'Roupas e acessórios de moda para homens, mulheres e crianças'),
('Alimentos', 'Alimentos diversos, incluindo grãos, enlatados, laticínios, etc.'),
('Acessórios', 'Acessórios diversos, como bolsas, carteiras, óculos, etc.'),
('Cosméticos', 'Produtos de cuidados pessoais, beleza e cosméticos'),
('Livros', 'Livros de diversos gêneros, incluindo ficção, não-ficção, etc.'),
('Esportes', 'Produtos relacionados a esportes e atividades físicas'),
('Móveis', 'Móveis para diferentes ambientes da casa'),
('Brinquedos', 'Brinquedos para todas as idades e gostos'),
('Automóveis', 'Produtos relacionados a automóveis, peças, acessórios, etc.'),
('Jogos', 'Jogos de videogame e jogos de tabuleiro'),
('Joias', 'Joias em ouro, prata e outros materiais preciosos'),
('Bebidas', 'Bebidas alcoólicas e não alcoólicas'),
('Perfumes', 'Perfumes e fragrâncias'),
('Filmes', 'Filmes em DVD, Blu-ray e outros formatos'),
('Academia', 'Equipamentos e acessórios para academia e exercícios físicos'),
('Decoração', 'Produtos para decoração de interiores'),
('Instrumentos Musicais', 'Instrumentos musicais diversos, como guitarras, pianos, etc.'),
('Ferramentas', 'Ferramentas manuais e elétricas para diversos fins'),
('Pet Shop', 'Produtos para cuidados e acessórios para animais de estimação');


-- Inserção na tabela produto
INSERT INTO produto (codigo_barra, preco) VALUES
('7891111111111', 5.99),
('7891212121212', 2.50),
('7891313131313', 8.75),
('7891414141414', 6.20),
('7891515151515', 4.50),
('7891616161616', 3.80),
('7891717171717', 9.99),
('7891818181818', 7.50),
('7891919191919', 12.99),
('7892020202020', 10.00),
('7892121212121', 15.99),
('7892222222222', 4.50),
('7892323232323', 7.75),
('7892424242424', 9.20),
('7892525252525', 3.50),
('7892626262626', 6.80),
('7892727272727', 12.99),
('7892828282828', 8.50),
('7892929292929', 6.99),
('7893030303030', 11.00);

-- Inserção na tabela produtoNome
INSERT INTO produtoNome (id_produto, nome) VALUES
(1, 'Margarina'),
(2, 'Sal Refinado'),
(3, 'Refrigerante de Cola'),
(4, 'Pão de Forma'),
(5, 'Detergente Líquido'),
(6, 'Molho de Tomate'),
(7, 'Cerveja Pilsen'),
(8, 'Presunto Fatiado'),
(9, 'Queijo Mussarela'),
(10, 'Chocolate em Barra'),
(11, 'Óleo de Soja'),
(12, 'Arroz Branco'),
(13, 'Água Mineral'),
(14, 'Biscoito Cream Cracker'),
(15, 'Sabonete Líquido'),
(16, 'Massa de Macarrão'),
(17, 'Bola de Futebol'),
(18, 'Cadeira de Escritório'),
(19, 'Boneca de Pelúcia'),
(20, 'Lâmpada LED');

-- Inserção na tabela produtoDescricao
INSERT INTO produtoDescricao (id_produto, descricao) VALUES
(1, 'Margarina cremosa, pote com 250g'),
(2, 'Sal refinado iodado, pacote de 1kg'),
(3, 'Refrigerante de cola, lata de 350ml'),
(4, 'Pão de forma integral, pacote com 16 fatias'),
(5, 'Detergente líquido neutro, frasco de 500ml'),
(6, 'Molho de tomate tradicional, sachê de 340g'),
(7, 'Cerveja pilsen nacional, lata de 350ml'),
(8, 'Presunto fatiado, embalagem de 100g'),
(9, 'Queijo mussarela fatiado, embalagem de 150g'),
(10, 'Chocolate em barra ao leite, tablete de 100g'),
(11, 'Óleo de soja refinado, garrafa de 900ml'),
(12, 'Arroz branco tipo 1, pacote de 5kg'),
(13, 'Água mineral sem gás, garrafa de 1,5L'),
(14, 'Biscoito cream cracker, pacote de 400g'),
(15, 'Sabonete líquido suave, frasco de 250ml'),
(16, 'Massa de macarrão espaguete, pacote de 500g'),
(17, 'Bola de futebol de campo tamanho 5'),
(18, 'Cadeira de escritório com encosto e regulagem de altura'),
(19, 'Boneca de pelúcia com 30cm de altura'),
(20, 'Lâmpada LED de 9W, luz branca, bocal E27');

-- Inserção na tabela produtoQuantidade
INSERT INTO produtoQuantidade (id_produto, quantidade) VALUES
(1, 40),
(2, 70),
(3, 25),
(4, 50),
(5, 60),
(6, 30),
(7, 20),
(8, 45),
(9, 55),
(10, 75),
(11, 35),
(12, 60),
(13, 80),
(14, 50),
(15, 70),
(16, 40),
(17, 25),
(18, 15),
(19, 20),
(20, 50);

-- Inserção na tabela produtoCategoriaDetalhes
INSERT INTO produtoCategoriaDetalhes (id_produto, id_categoria) VALUES
(1, 3),
(2, 4),
(3, 5),
(4, 3),
(5, 2),
(6, 5),
(7, 7),
(8, 3),
(9, 4),
(10, 1),
(11, 3),
(12, 3),
(13, 9),
(14, 5),
(15, 5),
(16, 3),
(17, 7),
(18, 8),
(19, 9),
(20, 17);

-- Inserção na tabela cliente
INSERT INTO cliente (nome, sobrenome) VALUES
('João', 'Silva'),
('Maria', 'Santos'),
('Pedro', 'Ferreira'),
('Ana', 'Lima'),
('Lucas', 'Souza'),
('Camila', 'Gomes'),
('Rafael', 'Almeida'),
('Julia', 'Rodrigues'),
('Gustavo', 'Pereira'),
('Larissa', 'Carvalho'),
('Google Inc.',''),
('Apple Inc.',''),
('Microsoft Corporation',''),
('Amazon.com, Inc.',''),
('Facebook, Inc.',''),
('Samsung Electronics Co., Ltd.',''),
('Walmart Inc.',''),
('Toyota Motor Corporation',''),
('Intel Corporation',''),
('Nike, Inc.','');

-- Inserção na tabela contatoCliente
INSERT INTO contatoCliente (id_cliente, telefone, email) VALUES
(1, '987654321', 'joao.silva@example.com'),
(2, '876543210', 'maria.santos@example.com'),
(3, '765432109', 'pedro.ferreira@example.com'),
(4, '654321098', 'ana.lima@example.com'),
(5, '543210987', 'lucas.souza@example.com'),
(6, '432109876', 'camila.gomes@example.com'),
(7, '321098765', 'rafael.almeida@example.com'),
(8, '210987654', 'julia.rodrigues@example.com'),
(9, '109876543', 'gustavo.pereira@example.com'),
(10, '098765432', 'larissa.carvalho@example.com'),
(11, '111111111', 'contato@google.com'),
(12, '222222222', 'contato@apple.com'),
(13, '333333333', 'contato@microsoft.com'),
(14, '444444444', 'contato@amazon.com'),
(15, '555555555', 'contato@facebook.com'),
(16, '666666666', 'contato@samsung.com'),
(17, '777777777', 'contato@walmart.com'),
(18, '888888888', 'contato@toyota.com'),
(19, '999999999', 'contato@intel.com'),
(20, '000000000', 'contato@nike.com');

-- Inserção na tabela clientePessoaJuridica
INSERT INTO clientePessoaJuridica (id_cliente, CNPJ, inscricao_estadual) VALUES
(11, '12345678901234', '567890'),
(12, '23456789012345', '678901'),
(13, '34567890123456', '789012'),
(14, '45678901234567', '890123'),
(15, '56789012345678', '901234'),
(16, '67890123456789', '012345'),
(17, '78901234567890', '123456'),
(18, '89012345678901', '234567'),
(19, '90123456789012', '345678'),
(20, '01234567890123', '456789');

-- Inserção na tabela clientePessoaFisica
INSERT INTO clientePessoaFisica (id_cliente, CPF) VALUES
(1, '12345678901'),
(2, '23456789012'),
(3, '34567890123'),
(4, '45678901234'),
(5, '56789012345'),
(6, '67890123456'),
(7, '78901234567'),
(8, '89012345678'),
(9, '90123456789'),
(10, '01234567890');

INSERT INTO endereco (CEP, numero, complemento) VALUES
('12345678', 123, 'Apartamento 1'),
('23456789', 456, 'Casa 2'),
('34567890', 789, 'Apartamento 3'),
('45678901', 321, 'Casa 4'),
('56789012', 654, 'Apartamento 5'),
('67890123', 987, 'Casa 6'),
('78901234', 210, 'Apartamento 7'),
('89012345', 543, 'Casa 8'),
('90123456', 876, 'Apartamento 9'),
('01234567', 109, 'Casa 10'),
('11111111', 111, 'Sede Google'),
('22222222', 222, 'Sede Apple'),
('33333333', 333, 'Sede Microsoft'),
('44444444', 444, 'Sede Amazon'),
('55555555', 555, 'Sede Facebook'),
('66666666', 666, 'Sede Samsung'),
('77777777', 777, 'Sede Walmart'),
('88888888', 888, 'Sede Toyota'),
('99999999', 999, 'Sede Intel'),
('00000000', 000, 'Sede Nike'),
('11111112', 123, 'Indústria A'),
('22222223', 456, 'Indústria B'),
('33333334', 789, 'Indústria C'),
('44444445', 321, 'Indústria D'),
('55555556', 654, 'Indústria E'),
('66666667', 987, 'Indústria F'),
('77777778', 210, 'Indústria G'),
('88888889', 543, 'Indústria H'),
('99999998', 876, 'Indústria I'),
('00000001', 109, 'Indústria J');


-- Inserção na tabela clienteEnderecoDetalhes
INSERT INTO clienteEnderecoDetalhes (id_cliente, id_endereco) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10),
(12, 12),
(13, 13),
(14, 14),
(15, 15),
(16, 16),
(17, 17),
(18, 18),
(19, 19),
(20, 20);

INSERT INTO statusPedido (descricao) VALUES ('Pendente'),
											('Processando'),
											('Enviado'),
											('Entregue'),
											('Cancelado');

-- Inserir 20 registros na tabela pedido
INSERT INTO pedido (id_cliente, data_pedido)
VALUES
    (1, '2023-05-01 10:00:00'),
    (2, '2023-05-02 11:30:00'),
    (3, '2023-05-03 09:45:00'),
    (4, '2023-05-04 14:20:00'),
    (5, '2023-05-05 16:30:00'),
    (6, '2023-05-06 12:15:00'),
    (7, '2023-05-07 15:45:00'),
    (8, '2023-05-08 10:30:00'),
    (9, '2023-05-09 13:00:00'),
    (10, '2023-05-10 17:30:00'),
    (11, '2023-05-11 11:45:00'),
    (12, '2023-05-12 14:10:00'),
    (13, '2023-05-13 16:45:00'),
    (14, '2023-05-14 09:20:00'),
    (15, '2023-05-15 13:30:00'),
    (16, '2023-05-16 15:00:00'),
    (17, '2023-05-17 10:45:00'),
    (18, '2023-05-18 12:50:00'),
    (19, '2023-05-19 14:25:00'),
    (20, '2023-05-20 16:15:00');
    
-- Inserir 60 itens na tabela itemPedido
INSERT INTO itemPedido (id_pedido, id_produto, quantidade)
SELECT p.id_pedido, pr.id_produto, FLOOR(RAND() * 5) + 1
FROM pedido p
CROSS JOIN (
    SELECT id_produto
    FROM produto
    ORDER BY RAND()
    LIMIT 60
) AS pr
WHERE p.id_cliente BETWEEN 1 AND 20
ORDER BY p.id_cliente;

INSERT INTO pedidoStatus (id_pedido, id_status_pedido)
VALUES
(1, 1),
(1, 2),
(1, 3),
(2, 1),
(2, 2),
(2, 3),
(3, 2),
(3, 3),
(4, 1),
(4, 4),
(4, 5),
(5, 2),
(5, 4),
(6, 3),
(7, 5),
(8, 1),
(9, 2),
(10, 4),
(11, 3),
(12, 1);

#-- Inserir 20 registros na tabela pedidoDataEntrega
#INSERT INTO pedidoDataEntrega (id_pedido, data_entrega)
#SELECT p.id_pedido, DATE_ADD(p.data_pedido, INTERVAL FLOOR(RAND() * 10) + 1 DAY)
#FROM pedido p
#WHERE p.id_pedido BETWEEN 1 AND 20;

INSERT INTO pedidoDataEntrega (id_pedido, data_entrega)
VALUES
(1, '2023-05-12 14:00:00'),
(2, '2023-05-13 10:30:00'),
(3, '2023-05-14 16:45:00'),
(4, '2023-05-15 09:15:00'),
(5, '2023-05-16 11:20:00'),
(6, '2023-05-17 15:00:00'),
(7, '2023-05-18 13:40:00'),
(8, '2023-05-19 12:00:00'),
(9, '2023-05-20 17:30:00'),
(10, '2023-05-21 11:45:00'),
(11, '2023-05-22 14:20:00'),
(12, '2023-05-23 16:00:00'),
(13, '2023-05-24 15:30:00'),
(14, '2023-05-25 10:00:00'),
(15, '2023-05-26 12:30:00'),
(16, '2023-05-27 14:45:00'),
(17, '2023-05-28 16:20:00'),
(18, '2023-05-29 09:50:00'),
(19, '2023-05-30 11:15:00'),
(20, '2023-05-31 13:00:00');

-- Inserir dados na tabela transportadora
INSERT INTO transportadora (nome)
VALUES
    ('Transportadora A'),
    ('Transportadora B'),
    ('Transportadora C'),
    ('Transportadora D'),
    ('Transportadora E'),
    ('Transportadora F'),
    ('Transportadora G'),
    ('Transportadora H'),
    ('Transportadora I'),
    ('Transportadora J');
    
-- Inserir dados na tabela transportadoraContato
INSERT INTO transportadoraContato (id_transportadora, email, telefone)
VALUES
    (1, 'contato@transportadoraA.com', '(11) 1234-5678'),
    (2, 'contato@transportadoraB.com', '(11) 9876-5432'),
    (3, 'contato@transportadoraC.com', '(11) 1111-2222'),
    (4, 'contato@transportadoraD.com', '(11) 3333-4444'),
    (5, 'contato@transportadoraE.com', '(11) 5555-6666'),
    (6, 'contato@transportadoraF.com', '(11) 7777-8888'),
    (7, 'contato@transportadoraG.com', '(11) 9999-0000'),
    (8, 'contato@transportadoraH.com', '(11) 4444-3333'),
    (9, 'contato@transportadoraI.com', '(11) 2222-1111'),
    (10, 'contato@transportadoraJ.com', '(11) 8888-7777');
                          
INSERT INTO transportadoraEndereco (id_transportadora, id_endereco)
VALUES
    (1, 21),
    (2, 22),
    (3, 23),
    (4, 24),
    (5, 25),
    (6, 26),
    (7, 27),
    (8, 28),
    (9, 29),
    (10, 30);

INSERT INTO transportePedido (id_transportadora, id_pedido)
VALUES
    (1, 1),
    (2, 2),
    (3, 3),
    (4, 4),
    (5, 5),
    (6, 6),
    (7, 7),
    (8, 8),
    (9, 9),
    (10, 10);
												
-- Populando a tabela pagamentoTipoCliente
INSERT INTO pagamentoTipoCliente (id_cliente, id_tipo_pagamento, quantidade)
SELECT c.id_cliente, tp.id_tipo_pagamento, 0
FROM cliente c
CROSS JOIN tipoPagamento tp
WHERE c.id_cliente BETWEEN 1 AND 20;

INSERT INTO pagamento (id_pedido, id_tipo_pagamento, id_status_pagamento)
VALUES
    (1, 1, 1),
    (2, 2, 1),
    (3, 1, 2),
    (4, 3, 3),
    (5, 2, 2),
    (6, 1, 1),
    (7, 3, 1),
    (8, 2, 3),
    (9, 1, 2),
    (10, 3, 1),
	(11, 1, 1),
    (12, 2, 2),
    (13, 1, 1),
    (14, 2, 2),
    (15, 1, 1),
    (16, 2, 2),
    (17, 1, 1),
    (18, 2, 2),
    (19, 1, 1),
    (20, 2, 2);    														
                                                            