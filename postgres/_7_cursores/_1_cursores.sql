DROP TABLE IF EXISTS tb_instrutor CASCADE;

CREATE TABLE IF NOT EXISTS tb_instrutor
(
    id         SERIAL PRIMARY KEY,
    nome       VARCHAR(100),
    salario    DECIMAL,
    nascimento DATE
);

INSERT INTO tb_instrutor (nome, salario, nascimento)
VALUES ('João', 1000, '1990-01-01'),
       ('Maria', 2000, '1995-01-01'),
       ('José', 3000, '1985-01-01'),
       ('Ana', 4000, '1980-01-01'),
       ('Carlos', 5000, '1975-01-01'),
       ('Mariana', 6000, '1970-01-01'),
       ('Pedro', 7000, '1965-01-01'),
       ('Paula', 8000, '1960-01-01'),
       ('Fernando', 9000, '1955-01-01'),
       ('Fernanda', 10000, '1950-01-01');

DROP FUNCTION IF EXISTS instrutores_internos;

CREATE OR REPLACE FUNCTION imprime_instrutores() RETURNS VOID AS
$$
DECLARE
    -- Declaração do cursor
    cur CURSOR FOR SELECT *
                   FROM tb_instrutor;

    -- Variável para armazenar a linha atual
    instrutor_atual tb_instrutor%ROWTYPE;
BEGIN
    -- Abertura do cursor
    OPEN cur;

    -- Loop através das linhas do cursor
    LOOP
        -- Recupera a próxima linha
        FETCH NEXT FROM cur INTO instrutor_atual;

        -- Se não houver mais linhas, sai do loop
        EXIT WHEN NOT FOUND;

        -- Aqui você pode fazer algo com a linha atual
        -- Neste exemplo, estamos imprimindo o nome, salário e data de nascimento do instrutor
        RAISE NOTICE 'Nome do instrutor: %, Salário: %, Data de nascimento: %',
            instrutor_atual.nome,
            instrutor_atual.salario,
            instrutor_atual.nascimento;
    END LOOP;

    -- Fechamento do cursor
    CLOSE cur;
END;
$$ LANGUAGE plpgsql;

SELECT imprime_instrutores();