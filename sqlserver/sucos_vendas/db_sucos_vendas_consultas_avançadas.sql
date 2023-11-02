-- Classificação avançada com CASE/WHEN/THEN/ELSE/END

-- A sintaxe CASE/WHEN/THEN/ELSE/END é usada em SQL para realizar avaliações condicionais e retornar valores diferentes com base em uma expressão condicional.
-- Ela permite criar expressões condicionais personalizadas em uma consulta.
-- A estrutura geral é a seguinte:

/*
CASE
  WHEN condição_1 THEN valor_1
  WHEN condição_2 THEN valor_2
  ...
  WHEN condição_n THEN valor_n
  ELSE valor_padrão
END
 */

-- Esta consulta seleciona o nome e o preço de lista de produtos da tabela de produtos
-- que têm o sabor 'Manga'.
SELECT [NOME DO PRODUTO], [PRECO DE LISTA]
FROM [TABELA DE PRODUTOS]
WHERE SABOR = 'Manga';

-- Seleciona o nome do produto e o preço de lista de uma tabela de produtos.
-- Em seguida, utiliza a expressão CASE para classificar cada produto com base em seu preço,
-- atribuindo uma das três categorias:
-- 'PRODUTO CARO' se o preço for igual ou superior a 12,
-- 'PRODUTO NA MÉDIA' se estiver entre 7 e 11.99, e
-- 'PRODUTO BARATO' se for inferior a 7.
--  Os resultados são ordenados pelo preço de lista.
SELECT [NOME DO PRODUTO], [PRECO DE LISTA],
	(CASE
		WHEN [PRECO DE LISTA] >= 12 THEN 'PRODUTO CARO'
		WHEN [PRECO DE LISTA] >= 7 AND [PRECO DE LISTA] < 12 THEN 'PRODUTO NA MEDIA'
		ELSE 'PRODUTO BARATO'
	END) AS 'Classificação'
FROM [TABELA DE PRODUTOS]
ORDER BY [PRECO DE LISTA];

-- Esta consulta calcula a classificação e conta o número de produtos com base na faixa de preço (CARO, NA MEDIA ou BARATO) na tabela de produtos.
SELECT
	(CASE
		WHEN [PRECO DE LISTA] >= 12 THEN 'PRODUTO CARO'
		WHEN [PRECO DE LISTA] >= 7 AND [PRECO DE LISTA] < 12 THEN 'PRODUTO NA MEDIA'
		ELSE 'PRODUTO BARATO'
	END) AS 'Classificação', COUNT(*) AS 'Numero de produtos'
FROM [TABELA DE PRODUTOS]
GROUP BY (CASE
		WHEN [PRECO DE LISTA] >= 12 THEN 'PRODUTO CARO'
		WHEN [PRECO DE LISTA] >= 7 AND [PRECO DE LISTA] < 12 THEN 'PRODUTO NA MEDIA'
		ELSE 'PRODUTO BARATO'
	END);