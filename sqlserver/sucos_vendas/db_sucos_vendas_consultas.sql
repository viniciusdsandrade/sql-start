SELECT * FROM [TABELA DE PRODUTOS] WHERE SABOR = 'Manga' OR SABOR = 'Laranja' OR SABOR = 'Melancia'; -- Selecionar todos os produtos com sabor de Manga, Laranja ou Melancia
SELECT * FROM [TABELA DE PRODUTOS] WHERE SABOR IN ('Manga', 'Laranja', 'Melancia');-- Uma forma mais eficiente de fazer a mesma seleção usando IN

SELECT * FROM [TABELA DE CLIENTE] WHERE ESTADO = 'RJ' OR ESTADO = 'SP'; -- Selecionar todos os clientes que estão nos estados RJ ou SP
SELECT * FROM [TABELA DE CLIENTE] WHERE ESTADO IN ('RJ', 'SP');         -- Usar IN para selecionar clientes nos estados RJ ou SP

SELECT * FROM [TABELA DE CLIENTE] WHERE ESTADO IN ('RJ', 'SP') AND IDADE >= 20 AND IDADE <= 28; -- Selecionar clientes nos estados RJ ou SP com idade entre 20 e 28
SELECT * FROM [TABELA DE CLIENTE] WHERE ESTADO IN ('RJ', 'SP') AND IDADE BETWEEN 20 AND 28;     -- Usar BETWEEN para a mesma seleção de idade

-- LIKE '%TESTE' Começa com qualuqer texto e termina com a palavra TESTE
-- LIKE 'TESTE%' Começa com a texto TESTE e termina com qualquer texto
-- LIKE '%TESTE%' Começa com qualquer texto, tem a palavra TESTE no meio e termina com qualquer texto
SELECT * FROM [TABELA DE PRODUTOS] WHERE SABOR LIKE '%limão'; -- Usar LIKE para selecionar produtos com sabores que terminam com "limão"
SELECT * FROM [TABELA DE PRODUTOS] WHERE SABOR LIKE '%lim%';  -- Usar LIKE para selecionar produtos com sabores que contêm a substring "lim"

SELECT DISTINCT SABOR AS 'NumeroDeSaboresDistintos' FROM [TABELA DE PRODUTOS];		   -- Consulta para listar sabores distintos na tabela:
SELECT COUNT(DISTINCT SABOR) AS 'NumeroDeSaboresDistintos' FROM [TABELA DE PRODUTOS]; -- Consulta para contar o número de sabores distintos na tabela:
SELECT COUNT(DISTINCT SABOR) AS 'NumeroDeSaboresDistintos' FROM [TABELA DE PRODUTOS]; -- Consulta para contar o número de sabores distintos na tabela:

SELECT TOP 5 * FROM [TABELA DE PRODUTOS] WHERE SABOR LIKE '%lim%'; -- Lista os 5 primeiros produtos cujo sabor contenha "lim" na tabela de produtos.
SELECT * FROM [TABELA DE PRODUTOS] ORDER BY [PRECO DE LISTA] ASC; -- Lista todos os produtos da tabela de produtos ordenados pelo preço de lista em ordem crescente.
SELECT * FROM [TABELA DE PRODUTOS] ORDER BY [PRECO DE LISTA] DESC; -- Lista todos os produtos da tabela de produtos ordenados pelo preço de lista em ordem decrescente.

SELECT * FROM [TABELA DE CLIENTE]; -- Seleciona todos os registros da tabela de clientes.
SELECT ESTADO, IDADE FROM [TABELA DE CLIENTE]; -- Seleciona apenas as colunas ESTADO e IDADE da tabela de clientes.
SELECT ESTADO, IDADE FROM [TABELA DE CLIENTE] ORDER BY ESTADO, IDADE; -- Seleciona as colunas ESTADO e IDADE da tabela de clientes e as ordena por ESTADO e IDADE.
SELECT ESTADO, SUM(IDADE) AS 'Idade' FROM  [TABELA DE CLIENTE] GROUP BY ESTADO; -- Calcula a soma das idades agrupadas por estado na tabela de clientes.
SELECT ESTADO, SUM([IDADE]) AS 'Idade' , SUM([LIMITE DE CREDITO]) AS 'LIMITE DE CREDITO' FROM  [TABELA DE CLIENTE] GROUP BY ESTADO; -- Calcula a soma das idades e do limite de crédito agrupados por estado na tabela de clientes.
SELECT ESTADO, COUNT(*) AS 'Numero de Clientes' FROM [TABELA DE CLIENTE] GROUP BY ESTADO; -- Conta o número de clientes agrupados por estado na tabela de clientes.
 
-- Conta o número de clientes com sabor de "Laranja" agrupados por embalagem na tabela de produtos.
SELECT EMBALAGEM, COUNT(*) AS 'Clientes' FROM [TABELA DE PRODUTOS]
WHERE SABOR = 'Laranja' GROUP BY EMBALAGEM;

--calcula o total do limite de crédito por estado na tabela de clientes e mostra apenas os estados onde a soma do limite de crédito é igual ou inferior a 900.000.
SELECT ESTADO, SUM([LIMITE DE CREDITO]) AS 'Credito'
FROM [TABELA DE CLIENTE]
GROUP BY ESTADO
HAVING SUM([LIMITE DE CREDITO]) <= 900000;

 --  extrai o preço máximo e mínimo de lista para produtos em diferentes embalagens na tabela de produtos, considerando apenas os produtos com preço de lista igual ou superior a 10, e em seguida, filtra os resultados para mostrar apenas as embalagens com um preço máximo de lista igual ou superior a 10.
 SELECT EMBALAGEM, MAX([PRECO DE LISTA]) AS PRECO_MAXX, MIN([PRECO DE LISTA]) AS PRECO_MIN
 FROM [TABELA DE PRODUTOS]
 WHERE [PRECO DE LISTA] >= 10
 GROUP BY EMBALAGEM
 HAVING MAX([PRECO DE LISTA]) >= 10



