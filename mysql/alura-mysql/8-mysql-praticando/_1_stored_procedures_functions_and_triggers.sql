DROP SCHEMA IF EXISTS db_praticando;
CREATE SCHEMA IF NOT EXISTS db_praticando;
USE db_praticando;

CREATE TABLE IF NOT EXISTS tb_aluno
(
    id         BIGINT UNSIGNED AUTO_INCREMENT,
    nome       VARCHAR(50) NOT NULL,
    nascimento DATE        NOT NULL,

    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS tb_categoria
(
    id   BIGINT UNSIGNED AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL,

    UNIQUE (nome),

    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS tb_curso
(
    id           BIGINT UNSIGNED AUTO_INCREMENT,
    nome         VARCHAR(50)     NOT NULL,
    id_categoria BIGINT UNSIGNED NOT NULL,

    UNIQUE (nome),

    PRIMARY KEY (id),
    FOREIGN KEY (id_categoria) REFERENCES tb_categoria (id)
);

CREATE TABLE IF NOT EXISTS tb_aluno_curso
(
    id_curso BIGINT UNSIGNED NOT NULL,
    id_aluno BIGINT UNSIGNED NOT NULL,
    data     DATE            NOT NULL,

    PRIMARY KEY (id_curso, id_aluno),

    FOREIGN KEY (id_curso) REFERENCES tb_curso (id),
    FOREIGN KEY (id_aluno) REFERENCES tb_aluno (id)
);

CREATE TABLE IF NOT EXISTS tb_log
(
    id          BIGINT UNSIGNED AUTO_INCREMENT,
    tabela      VARCHAR(50)     NOT NULL,
    acao        VARCHAR(50)     NOT NULL,
    id_registro BIGINT UNSIGNED NOT NULL,
    data        DATETIME        NOT NULL,

    PRIMARY KEY (id)
);

INSERT INTO tb_categoria (nome)
VALUES ('Programação'),
       ('Design'),
       ('Marketing');

INSERT INTO tb_curso (nome, id_categoria)
VALUES ('Python', 1),
       ('Java', 1),
       ('Photoshop', 2),
       ('Illustrator', 2),
       ('Marketing Digital', 3),
       ('SEO', 3);

INSERT INTO tb_aluno (nome, nascimento)
VALUES ('João', '2000-01-01'),
       ('Maria', '2000-01-02'),
       ('José', '2000-01-03'),
       ('Ana', '2000-01-04'),
       ('Carlos', '2000-01-05');

INSERT INTO tb_aluno_curso (id_curso, id_aluno, data)
VALUES (1, 1, '2020-01-01'),
       (2, 1, '2020-01-02'),
       (3, 2, '2020-01-03'),
       (4, 2, '2020-01-04'),
       (5, 3, '2020-01-05'),
       (6, 3, '2020-01-06'),
       (1, 4, '2020-01-07'),
       (2, 4, '2020-01-08'),
       (3, 5, '2020-01-09'),
       (4, 5, '2020-01-10'),
       (5, 5, '2020-01-11'),
       (6, 5, '2020-01-12');

/*
 1 - Criar stored procedure para adicionar: aluno, categoria e curso
 2 - Criar uma função que retorne a lista de cursos que um aluno está matriculado e as respectivas categorias
 3 - Criar um trigger que crie um log sempre que qualquer tabela tenha um novo registro inserido, atualizado ou deletado
 4 - Criar uma view que retorne a lista de alunos matriculados seus cursos e as respectivas categorias
 5 -
 */

-- Stored Procedure para adicionar um aluno
DELIMITER //
CREATE PROCEDURE IF NOT EXISTS adiciona_aluno(IN p_nome VARCHAR(50), IN p_nascimento DATE)
BEGIN
    INSERT INTO tb_aluno (nome, nascimento) VALUES (p_nome, p_nascimento);
END //
DELIMITER ;

-- Stored Procedure para adicionar uma categoria
DELIMITER //
CREATE PROCEDURE IF NOT EXISTS adiciona_categoria(IN p_nome VARCHAR(50))
BEGIN
    INSERT INTO tb_categoria (nome) VALUES (p_nome);
END //
DELIMITER ;

-- Stored Procedure para adicionar um curso
DELIMITER //
CREATE PROCEDURE IF NOT EXISTS adiciona_curso(IN p_nome VARCHAR(50), IN p_id_categoria BIGINT UNSIGNED)
BEGIN
    INSERT INTO tb_curso (nome, id_categoria) VALUES (p_nome, p_id_categoria);
END //
DELIMITER ;

CALL adiciona_aluno('João', '2000-01-01');
CALL adiciona_categoria('Programação Mobile');
CALL adiciona_curso('Python 3', 1);

-- Função que retorna a lista de cursos que um aluno está matriculado e as respectivas categorias
DROP FUNCTION IF EXISTS aluno_cursos;
DELIMITER //
CREATE FUNCTION aluno_cursos(p_aluno_id INT)
    RETURNS VARCHAR(1000)
    READS SQL DATA
BEGIN
    DECLARE v_cursos VARCHAR(1000);

    SELECT GROUP_CONCAT(CONCAT(tb_curso.nome, ' - ', tb_categoria.nome) SEPARATOR ', ')
    INTO v_cursos
    FROM tb_aluno_curso
             JOIN tb_curso ON tb_aluno_curso.id_curso = tb_curso.id
             JOIN tb_categoria ON tb_curso.id_categoria = tb_categoria.id
    WHERE tb_aluno_curso.id_aluno = p_aluno_id;

    RETURN v_cursos;
END //
DELIMITER ;


SELECT lista_cursos_aluno(1);
SELECT lista_cursos_aluno(2);


SELECT tb_aluno.nome AS aluno_nome, tb_curso.nome AS curso_nome, tb_categoria.nome AS categoria_nome
FROM tb_aluno_curso
         JOIN tb_aluno ON tb_aluno_curso.id_aluno = tb_aluno.id
         JOIN tb_curso ON tb_aluno_curso.id_curso = tb_curso.id
         JOIN tb_categoria ON tb_curso.id_categoria = tb_categoria.id;

DELIMITER //
CREATE PROCEDURE lista_alunos_cursos()
BEGIN
    SELECT tb_aluno.nome AS aluno_nome, tb_curso.nome AS curso_nome, tb_categoria.nome AS categoria_nome
    FROM tb_aluno_curso
             JOIN tb_aluno ON tb_aluno_curso.id_aluno = tb_aluno.id
             JOIN tb_curso ON tb_aluno_curso.id_curso = tb_curso.id
             JOIN tb_categoria ON tb_curso.id_categoria = tb_categoria.id;
END //
DELIMITER ;

CALL lista_alunos_cursos();

-- Trigger que crie um log sempre que qualquer tabela tenha um novo registro inserido, atualizado ou deletado
DROP TRIGGER IF EXISTS log_insert;
DROP TRIGGER IF EXISTS log_update;
DROP TRIGGER IF EXISTS log_delete;
DROP TRIGGER IF EXISTS log_insert_curso;
DROP TRIGGER IF EXISTS log_update_curso;
DROP TRIGGER IF EXISTS log_delete_curso;
DROP TRIGGER IF EXISTS log_insert_categoria;
DROP TRIGGER IF EXISTS log_update_categoria;
DROP TRIGGER IF EXISTS log_delete_categoria;
DROP TRIGGER IF EXISTS log_insert_aluno_curso;
DROP TRIGGER IF EXISTS log_delete_aluno_curso;
DROP TRIGGER IF EXISTS log_update_aluno_curso;

DELIMITER //
CREATE TRIGGER IF NOT EXISTS log_insert
    AFTER INSERT
    ON tb_aluno
    FOR EACH ROW
BEGIN
    INSERT INTO tb_log (tabela, acao, id_registro, data)
    VALUES ('tb_aluno', 'INSERT', NEW.id, NOW());
END //
DELIMITER ;

DELIMITER //
CREATE TRIGGER IF NOT EXISTS log_update
    AFTER UPDATE
    ON tb_aluno
    FOR EACH ROW
BEGIN
    INSERT INTO tb_log (tabela, acao, id_registro, data)
    VALUES ('tb_aluno', 'UPDATE', NEW.id, NOW());
END //
DELIMITER ;

DELIMITER //
CREATE TRIGGER IF NOT EXISTS log_delete
    AFTER DELETE
    ON tb_aluno
    FOR EACH ROW
BEGIN
    INSERT INTO tb_log (tabela, acao, id_registro, data)
    VALUES ('tb_aluno', 'DELETE', OLD.id, NOW());
END //
DELIMITER ;

DELIMITER //
CREATE TRIGGER IF NOT EXISTS log_insert_curso
    AFTER INSERT
    ON tb_curso
    FOR EACH ROW
BEGIN
    INSERT INTO tb_log (tabela, acao, id_registro, data)
    VALUES ('tb_curso', 'INSERT', NEW.id, NOW());
END //
DELIMITER ;

DELIMITER //
CREATE TRIGGER IF NOT EXISTS log_update_curso
    AFTER UPDATE
    ON tb_curso
    FOR EACH ROW
BEGIN
    INSERT INTO tb_log (tabela, acao, id_registro, data)
    VALUES ('tb_curso', 'UPDATE', NEW.id, NOW());
END //
DELIMITER ;

DELIMITER //
CREATE TRIGGER IF NOT EXISTS log_delete_curso
    AFTER DELETE
    ON tb_curso
    FOR EACH ROW
BEGIN
    INSERT INTO tb_log (tabela, acao, id_registro, data)
    VALUES ('tb_curso', 'DELETE', OLD.id, NOW());
END //
DELIMITER ;

DELIMITER //
CREATE TRIGGER IF NOT EXISTS log_insert_categoria
    AFTER INSERT
    ON tb_categoria
    FOR EACH ROW
BEGIN
    INSERT INTO tb_log (tabela, acao, id_registro, data)
    VALUES ('tb_categoria', 'INSERT', NEW.id, NOW());
END //
DELIMITER ;

DELIMITER //
CREATE TRIGGER IF NOT EXISTS log_update_categoria
    AFTER UPDATE
    ON tb_categoria
    FOR EACH ROW
BEGIN
    INSERT INTO tb_log (tabela, acao, id_registro, data)
    VALUES ('tb_categoria', 'UPDATE', NEW.id, NOW());
END //
DELIMITER ;

DELIMITER //
CREATE TRIGGER IF NOT EXISTS log_delete_categoria
    AFTER DELETE
    ON tb_categoria
    FOR EACH ROW
BEGIN
    INSERT INTO tb_log (tabela, acao, id_registro, data)
    VALUES ('tb_categoria', 'DELETE', OLD.id, NOW());
END //
DELIMITER ;

DELIMITER //
CREATE TRIGGER IF NOT EXISTS log_insert_aluno_curso
    AFTER INSERT
    ON tb_aluno_curso
    FOR EACH ROW
BEGIN
    INSERT INTO tb_log (tabela, acao, id_registro, data)
    VALUES ('tb_aluno_curso', 'INSERT', NEW.id_aluno, NOW()),
           ('tb_aluno_curso', 'INSERT', NEW.id_curso, NOW());
END //
DELIMITER ;

DELIMITER //
CREATE TRIGGER IF NOT EXISTS log_delete_aluno_curso
    AFTER DELETE
    ON tb_aluno_curso
    FOR EACH ROW
BEGIN
    INSERT INTO tb_log (tabela, acao, id_registro, data)
    VALUES ('tb_aluno_curso', 'DELETE', OLD.id_aluno, NOW()),
           ('tb_aluno_curso', 'DELETE', OLD.id_curso, NOW());
END //
DELIMITER ;

DELIMITER //
CREATE TRIGGER IF NOT EXISTS log_update_aluno_curso
    AFTER UPDATE
    ON tb_aluno_curso
    FOR EACH ROW
BEGIN
    INSERT INTO tb_log (tabela, acao, id_registro, data)
    VALUES ('tb_aluno_curso', 'UPDATE', NEW.id_aluno, NOW()),
           ('tb_aluno_curso', 'UPDATE', NEW.id_curso, NOW());
END //
DELIMITER ;

SELECT *
FROM tb_log;

-- View que retorna a lista de alunos matriculados seus cursos e as respectivas categorias
DROP VIEW IF EXISTS vw_alunos_cursos;
CREATE VIEW vw_alunos_cursos AS
SELECT tb_aluno.nome       AS aluno_nome,
       tb_curso.nome       AS curso_nome,
       tb_categoria.nome   AS categoria_nome,
       tb_aluno_curso.data AS data_matricula
FROM tb_aluno_curso
         JOIN tb_aluno ON tb_aluno_curso.id_aluno = tb_aluno.id
         JOIN tb_curso ON tb_aluno_curso.id_curso = tb_curso.id
         JOIN tb_categoria ON tb_curso.id_categoria = tb_categoria.id
ORDER BY aluno_nome;


SELECT *
FROM vw_alunos_cursos;