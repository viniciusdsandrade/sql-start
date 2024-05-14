SELECT ABS(-17.4); -- Retorna o valor absoluto de -17.4, que é 17.4
SELECT CBRT(27.0); -- Retorna a raiz cúbica de 27.0, que é 3
SELECT CEIL(-42.8); -- Arredonda -42.8 para o inteiro mais próximo maior ou igual a -42.8, que é -42
SELECT CEILING(-95.3); -- Arredonda -95.3 para o inteiro mais próximo maior ou igual a -95.3, que é -95
SELECT DEGREES(0.5); -- Converte 0.5 radianos para graus, que é aproximadamente 28.65
SELECT DIV(9, 4); -- Retorna a parte inteira da divisão de 9 por 4, que é 2
SELECT EXP(1.0); -- Retorna o valor exponencial de 1.0, que é aproximadamente 2.72
SELECT FACTORIAL(5); -- Retorna o fatorial de 5, que é 120
SELECT FLOOR(-42.8); -- Arredonda -42.8 para o inteiro mais próximo menor ou igual a -42.8, que é -43
SELECT LN(2.0); -- Retorna o logaritmo natural de 2.0, que é aproximadamente 0.69
SELECT LOG(100.0); -- Retorna o logaritmo de base 10 de 100.0, que é 2
SELECT LOG(2.0, 64.0); -- Retorna o logaritmo de base 2.0 de 64.0, que é 6
SELECT MOD(9, 4); -- Retorna o resto da divisão de 9 por 4, que é 1
SELECT PI(); -- Retorna a constante π, que é aproximadamente 3.14
SELECT POWER(9.0, 3.0); -- Retorna 9.0 elevado à potência de 3.0, que é 729
SELECT RADIANS(45.0); -- Converte 45 graus para radianos, que é aproximadamente 0.79
SELECT ROUND(42.4); -- Arredonda 42.4 para o inteiro mais próximo, que é 42
SELECT ROUND(42.4382, 2); -- Arredonda 42.4382 para 2 casas decimais, que é 42.44
SELECT SIGN(-8.4); -- Retorna o sinal de -8.4, que é -1
SELECT SQRT(2.0); -- Retorna a raiz quadrada de 2.0, que é aproximadamente 1.41
SELECT TRUNC(42.8); -- Trunca 42.8 em direção a zero, que é 42
SELECT TRUNC(42.4382, 2); -- Trunca 42.4382 para 2 casas decimais, que é 42.43
SELECT WIDTH_BUCKET(5.35, 0.024, 10.06, 5); -- Retorna o número do intervalo ao qual 5.35 seria atribuído em um histograma com 5 intervalos de igual largura que vão de 0.024 a 10.06, que é 3

SELECT RANDOM(); -- Retorna um valor aleatório no intervalo 0.0 <= x < 1.0
SELECT SETSEED(0.5); -- Define a semente para chamadas subsequentes de random() (valor entre -1.0 e 1.0, inclusive)

SELECT ACOS(1); -- Retorna o arco cosseno de 1, que é 0
SELECT ASIN(1); -- Retorna o arco seno de 1, que é π/2
SELECT ATAN(1); -- Retorna o arco tangente de 1, que é π/4
SELECT ATAN2(1, 1); -- Retorna o arco tangente de y/x, que é π/4
SELECT COS(pi() / 2); -- Retorna o cosseno de pi/2, que é 0
SELECT COT(pi() / 4); -- Retorna a cotangente de pi/4, que é 1
SELECT SIN(pi() / 2); -- Retorna o seno de pi/2, que é 1
SELECT TAN(pi() / 4); -- Retorna a tangente de pi/4, que é 1