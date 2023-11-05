--CAST:
-- A função CAST é usada para converter um valor de um tipo de dados em outro tipo de dados compatível. Ela é usada da seguinte maneira:
SELECT CAST(42.75 AS int);

-- CONVERT:
-- A função CONVERT é semelhante à função CAST, mas oferece mais flexibilidade e opções, especialmente quando se trata de formatar datas e horas. Ela é usada da seguinte maneira:
SELECT CONVERT(varchar, GETDATE(), 100); -- mon dd yyyy hh:miAM (ou PM)
SELECT CONVERT(varchar, GETDATE(), 101); -- mm/dd/yyyy
SELECT CONVERT(varchar, GETDATE(), 102); -- yyyy.mm.dd
SELECT CONVERT(varchar, GETDATE(), 103); -- dd/mm/yyyy
SELECT CONVERT(varchar, GETDATE(), 104); -- dd.mm.yyyy
SELECT CONVERT(varchar, GETDATE(), 105); -- dd-mm-yyyy
SELECT CONVERT(varchar, GETDATE(), 106); -- dd mon yyyy hh:mi:ss:ms AM (ou PM)
SELECT CONVERT(varchar, GETDATE(), 107); -- Mon dd, yyyy hh:mi:sec AM (ou PM)
SELECT CONVERT(varchar, GETDATE(), 108); -- hh:mi:ss
SELECT CONVERT(varchar, GETDATE(), 109); -- mon dd yyyy hh:mi:sec:mmm AM (ou PM)
SELECT CONVERT(varchar, GETDATE(), 110); -- mm-dd-yyyy
SELECT CONVERT(varchar, GETDATE(), 111); -- yyyy/mm/dd
SELECT CONVERT(varchar, GETDATE(), 112); -- yyyymmdd
SELECT CONVERT(varchar, GETDATE(), 113); -- dd mon yyyy hh:mi:ss:mmm
SELECT CONVERT(varchar, GETDATE(), 114); -- hh:mi:ss:mmm(24h)
SELECT CONVERT(varchar, GETDATE(), 115); -- dd-mon-yyyy hh:mi:sec:mmm AM (ou PM)
SELECT CONVERT(varchar, GETDATE(), 116); -- yyyy-mm-dd hh:mi:sec:mmm
SELECT CONVERT(varchar, GETDATE(), 117); -- hh:mi:ss:mmm
SELECT CONVERT(varchar, GETDATE(), 118); -- mon dd yyyy hh:mi:ss:mmm AM (ou PM)
SELECT CONVERT(varchar, GETDATE(), 119); -- yyyy-mm-dd hh:mi:ss:mmm
SELECT CONVERT(varchar, GETDATE(), 120); -- yyyy-mm-dd hh:mi:ss(24h)
SELECT CONVERT(varchar, GETDATE(), 121); -- yyyy-mm-dd hh:mi:ss.mmm


SELECT CONVERT(VARCHAR(10), GETDATE(), 121);
SELECT CONVERT(VARCHAR(25), GETDATE(), 121);

-- Selecionar todos os dados da tabela 'TABELA_DE_CLIENTES'
SELECT *
FROM TABELA_DE_CLIENTES;

-- Selecionar a coluna 'DATA_DE_NASCIMENTO' e convertê-la para um formato específico da tabela 'TABELA_DE_CLIENTES'
SELECT DATA_DE_NASCIMENTO, CONVERT(VARCHAR(25), DATA_DE_NASCIMENTO, 106)
FROM TABELA_DE_CLIENTES;

-- Selecionar nomes de produtos e formatar os preços com um símbolo de moeda da tabela 'TABELA_DE_PRODUTOS'
SELECT NOME_DO_PRODUTO, CONCAT('R$', ROUND(PRECO_DE_LISTA, 2)) AS 'Preço'
FROM TABELA_DE_PRODUTOS;

-- Calcular e exibir o valor total das compras para cada cliente no ano de 2016
SELECT TC.NOME,
       CONCAT('O cliente ', TC.NOME, ' comprou R$ ',
              TRIM(STR(SUM(IT.QUANTIDADE * IT.PRECO), 10, 2)), ' no ano de ', YEAR(NF.DATA_VENDA), '.') AS VALOR
FROM NOTAS_FISCAIS AS NF
         INNER JOIN ITENS_NOTAS_FISCAIS AS IT ON NF.NUMERO = IT.NUMERO
         INNER JOIN TABELA_DE_CLIENTES AS TC ON NF.CPF = TC.CPF
WHERE YEAR(NF.DATA_VENDA) = '2016'
GROUP BY TC.NOME, YEAR(NF.DATA_VENDA);