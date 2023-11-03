--- Bairros relacionados aos Clientes
SELECT DISTINCT BAIRRO FROM TABELA_DE_CLIENTES;

--- Bairros relacionados aos Vendedores
SELECT DISTINCT BAIRRO FROM TABELA_DE_VENDEDORES;

-- Operador 'UNION'. O UNION remove automaticamente os registros duplicados dos conjuntos de resultados combinados.
SELECT DISTINCT BAIRRO,  'Cliente' AS ORIGEM FROM TABELA_DE_CLIENTES
UNION
SELECT DISTINCT BAIRRO, 'Vendedor' AS ORIGEM FROM TABELA_DE_VENDEDORES;


-- Operador 'UNION ALL'. Se houver registros duplicados nas tabelas ou resultados das consultas, eles serão mantidos no resultado final
SELECT DISTINCT BAIRRO,  'Cliente' AS ORIGEM FROM TABELA_DE_CLIENTES
UNION 
SELECT DISTINCT BAIRRO, 'Vendedor' AS ORIGEM FROM TABELA_DE_VENDEDORES;


----------------------------------------------------------------------------------------------------------------------------------------

-- Substituição do 'HAVING' por subconsulta para obter médias de preços menores ou iguais a 10.
SELECT MEDIA_EMBALAGENS.EMBALAGEM, MEDIA_EMBALAGENS.PRECO_MEDIO
FROM (SELECT EMBALAGEM, AVG(PRECO_DE_LISTA) AS PRECO_MEDIO
      FROM TABELA_DE_PRODUTOS
      GROUP BY EMBALAGEM) MEDIA_EMBALAGENS
WHERE MEDIA_EMBALAGENS.PRECO_MEDIO <= 10;


CREATE VIEW MEDIA_EMBALAGENS AS 
SELECT EMBALAGEM, AVG(PRECO_DE_LISTA) AS PRECO_MEDIO
      FROM TABELA_DE_PRODUTOS
      GROUP BY EMBALAGEM


