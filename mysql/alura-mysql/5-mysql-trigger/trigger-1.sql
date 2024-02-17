USE SUCOS_VENDAS;

SELECT * FROM TABELA_DE_CLIENTES;

DROP TABLE IF EXISTS TABELA_FATURAMENTO;
CREATE TABLE IF NOT EXISTS TABELA_FATURAMENTO
(
    DATA_VENDA  VARCHAR(11),
    TOTAL_VENDA DECIMAL(10, 2)
);
/*
 Esta consulta seleciona informações específicas sobre todos os triggers no banco de dados SUCOS_VENDAS. Aqui está o que cada parte da consulta faz:

    trigger_name: Retorna o nome do trigger.
    event_object_table: Retorna o nome da tabela na qual o trigger está definido.
    action_timing: Retorna o momento em que o trigger é acionado (BEFORE ou AFTER).
    event_manipulation: Retorna o tipo de evento que o trigger está associado (INSERT, UPDATE, DELETE).
    action_statement: Retorna a declaração SQL que é executada quando o trigger é acionado.

A cláusula WHERE filtra os resultados para incluir apenas os triggers no schema SUCOS_VENDAS.
 */
SELECT
    trigger_name,
    event_object_table,
    action_timing,
    event_manipulation,
    action_statement
FROM information_schema.triggers
WHERE trigger_schema = 'SUCOS_VENDAS';

/*
 Esta consulta conta o número total de triggers no banco de dados SUCOS_VENDAS. Aqui está o que cada parte da consulta faz:

COUNT(*) AS total_triggers: Conta o número total de linhas (ou triggers, neste caso) na tabela resultante e renomeia a coluna resultante para total_triggers.
A cláusula WHERE filtra os resultados para incluir apenas os triggers no schema SUCOS_VENDAS.
O resultado desta consulta será um único valor, representando o total de triggers no schema especificado.
 */
SELECT COUNT(*) AS total_triggers
FROM information_schema.triggers
WHERE trigger_schema = 'SUCOS_VENDAS';

/*
 # TG_CALCULA_FATURAMENTO_INSERT

## Visão Geral
O gatilho `TG_CALCULA_FATURAMENTO_INSERT` foi projetado para atualizar a tabela `TABELA_FATURAMENT0` cada vez que um novo registro é inserido na tabela `ITENS_NOTAS_FISCAIS`.

## Funcionalidade
O gatilho executa as seguintes etapas:

1. **Exclui todos os registros de `TABELA_FATURAMENT0`:** Isso é feito para garantir que a tabela contenha apenas os dados mais recentes.
2. **Calcula o total de vendas para cada data de venda:** O gatilho calcula o total de vendas (`TOTAL_VENDA`) para cada data de venda (`DATA_VENDA`). Isso é feito somando o produto da quantidade (`QUANTIDADE`) e preço (`PRECO`) de cada item na tabela `ITENS_NOTAS_FISCAIS`, agrupados pela data de venda.
3. **Insere os totais calculados em `TABELA_FATURAMENT0`:** Os totais calculados são então inseridos na tabela `TABELA_FATURAMENT0`.

## Ativação do Gatilho
Este gatilho é ativado `AFTER INSERT` na tabela `ITENS_NOTAS_FISCAIS`. Isso significa que o gatilho é executado após a inserção de um novo registro na tabela `ITENS_NOTAS_FISCAIS`.

## Propósito
O propósito deste gatilho é manter um registro atualizado do total de vendas para cada data de venda na tabela `TABELA_FATURAMENT0`. Isso permite um fácil acesso a essas informações, que podem ser úteis para análise de negócios e tomada de decisões.
 */

DROP TRIGGER IF EXISTS TG_CALCULA_FATURAMENTO_INSERT;
DELIMITER //
CREATE TRIGGER IF NOT EXISTS TG_CALCULA_FATURAMENTO_INSERT
    AFTER INSERT
    ON ITENS_NOTAS_FISCAIS
    FOR EACH ROW
BEGIN
    DELETE FROM TABELA_FATURAMENTO;
    INSERT INTO TABELA_FATURAMENTO
    SELECT A.DATA_VENDA, SUM(B.QUANTIDADE * B.PRECO) AS TOTAL_VENDA
    FROM NOTAS_FISCAIS A
             INNER JOIN ITENS_NOTAS_FISCAIS B
                        ON A.NUMERO = B.NUMERO
    GROUP BY A.DATA_VENDA;
END;
//

INSERT INTO TABELA_DE_CLIENTES (CPF, NOME)
VALUES ('44784160876', 'Vinícius dos Santos Andrade');

INSERT INTO TABELA_DE_PRODUTOS (CODIGO_DO_PRODUTO, NOME_DO_PRODUTO, PRECO_DE_LISTA)
VALUES ('P1', 'Produto 1', 100.0);

INSERT INTO TABELA_DE_VENDEDORES (MATRICULA, NOME)
VALUES ('V1', 'Vendedor 1');

INSERT INTO NOTAS_FISCAIS (NUMERO, DATA_VENDA, CPF, MATRICULA, IMPOSTO)
VALUES (1, '2024-01-01', '44784160876', 'V1', 10.0);

INSERT INTO ITENS_NOTAS_FISCAIS (NUMERO, CODIGO_DO_PRODUTO, QUANTIDADE, PRECO)
VALUES (1, 'P1', 10, 100.0);
INSERT INTO ITENS_NOTAS_FISCAIS (NUMERO, CODIGO_DO_PRODUTO, QUANTIDADE, PRECO)
VALUES (100, 'P1', 10, 100.0);

SELECT *
FROM TABELA_FATURAMENTO;