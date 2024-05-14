SELECT TRIM(UPPER(CONCAT('Vinicius', NULL, 'Dias') || ' ')); -- Remove espaços em branco do início e do fim da string concatenada e convertida para maiúsculas
SELECT UPPER('Vinicius Dias'); -- Converte a string para maiúsculas
SELECT LOWER('Vinicius Dias'); -- Converte a string para minúsculas
SELECT LENGTH('Vinicius Dias'); -- Retorna o número de caracteres na string
SELECT SUBSTRING('Vinicius Dias' FROM 1 FOR 8); -- Extrai uma substring da string
SELECT POSITION('Dias' IN 'Vinicius Dias'); -- Retorna a posição da primeira ocorrência de 'Dias' na string
SELECT TRIM(BOTH 's' FROM 'Vinicius Dias'); -- Remove 's' do início e do fim da string
SELECT CHAR_LENGTH('Vinicius Dias'); -- Retorna o número de caracteres na string
SELECT INITCAP('vinicius dias'); -- Converte a primeira letra de cada palavra para maiúscula e o restante para minúscula
SELECT REPLACE('Vinicius Dias', 'Dias', 'Silva'); -- Substitui todas as ocorrências de 'Dias' por 'Silva' na string
SELECT CONCAT('Vinicius', ' ', 'Dias'); -- Concatena as strings com um espaço entre elas
SELECT RTRIM('Vinicius Dias ', ' '); -- Remove espaços em branco do final da string
SELECT STARTS_WITH('Vinicius Dias', 'Vini'); -- Retorna verdadeiro se a string começar com 'Vini'
SELECT SPLIT_PART('Vinicius Dias', ' ', 2); -- Divide a string em partes com base em um espaço e retorna a segunda parte
SELECT TO_ASCII('Vinícius'); -- Converte a string para ASCII
SELECT TO_HEX(255); -- Converte o número para uma string hexadecimal
SELECT REPEAT('Vinicius ', 3); -- Repete a string três vezes
SELECT REVERSE('Vinicius'); -- Inverte a string
SELECT TRANSLATE('12345', '123', 'abc'); -- Substitui cada caractere na string que corresponde a um caractere em '123' pelo caractere correspondente em 'abc'
