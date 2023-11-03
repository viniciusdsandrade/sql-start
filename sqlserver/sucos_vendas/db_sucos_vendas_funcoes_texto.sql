-- CONCAT(): A função CONCAT é usada para combinar (concatenar) duas ou mais strings em uma única string.
-- LOWER(): A função LOWER converte todos os caracteres de uma string em minúsculas.
-- UPPER(): A função UPPER converte todos os caracteres de uma string em maiúsculas.
-- RIGHT(): A função RIGHT retorna um número especificado de caracteres do lado direito de uma string.
-- LEFT(): A função LEFT retorna um número especificado de caracteres do lado esquerdo de uma string.
-- REPLICATE(): A função REPLICATE é usada para criar uma nova string repetindo uma string existente um número especificado de vezes.
-- SUBSTRING(): A função SUBSTRING extrai uma parte de uma string com base em uma posição inicial e um comprimento especificado.
-- LTRIM(): A função LTRIM remove espaços em branco à esquerda de uma string.
-- RTRIM(): A função RTRIM remove espaços em branco à direita de uma string.
-- TRIM(): A função TRIM remove espaços em branco tanto à esquerda quanto à direita de uma string. Você pode especificar quais caracteres devem ser removidos.
-- LEN(): Embora o MySQL não tenha uma função chamada LEN, você pode usar CHAR_LENGTH() para obter o número de caracteres em uma string.

-- Consulta 1: Seleciona todos os registros da tabela de clientes.
SELECT *
FROM TABELA_DE_CLIENTES;

-- Consulta 2: Seleciona o campo 'NOME' da tabela de clientes e cria duas colunas adicionais, uma com o nome em minúsculas e outra em maiúsculas.
SELECT NOME, LOWER(NOME) AS NOME_MINUSCULO, UPPER(NOME) AS NOME_MAIUSCULO
FROM TABELA_DE_CLIENTES;

-- Consulta 3: Seleciona o campo 'NOME' da tabela de clientes em maiúsculas com um apelido 'Nombres' e concatena várias colunas relacionadas ao endereço em uma única coluna 'Endereço completo' usando a função CONCAT.
SELECT UPPER(NOME)                                                                 AS 'Nombres',
       CONCAT(ENDERECO_1, ' - ', BAIRRO, ' - ', CIDADE, ' - ', ESTADO, ' - ', CEP) AS 'Endereço completo'
FROM TABELA_DE_CLIENTES;

-- Consulta 4: Variação da Consulta 3 que realiza as mesmas operações de conversão e concatenação usando o operador '+'.
SELECT UPPER(NOME)                                                                 AS 'Nombres',
       ENDERECO_1 + ' - ' + BAIRRO + ' - ' + CIDADE + ' - ' + ESTADO + ' - ' + CEP AS 'Endereço completo'
FROM TABELA_DE_CLIENTES;

-- Consulta 5: Seleciona todos os registros da tabela de produtos.
SELECT *
FROM TABELA_DE_PRODUTOS;

-- Consulta 6: Seleciona o campo 'NOME_DO_PRODUTO' da tabela de produtos e cria uma coluna adicional que contém os três primeiros caracteres do nome do produto.
SELECT NOME_DO_PRODUTO, LEFT(NOME_DO_PRODUTO, 3) AS TRES_PRIMEIROS_CHAR
FROM TABELA_DE_PRODUTOS;

-- Consulta 7: Substitui a string 'Litros' por 'L' na coluna 'TAMANHO' da tabela de produtos.
SELECT TAMANHO, REPLACE(TAMANHO, 'Litros', 'L') AS TAMANHO_MODIFICADO
FROM TABELA_DE_PRODUTOS;

-- Consulta 8: Substitui tanto 'Litros' quanto 'Litro' por 'L' na coluna 'TAMANHO' da tabela de produtos.
SELECT TAMANHO, REPLACE(REPLACE(TAMANHO, 'Litros', 'L'), 'Litro', 'L') AS TAMANHO_MODIFICADO
FROM TABELA_DE_PRODUTOS;