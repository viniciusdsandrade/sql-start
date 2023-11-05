-- Exibir todos os registros da tabela "TABELA_DE_VENDEDORES":
SELECT * FROM TABELA_DE_VENDEDORES ;

-- Exibir todos os registros da tabela "NOTAS_FISCAIS":
SELECT * FROM NOTAS_FISCAIS;

-- Contar o n�mero de notas por matr�cula (vendedor) na tabela "NOTAS_FISCAIS"
SELECT NF.MATRICULA AS 'Matr�cula', NOME AS 'Funcion�rio', COUNT(*) AS 'Total Vendas'
FROM TABELA_DE_VENDEDORES AS V 
INNER JOIN  NOTAS_FISCAIS AS NF ON NF.MATRICULA = V.MATRICULA 
GROUP BY NF.MATRICULA, NOME;

SELECT * FROM ITENS_NOTAS_FISCAIS; -- Consulta para exibir todos os registros da tabela ITENS_NOTAS_FISCAIS
SELECT * FROM TABELA_DE_PRODUTOS; -- Consulta para exibir todos os registros da tabela TABELA_DE_PRODUTOS

-- Consulta para obter o c�digo do produto e a quantidade total de vendas para cada produto
-- onde a quantidade total seja maior que 394,000
-- A sa�da � ordenada pela quantidade total em ordem decrescente
SELECT CODIGO_DO_PRODUTO, SUM(QUANTIDADE) AS QUANTIDADE FROM ITENS_NOTAS_FISCAIS 
GROUP BY CODIGO_DO_PRODUTO HAVING SUM(QUANTIDADE) > 394000 
ORDER BY SUM(QUANTIDADE) DESC;

-- Consulta para obter o nome do produto, c�digo do produto e quantidade total de vendas
-- para cada produto onde a quantidade total seja maior que 394,000
-- A sa�da � ordenada pela quantidade total em ordem decrescente
SELECT TP.NOME_DO_PRODUTO AS 'Produto', INF.CODIGO_DO_PRODUTO AS 'C�digo', SUM(QUANTIDADE) AS 'Quantidade' 
FROM ITENS_NOTAS_FISCAIS AS INF INNER JOIN TABELA_DE_PRODUTOS AS TP 
ON TP.CODIGO_DO_PRODUTO = INF.CODIGO_DO_PRODUTO
GROUP BY INF.CODIGO_DO_PRODUTO, TP.NOME_DO_PRODUTO
HAVING SUM(INF.QUANTIDADE) > 394000 
ORDER BY SUM(INF.QUANTIDADE) DESC;