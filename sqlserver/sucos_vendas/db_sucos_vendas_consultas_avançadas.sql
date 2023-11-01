-- Classifica��o avan�ada com CASE/WHEN/THEN/ELSE/END

-- Esta consulta seleciona o nome e o pre�o de lista de produtos da tabela de produtos
-- que t�m o sabor 'Manga'.
SELECT [NOME DO PRODUTO], [PRECO DE LISTA] 
FROM [TABELA DE PRODUTOS]
WHERE SABOR = 'Manga';

-- Esta consulta seleciona o nome, o pre�o de lista e uma classifica��o para produtos com sabor 'Manga' na tabela de produtos, ordenando-os pelo pre�o de lista.
SELECT [NOME DO PRODUTO], [PRECO DE LISTA],
	(CASE 
		WHEN [PRECO DE LISTA] >= 12 THEN 'PRODUTO CARO'
		WHEN [PRECO DE LISTA] >= 7 AND [PRECO DE LISTA] < 12 THEN 'PRODUTO NA MEDIA'
		ELSE 'PRODUTO BARATO' 
	END) AS 'Classifica��o'
FROM [TABELA DE PRODUTOS]
ORDER BY [PRECO DE LISTA];

-- Esta consulta calcula a classifica��o e conta o n�mero de produtos com base na faixa de pre�o (CARO, NA MEDIA ou BARATO) na tabela de produtos.
SELECT 
	(CASE 
		WHEN [PRECO DE LISTA] >= 12 THEN 'PRODUTO CARO'
		WHEN [PRECO DE LISTA] >= 7 AND [PRECO DE LISTA] < 12 THEN 'PRODUTO NA MEDIA'
		ELSE 'PRODUTO BARATO' 
	END) AS 'Classifica��o', COUNT(*) AS 'Numero de produtos'
FROM [TABELA DE PRODUTOS]
GROUP BY (CASE 
		WHEN [PRECO DE LISTA] >= 12 THEN 'PRODUTO CARO'
		WHEN [PRECO DE LISTA] >= 7 AND [PRECO DE LISTA] < 12 THEN 'PRODUTO NA MEDIA'
		ELSE 'PRODUTO BARATO' 
	END);
