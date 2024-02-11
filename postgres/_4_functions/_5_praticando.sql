CREATE DATABASE alura;

DROP TABLE IF EXISTS tb_aluno_curso CASCADE;
DROP TABLE IF EXISTS tb_curso CASCADE;
DROP TABLE IF EXISTS tb_categoria CASCADE;
DROP TABLE IF EXISTS tb_aluno CASCADE;

CREATE TABLE IF NOT EXISTS tb_aluno
(
    id              SERIAL,
    primeiro_nome   VARCHAR(255) NOT NULL,
    ultimo_nome     VARCHAR(255) NOT NULL,
    data_nascimento DATE         NOT NULL,

    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS tb_categoria
(
    id   SERIAL,
    nome VARCHAR(255) NOT NULL UNIQUE,

    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS tb_curso
(
    id           SERIAL,
    nome         VARCHAR(255) NOT NULL,
    categoria_id INTEGER      NOT NULL,

    PRIMARY KEY (id),
    FOREIGN KEY (categoria_id) REFERENCES tb_categoria (id)
);

CREATE TABLE IF NOT EXISTS tb_aluno_curso
(
    aluno_id INTEGER NOT NULL,
    curso_id INTEGER NOT NULL,
    PRIMARY KEY (aluno_id, curso_id),

    FOREIGN KEY (aluno_id) REFERENCES tb_aluno (id),
    FOREIGN KEY (curso_id) REFERENCES tb_curso (id)
);

CREATE TABLE IF NOT EXISTS tb_log_insert
(
    id        SERIAL,
    tabela    VARCHAR(255) NOT NULL,
    data_hora TIMESTAMP    NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS tb_log_update
(
    id        SERIAL,
    tabela    VARCHAR(255) NOT NULL,
    data_hora TIMESTAMP    NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS tb_log_delete
(
    id        SERIAL,
    tabela    VARCHAR(255) NOT NULL,
    data_hora TIMESTAMP    NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id)
);


INSERT INTO tb_aluno (primeiro_nome, ultimo_nome, data_nascimento)
VALUES ('Fulano', 'Silva', '1991-01-01'),
       ('Ciclano', 'Silva', '1992-01-01'),
       ('Beltrano', 'Silva', '1993-01-01'),
       ('João', 'Silva', '1994-01-01'),
       ('Maria', 'Silva', '1995-01-01'),
       ('José', 'Silva', '1996-01-01'),
       ('Ana', 'Silva', '1997-01-01'),
       ('Paulo', 'Silva', '1998-01-01'),
       ('Pedro', 'Silva', '1999-01-01'),
       ('Lucas', 'Silva', '2000-01-01'),
       ('Mariana', 'Silva', '2001-01-01'),
       ('Juliana', 'Silva', '2002-01-01'),
       ('Rafael', 'Silva', '2003-01-01'),
       ('Gabriel', 'Silva', '2004-01-01'),
       ('Ricardo', 'Silva', '2005-01-01'),
       ('Rodrigo', 'Silva', '2006-01-01'),
       ('Renato', 'Silva', '2007-01-01'),
       ('Rafaela', 'Silva', '2008-01-01'),
       ('Ricardo', 'Silva', '2009-01-01'),
       ('Rodrigo', 'Silva', '2010-01-01');

INSERT INTO tb_categoria (nome)
VALUES ('Desenvolvimento'),
       ('Marketing'),
       ('Finanças'),
       ('Administração');

-- Cursos de Marketing
INSERT INTO tb_curso (nome, categoria_id)
VALUES ('Marketing Digital', 2),
       ('SEO e SEM', 2),
       ('Gestão de Mídias Sociais', 2),
       ('Branding e Gestão de Marca', 2),
       ('Marketing de Conteúdo', 2),
       ('Inbound Marketing', 2),
       ('Marketing Analítico', 2);

-- Cursos de Finanças
INSERT INTO tb_curso (nome, categoria_id)
VALUES ('Gestão Financeira', 3),
       ('Investimentos e Mercado de Capitais', 3),
       ('Contabilidade Gerencial', 3),
       ('Economia Empresarial', 3),
       ('Finanças Pessoais', 3),
       ('Análise de Risco', 3),
       ('Planejamento Tributário', 3);

-- Cursos de Administração
INSERT INTO tb_curso (nome, categoria_id)
VALUES ('Gestão Estratégica', 4),
       ('Gestão de Projetos', 4),
       ('Empreendedorismo', 4),
       ('Gestão de Recursos Humanos', 4),
       ('Administração de Vendas', 4),
       ('Logística Empresarial', 4),
       ('Ética Empresarial', 4);

INSERT INTO tb_curso (nome, categoria_id)
VALUES ('Java', 1),
       ('Python', 1),
       ('JavaScript', 1),
       ('React', 1),
       ('Vue', 1),
       ('Angular', 1),
       ('Spring', 1),
       ('Node', 1),
       ('Django', 1),
       ('Flask', 1),
       ('HTML', 1),
       ('CSS', 1),
       ('Sass', 1),
       ('Less', 1),
       ('Bootstrap', 1),
       ('Materialize', 1),
       ('Bulma', 1),
       ('JQuery', 1),
       ('TypeScript', 1),
       ('Next', 1),
       ('Nuxt', 1),
       ('Quasar', 1),
       ('Electron', 1),
       ('React Native', 1),
       ('Flutter', 1),
       ('Dart', 1),
       ('Kotlin', 1),
       ('Swift', 1),
       ('Objective-C', 1),
       ('C#', 1),
       ('.NET', 1),
       ('ASP.NET', 1),
       ('C', 1),
       ('C++', 1),
       ('Cobol', 1),
       ('Fortran', 1),
       ('Pascal', 1),
       ('Delphi', 1),
       ('Assembly', 1),
       ('Go', 1),
       ('Rust', 1),
       ('Elixir', 1),
       ('Erlang', 1),
       ('Ruby', 1),
       ('Rails', 1),
       ('PHP', 1),
       ('Laravel', 1),
       ('Symfony', 1);

-- Associação de alunos a cursos
INSERT INTO tb_aluno_curso (aluno_id, curso_id)
VALUES (1, 1),
       (2, 2),
       (3, 3),
       (4, 4),
       (5, 5),
       (6, 6),
       (7, 7),
       (8, 8),
       (9, 9),
       (10, 10),
       (11, 11),
       (12, 12),
       (13, 13),
       (14, 14),
       (15, 15),
       (16, 16),
       (17, 17),
       (18, 18),
       (19, 19),
       (20, 20),
       (1, 21),
       (2, 22),
       (3, 23),
       (4, 24),
       (5, 25),
       (6, 26),
       (7, 27),
       (8, 28),
       (9, 29),
       (10, 30),
       (11, 31),
       (12, 32),
       (13, 33),
       (14, 34),
       (15, 35),
       (16, 36),
       (17, 37),
       (18, 38),
       (19, 39),
       (20, 40),
       (1, 41),
       (2, 42),
       (3, 43),
       (4, 44),
       (5, 45),
       (6, 46),
       (7, 47),
       (8, 48),
       (9, 49),
       (10, 50),
       (11, 51),
       (12, 52),
       (13, 53),
       (14, 54),
       (15, 55),
       (16, 56);

-----------------------------------------------------------------------------------------------------------------------
/*
 1 - Criar stored procedure para adicionar: aluno, categoria e curso
 2 - Criar uma função que retorne a lista de cursos que um aluno está matriculado e as respectivas categorias
 3 - Criar um trigger que crie um log sempre que qualquer tabela tenha um novo registro inserido, atualizado ou deletado
 4 -
 5 -
 6 -
 7 -
 8 -
 9 -
 10 -
 */

-- Stored Procedures: Como você criaria um procedimento armazenado para adicionar um novo aluno à tabela tb_aluno e retornar o id do novo aluno?
DROP FUNCTION IF EXISTS sp_add_aluno;
CREATE OR REPLACE FUNCTION sp_add_aluno(primeiro_nome VARCHAR(255), ultimo_nome VARCHAR(255), data_nascimento DATE)
    RETURNS INTEGER AS
$$
DECLARE
    id_aluno INTEGER;
BEGIN
    INSERT INTO tb_aluno (primeiro_nome, ultimo_nome, data_nascimento)
    VALUES (primeiro_nome, ultimo_nome, data_nascimento)
    RETURNING id INTO id_aluno;

    RETURN id_aluno;
END;
$$ LANGUAGE plpgsql;

-- Stored Procedures: Como você criaria um procedimento armazenado para adicionar um novo curso à tabela tb_curso e retornar o id do novo curso?
DROP FUNCTION IF EXISTS sp_add_curso;
CREATE OR REPLACE FUNCTION sp_add_curso(nome_curso VARCHAR(255), categoria_id INTEGER)
    RETURNS INTEGER AS
$$
DECLARE
    id_curso INTEGER;
BEGIN
    INSERT INTO tb_curso (nome, categoria_id)
    VALUES (nome_curso, categoria_id)
    RETURNING id INTO id_curso;

    RETURN id_curso;
END;
$$ LANGUAGE plpgsql;

-- Stored procedure: Como você criaria um procedimento armazenado para adicionar uma nova categoria à tabela tb_categoria e retornar o id da nova categoria?
DROP FUNCTION IF EXISTS sp_add_categoria;
CREATE OR REPLACE FUNCTION sp_add_categoria(nome_categoria VARCHAR(255))
    RETURNS INTEGER AS
$$
DECLARE
    id_categoria INTEGER;
BEGIN
    INSERT INTO tb_categoria (nome)
    VALUES (nome_categoria)
    RETURNING id INTO id_categoria;

    RETURN id_categoria;
END;
$$ LANGUAGE plpgsql;

SELECT sp_add_aluno('Vinícius', 'Andrade', '2001-12-06');
SELECT sp_add_curso('Dotinha', 1);
SELECT sp_add_categoria('Desenvolvimento Mobile');

-- Quero criar uma função que retorne a quantidade de cursos que um aluno está matriculado e o nome dos cursos
DROP FUNCTION IF EXISTS aluno_cursos;
CREATE OR REPLACE FUNCTION aluno_cursos(p_aluno_id INTEGER)
    RETURNS TABLE
            (
                curso_nome     VARCHAR,
                categoria_nome VARCHAR
            )
AS
$$
BEGIN
    RETURN QUERY
        SELECT tb_curso.nome, tb_categoria.nome
        FROM tb_aluno_curso
                 JOIN tb_curso ON tb_aluno_curso.curso_id = tb_curso.id
                 JOIN tb_categoria ON tb_curso.categoria_id = tb_categoria.id
        WHERE tb_aluno_curso.aluno_id = p_aluno_id;
END;
$$ LANGUAGE plpgsql;


SELECT *
FROM aluno_cursos(1);

DROP FUNCTION IF EXISTS log_insert_tb_aluno;
DROP FUNCTION IF EXISTS log_update_tb_aluno;
DROP FUNCTION IF EXISTS log_delete_tb_aluno;
DROP FUNCTION IF EXISTS log_insert_tb_categoria;
DROP FUNCTION IF EXISTS log_update_tb_categoria;
DROP FUNCTION IF EXISTS log_delete_tb_categoria;
DROP FUNCTION IF EXISTS log_insert_tb_curso;
DROP FUNCTION IF EXISTS log_update_tb_curso;
DROP FUNCTION IF EXISTS log_delete_tb_curso;
DROP FUNCTION IF EXISTS log_insert_tb_aluno_curso;
DROP FUNCTION IF EXISTS log_update_tb_aluno_curso;
DROP FUNCTION IF EXISTS log_delete_tb_aluno_curso;

DROP TRIGGER IF EXISTS tb_aluno_insert_trigger ON tb_aluno;
DROP TRIGGER IF EXISTS tb_aluno_update_trigger ON tb_aluno;
DROP TRIGGER IF EXISTS tb_aluno_delete_trigger ON tb_aluno;
DROP TRIGGER IF EXISTS tb_categoria_insert_trigger ON tb_categoria;
DROP TRIGGER IF EXISTS tb_categoria_update_trigger ON tb_categoria;
DROP TRIGGER IF EXISTS tb_categoria_delete_trigger ON tb_categoria;
DROP TRIGGER IF EXISTS tb_curso_insert_trigger ON tb_curso;
DROP TRIGGER IF EXISTS tb_curso_update_trigger ON tb_curso;
DROP TRIGGER IF EXISTS tb_curso_delete_trigger ON tb_curso;


-- Trigger para INSERT
CREATE OR REPLACE FUNCTION log_insert_tb_aluno() RETURNS TRIGGER AS
$$
BEGIN
    INSERT INTO tb_log_insert(tabela) VALUES ('tb_aluno');
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER tb_aluno_insert_trigger
    AFTER INSERT
    ON tb_aluno
    FOR EACH ROW
EXECUTE PROCEDURE log_insert_tb_aluno();

-- Trigger para UPDATE
CREATE OR REPLACE FUNCTION log_update_tb_aluno() RETURNS TRIGGER AS
$$
BEGIN
    INSERT INTO tb_log_update(tabela) VALUES ('tb_aluno');
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER tb_aluno_update_trigger
    AFTER UPDATE
    ON tb_aluno
    FOR EACH ROW
EXECUTE PROCEDURE log_update_tb_aluno();

-- Trigger para DELETE
CREATE OR REPLACE FUNCTION log_delete_tb_aluno() RETURNS TRIGGER AS
$$
BEGIN
    INSERT INTO tb_log_delete(tabela) VALUES ('tb_aluno');
    RETURN OLD;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER tb_aluno_delete_trigger
    AFTER DELETE
    ON tb_aluno
    FOR EACH ROW
EXECUTE PROCEDURE log_delete_tb_aluno();

-- Para tb_categoria
CREATE OR REPLACE FUNCTION log_insert_tb_categoria() RETURNS TRIGGER AS
$$
BEGIN
    INSERT INTO tb_log_insert(tabela) VALUES ('tb_categoria');
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER tb_categoria_insert_trigger
    AFTER INSERT
    ON tb_categoria
    FOR EACH ROW
EXECUTE PROCEDURE log_insert_tb_categoria();

CREATE OR REPLACE FUNCTION log_update_tb_categoria() RETURNS TRIGGER AS
$$
BEGIN
    INSERT INTO tb_log_update(tabela) VALUES ('tb_categoria');
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER tb_categoria_update_trigger
    AFTER UPDATE
    ON tb_categoria
    FOR EACH ROW
EXECUTE PROCEDURE log_update_tb_categoria();

CREATE OR REPLACE FUNCTION log_delete_tb_categoria() RETURNS TRIGGER AS
$$
BEGIN
    INSERT INTO tb_log_delete(tabela) VALUES ('tb_categoria');
    RETURN OLD;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER tb_categoria_delete_trigger
    AFTER DELETE
    ON tb_categoria
    FOR EACH ROW
EXECUTE PROCEDURE log_delete_tb_categoria();

-- Para tb_curso
CREATE OR REPLACE FUNCTION log_insert_tb_curso() RETURNS TRIGGER AS
$$
BEGIN
    INSERT INTO tb_log_insert(tabela) VALUES ('tb_curso');
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER tb_curso_insert_trigger
    AFTER INSERT
    ON tb_curso
    FOR EACH ROW
EXECUTE PROCEDURE log_insert_tb_curso();

CREATE OR REPLACE FUNCTION log_update_tb_curso() RETURNS TRIGGER AS
$$
BEGIN
    INSERT INTO tb_log_update(tabela) VALUES ('tb_curso');
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER tb_curso_update_trigger
    AFTER UPDATE
    ON tb_curso
    FOR EACH ROW
EXECUTE PROCEDURE log_update_tb_curso();

CREATE OR REPLACE FUNCTION log_delete_tb_curso() RETURNS TRIGGER AS
$$
BEGIN
    INSERT INTO tb_log_delete(tabela) VALUES ('tb_curso');
    RETURN OLD;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER tb_curso_delete_trigger
    AFTER DELETE
    ON tb_curso
    FOR EACH ROW
EXECUTE PROCEDURE log_delete_tb_curso();

-- Para tb_aluno_curso
CREATE OR REPLACE FUNCTION log_insert_tb_aluno_curso() RETURNS TRIGGER AS
$$
BEGIN
    INSERT INTO tb_log_insert(tabela) VALUES ('tb_aluno_curso');
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER tb_aluno_curso_insert_trigger
    AFTER INSERT
    ON tb_aluno_curso
    FOR EACH ROW
EXECUTE PROCEDURE log_insert_tb_aluno_curso();

CREATE OR REPLACE FUNCTION log_update_tb_aluno_curso() RETURNS TRIGGER AS
$$
BEGIN
    INSERT INTO tb_log_update(tabela) VALUES ('tb_aluno_curso');
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER tb_aluno_curso_update_trigger
    AFTER UPDATE
    ON tb_aluno_curso
    FOR EACH ROW
EXECUTE PROCEDURE log_update_tb_aluno_curso();

CREATE OR REPLACE FUNCTION log_delete_tb_aluno_curso() RETURNS TRIGGER AS
$$
BEGIN
    INSERT INTO tb_log_delete(tabela) VALUES ('tb_aluno_curso');
    RETURN OLD;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER tb_aluno_curso_delete_trigger
    AFTER DELETE
    ON tb_aluno_curso
    FOR EACH ROW
EXECUTE PROCEDURE log_delete_tb_aluno_curso();