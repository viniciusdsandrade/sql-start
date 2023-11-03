-- ROUND: Arredonda um número decimal para o número inteiro mais próximo ou para um número específico de casas decimais.
-- CEILING: Arredonda um número decimal para cima para o inteiro mais próximo, sempre arredondando para um valor maior.
-- FLOOR: Arredonda um número decimal para baixo para o inteiro mais próximo, sempre arredondando para um valor menor.
-- POWER: Calcula a potência de um número, elevando-o a uma potência especificada.
-- EXP: Retorna o valor exponencial de um número especificado, e é usado em funções de crescimento exponencial.
-- SQRT: Calcula a raiz quadrada de um número, retornando o resultado como um número decimal.
-- SIGN: Retorna o sinal de um número como -1 para negativo, 0 para zero e 1 para positivo.
-- ABS: Retorna o valor absoluto de um número, sempre positivo ou zero.

SELECT ROUND(4.32334, 2);
SELECT ROUND(4.32334, 3);
SELECT ROUND(4.32334, 4);

SELECT FLOOR(4.32334);
SELECT CEILING(4.32334);
SELECT ROUND(4.32334, 0);

SELECT POWER(5, 10) AS ' 5^10';

SELECT SQRT(400);
SELECT ABS(10);
SELECT ABS(-10);

-- Na tabela de notas fiscais, temos o valor do imposto. 
-- Já na tabela de itens, temos a quantidade e o faturamento. 
-- Calcule o valor do imposto pago no ano de 2016, arredondando para o menor inteiro.
SELECT YEAR(DATA_VENDA) AS ANO,
       FORMAT(SUM(IMPOSTO * (QUANTIDADE * PRECO)), 'C', 'pt-BR') AS 'Imposto pago em reais'
FROM NOTAS_FISCAIS NF
         INNER JOIN
     ITENS_NOTAS_FISCAIS INF ON NF.NUMERO = INF.NUMERO
WHERE YEAR(DATA_VENDA) = 2016
GROUP BY YEAR(DATA_VENDA);
