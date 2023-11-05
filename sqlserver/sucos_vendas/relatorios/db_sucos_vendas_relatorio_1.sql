-- Consulta 1: Seleciona o CPF, a data de venda e a quantidade de itens de todas as notas fiscais.
SELECT NF.CPF,
       NF.DATA_VENDA,
       INF.QUANTIDADE
FROM NOTAS_FISCAIS AS NF
         INNER JOIN ITENS_NOTAS_FISCAIS AS INF
                    ON NF.NUMERO = INF.NUMERO;

-- Consulta 2: Seleciona o CPF, a data de venda formatada como mês/ano e a soma da quantidade de itens por mês/ano.
SELECT NF.CPF,
       CONVERT(VARCHAR(10), NF.DATA_VENDA, 103) AS MES_ANO,
       SUM(INF.QUANTIDADE)                      AS QUANTIDADE_TOTAL
FROM NOTAS_FISCAIS AS NF
         INNER JOIN ITENS_NOTAS_FISCAIS AS INF
                    ON NF.NUMERO = INF.NUMERO
GROUP BY NF.CPF, CONVERT(VARCHAR(10), NF.DATA_VENDA, 103);

-- Consulta 3: Combina informações de clientes com a soma da quantidade de itens vendidos por CPF e mês/ano.
SELECT TC.CPF, TC.NOME, TC.VOLUME_DE_COMPRA, TV.MES_ANO, TV.QUANTIDADE_TOTAL
FROM TABELA_DE_CLIENTES AS TC
         INNER JOIN
     (SELECT NF.CPF,
             CONVERT(VARCHAR(10), NF.DATA_VENDA, 105) AS MES_ANO,
             SUM(INF.QUANTIDADE)                      AS QUANTIDADE_TOTAL
      FROM NOTAS_FISCAIS AS NF
               INNER JOIN ITENS_NOTAS_FISCAIS AS INF
                          ON NF.NUMERO = INF.NUMERO
      GROUP BY NF.CPF, CONVERT(VARCHAR(10), NF.DATA_VENDA, 105)) TV
     ON TV.CPF = TC.CPF;

-- Consulta 4: Combina informações de clientes com a soma da quantidade de itens vendidos por CPF e mês/ano,
-- e adiciona um resultado baseado na comparação do volume de compra e quantidade total de itens vendidos.
SELECT TC.CPF,
       TC.NOME,
       TC.VOLUME_DE_COMPRA,
       TV.MES_ANO,
       TV.QUANTIDADE_TOTAL,
       (IIF(TC.VOLUME_DE_COMPRA >= TV.QUANTIDADE_TOTAL, 'VENDAS VÁLIDAS', 'VENDAS INVÁLIDAS')) AS RESULTADO
FROM TABELA_DE_CLIENTES TC
         INNER JOIN (SELECT NF.CPF,
                            CONVERT(VARCHAR(7), NF.DATA_VENDA, 120) AS MES_ANO,
                            SUM(INF.QUANTIDADE)                     AS QUANTIDADE_TOTAL
                     FROM NOTAS_FISCAIS NF
                              INNER JOIN ITENS_NOTAS_FISCAIS INF ON NF.NUMERO = INF.NUMERO
                     GROUP BY NF.CPF, CONVERT(VARCHAR(7), NF.DATA_VENDA, 120)) TV ON TV.CPF = TC.CPF
WHERE TV.MES_ANO = '2015-01';

-- Consulta 5: Seleciona clientes com vendas inválidas e calcula a diferença em percentuais.
SELECT TC.CPF,
       TC.NOME,
       TC.VOLUME_DE_COMPRA                                                       AS LIMITE_VENDA,
       TV.MES_ANO,
       TV.QUANTIDADE_TOTAL                                                       AS VENDA_REALIZADA,
       (TC.VOLUME_DE_COMPRA - TV.QUANTIDADE_TOTAL)                               AS DIFERENCA,
       ((TC.VOLUME_DE_COMPRA - TV.QUANTIDADE_TOTAL) / TC.VOLUME_DE_COMPRA) * 100 AS PERCENTUAL_DIFERENCA
FROM TABELA_DE_CLIENTES TC
         INNER JOIN (SELECT NF.CPF,
                            CONVERT(VARCHAR(7), NF.DATA_VENDA, 120) AS MES_ANO,
                            SUM(INF.QUANTIDADE)                     AS QUANTIDADE_TOTAL
                     FROM NOTAS_FISCAIS NF
                              INNER JOIN ITENS_NOTAS_FISCAIS INF ON NF.NUMERO = INF.NUMERO
                     GROUP BY NF.CPF, CONVERT(VARCHAR(7), NF.DATA_VENDA, 120)) TV ON TV.CPF = TC.CPF
WHERE TV.MES_ANO = '2015-01'
  AND TC.VOLUME_DE_COMPRA < TV.QUANTIDADE_TOTAL;

-- Consulta 6:  Seleciona clientes com vendas inválidas e calcula o percentual da diferença.
SELECT TC.CPF,
       TC.NOME,
       TC.VOLUME_DE_COMPRA,
       TV.MES_ANO,
       TV.QUANTIDADE_TOTAL,
       IIF(TC.VOLUME_DE_COMPRA >= TV.QUANTIDADE_TOTAL, 'VENDAS VÁLIDAS', 'VENDAS INVÁLIDAS') AS RESULTADO,
       ROUND((1 - TC.VOLUME_DE_COMPRA / TV.QUANTIDADE_TOTAL) * 100, 2)                       AS PERCENTUAL
FROM TABELA_DE_CLIENTES TC
         INNER JOIN (SELECT NF.CPF,
                            CONVERT(VARCHAR(7), NF.DATA_VENDA, 120) AS MES_ANO,
                            SUM(INF.QUANTIDADE)                     AS QUANTIDADE_TOTAL
                     FROM NOTAS_FISCAIS NF
                              INNER JOIN ITENS_NOTAS_FISCAIS INF ON NF.NUMERO = INF.NUMERO
                     WHERE CONVERT(VARCHAR(7), NF.DATA_VENDA, 120) = '2015-01'
                     GROUP BY NF.CPF, CONVERT(VARCHAR(7), NF.DATA_VENDA, 120)) TV ON TV.CPF = TC.CPF
WHERE TC.VOLUME_DE_COMPRA < TV.QUANTIDADE_TOTAL;

-- Consulta 7:  Seleciona as vendas anuais de sucos de frutas por sabor e calcula o percentual em relação ao total anual.
SELECT VS.SABOR,
       VS.ANO,
       VS.VENDA_ANO,
       ROUND((CONVERT(FLOAT, VS.VENDA_ANO) / CONVERT(FLOAT, VA.VENDA_TOTAL_ANO)) * 100, 2) AS PERCENTUAL
FROM (SELECT TP.SABOR,
             YEAR(NF.DATA_VENDA) AS ANO,
             SUM(INF.QUANTIDADE) AS VENDA_ANO
      FROM TABELA_DE_PRODUTOS TP
               INNER JOIN ITENS_NOTAS_FISCAIS INF ON TP.CODIGO_DO_PRODUTO = INF.CODIGO_DO_PRODUTO
               INNER JOIN NOTAS_FISCAIS NF ON INF.NUMERO = NF.NUMERO
      WHERE YEAR(NF.DATA_VENDA) = 2015
      GROUP BY TP.SABOR, YEAR(NF.DATA_VENDA)) VS
         INNER JOIN (SELECT YEAR(NF.DATA_VENDA) AS ANO,
                            SUM(INF.QUANTIDADE) AS VENDA_TOTAL_ANO
                     FROM NOTAS_FISCAIS NF
                              INNER JOIN ITENS_NOTAS_FISCAIS INF ON NF.NUMERO = INF.NUMERO
                     WHERE YEAR(NF.DATA_VENDA) = 2015
                     GROUP BY YEAR(NF.DATA_VENDA)) VA ON VS.ANO = VA.ANO
ORDER BY VS.VENDA_ANO DESC;

-- Consulta 8: Seleciona as vendas anuais de sucos de frutas por sabor e calcula o percentual em relação ao total anual.
-- Subconsulta VS: Calcula as vendas anuais por sabor
-- Subconsulta VA: Calcula o total anual de vendas de sucos de frutas.
-- Consulta principal: Combina as subconsultas e calcula o percentual de vendas por sabor.
SELECT VS.TAMANHO,
       VS.ANO,
       VS.VENDA_ANO,
       ROUND((CONVERT(FLOAT, VS.VENDA_ANO) / CONVERT(FLOAT, VA.VENDA_TOTAL_ANO)) * 100, 2) AS PERCENTUAL
FROM (SELECT TP.TAMANHO
           , YEAR(NF.DATA_VENDA) AS ANO
           , SUM(INF.QUANTIDADE) AS VENDA_ANO
      FROM TABELA_DE_PRODUTOS TP
               INNER JOIN ITENS_NOTAS_FISCAIS INF
                          ON TP.CODIGO_DO_PRODUTO = INF.CODIGO_DO_PRODUTO
               INNER JOIN NOTAS_FISCAIS NF
                          ON INF.NUMERO = NF.NUMERO
      WHERE YEAR(NF.DATA_VENDA) = 2016
      GROUP BY TP.TAMANHO, YEAR(NF.DATA_VENDA)) VS
         INNER JOIN
     (SELECT YEAR(NF.DATA_VENDA) AS ANO
           , SUM(INF.QUANTIDADE) AS VENDA_TOTAL_ANO
      FROM NOTAS_FISCAIS NF
               INNER JOIN ITENS_NOTAS_FISCAIS INF
                          ON NF.NUMERO = INF.NUMERO
      WHERE YEAR(NF.DATA_VENDA) = 2016
      GROUP BY YEAR(NF.DATA_VENDA)) VA
     ON VS.ANO = VA.ANO
ORDER BY VS.VENDA_ANO DESC;