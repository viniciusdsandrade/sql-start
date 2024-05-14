-- Seleciona CPF dos Clientes, o Nome dos Clientes e o CPF das Notas Fiscais correspondentes (INNER JOIN)
SELECT TC.CPF  AS 'CPF',
       TC.NOME AS 'Cliente',
       NF.CPF  AS 'CPF DA NOTA'
FROM TABELA_DE_CLIENTES AS TC
         INNER JOIN NOTAS_FISCAIS NF ON TC.CPF = NF.CPF;

-- Seleciona CPF dos Clientes, o Nome dos Clientes e o CPF das Notas Fiscais correspondentes (INNER JOIN e DISTINCT)
SELECT DISTINCT TC.CPF  AS 'CPF',
                TC.NOME AS 'Cliente',
                NF.CPF  AS 'CPF DA NOTA'
FROM TABELA_DE_CLIENTES AS TC
         INNER JOIN NOTAS_FISCAIS NF ON TC.CPF = NF.CPF;

-- Conta o número de clientes
SELECT COUNT(*) AS 'Numero de clientes'
FROM TABELA_DE_CLIENTES;

-- Inserção de um novo cliente na tabela "TABELA_DE_CLIENTES"
INSERT INTO TABELA_DE_CLIENTES (CPF, NOME, ENDERECO_1, BAIRRO, CIDADE, ESTADO, CEP, DATA_DE_NASCIMENTO, IDADE, GENERO,
                                LIMITE_DE_CREDITO, VOLUME_DE_COMPRA, PRIMEIRA_COMPRA)
VALUES ('12345678901', 'Nome do Cliente', 'Endereco 123', 'Bairro do Cliente', 'Cidade do Cliente', 'SP', '12345678',
        '1990-01-01', 33, 'M', 1000.00, 500.00, 1);

-- Seleciona CPF dos Clientes, o Nome dos Clientes e o CPF das Notas Fiscais correspondentes (LEFT JOIN)
SELECT DISTINCT TC.CPF  AS 'CPF',
                TC.NOME AS 'Cliente',
                NF.CPF  AS 'CPF DA NOTA'
FROM TABELA_DE_CLIENTES AS TC
         LEFT JOIN NOTAS_FISCAIS NF ON TC.CPF = NF.CPF;

-- Conta o número de clientes após a inserção
SELECT COUNT(*) AS 'Numero de clientes'
FROM TABELA_DE_CLIENTES;

-- Seleciona CPF dos Clientes, o Nome dos Clientes e o CPF das Notas Fiscais correspondentes (LEFT JOIN) onde o CPF da Nota é nulo
SELECT DISTINCT TC.CPF  AS 'CPF',
                TC.NOME AS 'Cliente',
                NF.CPF  AS 'CPF DA NOTA'
FROM TABELA_DE_CLIENTES AS TC
         LEFT JOIN NOTAS_FISCAIS NF ON TC.CPF = NF.CPF
WHERE NF.CPF IS NULL;