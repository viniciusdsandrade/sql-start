DROP TABLE IF EXISTS tb_log_instrutores CASCADE;
DROP TABLE IF EXISTS tb_instrutor CASCADE;

CREATE TABLE IF NOT EXISTS tb_log_instrutores
(
    id         SERIAL PRIMARY KEY,
    informacao VARCHAR(100),
    teste      VARCHAR(100)
);

CREATE TABLE IF NOT EXISTS tb_instrutor
(
    id         SERIAL PRIMARY KEY,
    nome       VARCHAR(100),
    salario    DECIMAL,
    nascimento DATE
);

CREATE FUNCTION cria_instrutor() RETURNS void AS
$$
DECLARE
    media_salarial         DECIMAL;
    instrutor_recebe_menos INTEGER DEFAULT 0;
    total_instrutores      INTEGER DEFAULT 0;
    salario                DECIMAL;
    percentual             DECIMAL(5, 2);
BEGIN
    -- Calcula a média salarial dos instrutores existentes
    SELECT AVG(tb_instrutor.salario) INTO media_salarial FROM tb_instrutor WHERE id <> NEW.id;

    -- Insere uma linha no log se o novo instrutor recebe acima da média
    IF NEW.salario > media_salarial THEN
        INSERT INTO tb_log_instrutores (informacao) VALUES (NEW.nome || ' recebe acima da média');
    END IF;

    -- Calcula o percentual de instrutores que recebem menos do que o novo instrutor
    SELECT COUNT(*) INTO total_instrutores FROM tb_instrutor WHERE id <> NEW.id;
    SELECT COUNT(*) INTO instrutor_recebe_menos FROM tb_instrutor WHERE salario < NEW.salario;
    percentual = instrutor_recebe_menos::DECIMAL / total_instrutores::DECIMAL * 100;

    -- Insere uma linha no log com o percentual calculado
    INSERT INTO tb_log_instrutores (informacao, teste)
    VALUES (NEW.nome || ' recebe mais do que ' || percentual || '% da grade de instrutores', '');

    RETURN NEW;
EXCEPTION
    WHEN undefined_column THEN
        RETURN NEW;
END;
$$ LANGUAGE plpgsql;


INSERT INTO tb_instrutor (nome, salario, nascimento)
VALUES ('João', 650, '1990-01-01');

SELECT *
FROM tb_log_instrutores;

INSERT INTO tb_instrutor (nome, salario, nascimento)
VALUES ('Maria', 1000, '1990-01-01');