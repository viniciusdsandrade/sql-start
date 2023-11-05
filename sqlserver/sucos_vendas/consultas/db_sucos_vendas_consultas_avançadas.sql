-- Classifica��o avan�ada com CASE/WHEN/THEN/ELSE/END

-- A sintaxe CASE/WHEN/THEN/ELSE/END � usada em SQL para realizar avalia��es condicionais e retornar valores diferentes com base em uma express�o condicional.
-- Ela permite criar express�es condicionais personalizadas em uma consulta.
-- A estrutura geral � a seguinte:

/*
CASE
  WHEN condi��o_1 THEN valor_1
  WHEN condi��o_2 THEN valor_2
  ...
  WHEN condi��o_n THEN valor_n
  ELSE valor_padr�o
END
 */

-- Esta consulta seleciona o nome e o pre�o de lista de produtos da tabela de produtos
-- que t�m o sabor 'Manga'.
SELECT [NOME DO PRODUTO], [PRECO DE LISTA]
FROM [TABELA DE PRODUTOS]
WHERE SABOR = 'Manga';

-- Seleciona o nome do produto e o pre�o de lista de uma tabela de produtos.
-- Em seguida, utiliza a express�o CASE para classificar cada produto com base em seu pre�o,
-- atribuindo uma das tr�s categorias:
-- 'PRODUTO CARO' se o pre�o for igual ou superior a 12,
-- 'PRODUTO NA M�DIA' se estiver entre 7 e 11.99, e
-- 'PRODUTO BARATO' se for inferior a 7.
--  Os resultados s�o ordenados pelo pre�o de lista.
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