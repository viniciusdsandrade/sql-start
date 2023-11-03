-- CONCAT(): A fun��o CONCAT � usada para combinar (concatenar) duas ou mais strings em uma �nica string.
-- LOWER(): A fun��o LOWER converte todos os caracteres de uma string em min�sculas.
-- UPPER(): A fun��o UPPER converte todos os caracteres de uma string em mai�sculas.
-- RIGHT(): A fun��o RIGHT retorna um n�mero especificado de caracteres do lado direito de uma string.
-- LEFT(): A fun��o LEFT retorna um n�mero especificado de caracteres do lado esquerdo de uma string.
-- REPLICATE(): A fun��o REPLICATE � usada para criar uma nova string repetindo uma string existente um n�mero especificado de vezes.
-- SUBSTRING(): A fun��o SUBSTRING extrai uma parte de uma string com base em uma posi��o inicial e um comprimento especificado.
-- LTRIM(): A fun��o LTRIM remove espa�os em branco � esquerda de uma string.
-- RTRIM(): A fun��o RTRIM remove espa�os em branco � direita de uma string.
-- TRIM(): A fun��o TRIM remove espa�os em branco tanto � esquerda quanto � direita de uma string. Voc� pode especificar quais caracteres devem ser removidos.
-- LEN(): Embora o MySQL n�o tenha uma fun��o chamada LEN, voc� pode usar CHAR_LENGTH() para obter o n�mero de caracteres em uma string.

-- Consulta 1: Seleciona todos os registros da tabela de clientes.
SELECT *
FROM TABELA_DE_CLIENTES;

-- Consulta 2: Seleciona o campo 'NOME' da tabela de clientes e cria duas colunas adicionais, uma com o nome em min�sculas e outra em mai�sculas.
SELECT NOME, LOWER(NOME) AS NOME_MINUSCULO, UPPER(NOME) AS NOME_MAIUSCULO
FROM TABELA_DE_CLIENTES;

-- Consulta 3: Seleciona o campo 'NOME' da tabela de clientes em mai�sculas com um apelido 'Nombres' e concatena v�rias colunas relacionadas ao endere�o em uma �nica coluna 'Endere�o completo' usando a fun��o CONCAT.
SELECT UPPER(NOME)                                                                 AS 'Nombres',
       CONCAT(ENDERECO_1, ' - ', BAIRRO, ' - ', CIDADE, ' - ', ESTADO, ' - ', CEP) AS 'Endere�o completo'
FROM TABELA_DE_CLIENTES;

-- Consulta 4: Varia��o da Consulta 3 que realiza as mesmas opera��es de convers�o e concatena��o usando o operador '+'.
SELECT UPPER(NOME)                                                                 AS 'Nombres',
       ENDERECO_1 + ' - ' + BAIRRO + ' - ' + CIDADE + ' - ' + ESTADO + ' - ' + CEP AS 'Endere�o completo'
FROM TABELA_DE_CLIENTES;

-- Consulta 5: Seleciona todos os registros da tabela de produtos.
SELECT *
FROM TABELA_DE_PRODUTOS;

-- Consulta 6: Seleciona o campo 'NOME_DO_PRODUTO' da tabela de produtos e cria uma coluna adicional que cont�m os tr�s primeiros caracteres do nome do produto.
SELECT NOME_DO_PRODUTO, LEFT(NOME_DO_PRODUTO, 3) AS TRES_PRIMEIROS_CHAR
FROM TABELA_DE_PRODUTOS;

-- Consulta 7: Substitui a string 'Litros' por 'L' na coluna 'TAMANHO' da tabela de produtos.
SELECT TAMANHO, REPLACE(TAMANHO, 'Litros', 'L') AS TAMANHO_MODIFICADO
FROM TABELA_DE_PRODUTOS;

-- Consulta 8: Substitui tanto 'Litros' quanto 'Litro' por 'L' na coluna 'TAMANHO' da tabela de produtos.
SELECT TAMANHO, REPLACE(REPLACE(TAMANHO, 'Litros', 'L'), 'Litro', 'L') AS TAMANHO_MODIFICADO
FROM TABELA_DE_PRODUTOS;