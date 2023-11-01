-- Classificação avançada com CASE/WHEN/THEN/ELSE/END

-- Esta consulta seleciona o nome e o preço de lista de produtos da tabela de produtos
-- que têm o sabor 'Manga'.
SELECT [NOME DO PRODUTO], [PRECO DE LISTA] 
FROM [TABELA DE PRODUTOS]
WHERE SABOR = 'Manga';

-- Esta consulta seleciona o nome, o preço de lista e uma classificação para produtos com sabor 'Manga' na tabela de produtos, ordenando-os pelo preço de lista.
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
