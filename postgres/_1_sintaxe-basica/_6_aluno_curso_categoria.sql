DROP TABLE IF EXISTS tb_aluno;
DROP TABLE IF EXISTS tb_aluno_curso;
DROP TABLE IF EXISTS tb_curso;
DROP TABLE IF EXISTS tb_categoria;

CREATE TABLE tb_aluno
(
    id              SERIAL,
    primeiro_nome   VARCHAR(100) NOT NULL,
    ultimo_nome     VARCHAR(100) NOT NULL,
    data_nascimento DATE         NOT NULL,

    PRIMARY KEY (id)
);

CREATE TABLE tb_categoria
(
    id   SERIAL,
    nome VARCHAR(100) UNIQUE NOT NULL,

    PRIMARY KEY (id)
);

CREATE TABLE tb_curso
(
    id           SERIAL,
    nome         VARCHAR(100) UNIQUE NOT NULL,
    categoria_id INTEGER,

    PRIMARY KEY (id),
    FOREIGN KEY (categoria_id) REFERENCES tb_categoria (id)
);

CREATE TABLE tb_aluno_curso
(
    aluno_id INTEGER,
    curso_id INTEGER,
    PRIMARY KEY (aluno_id, curso_id),

    FOREIGN KEY (aluno_id) REFERENCES tb_aluno (id),
    FOREIGN KEY (curso_id) REFERENCES tb_curso (id)
);

INSERT INTO tb_aluno (primeiro_nome, ultimo_nome, data_nascimento)
VALUES ('Vinicius', 'Dias', '1997-10-15'),
       ('Patricia', 'Freitas', '1986-10-25'),
       ('Diogo', 'Oliveira', '1984-08-27'),
       ('Maria', 'Rosa', '1985-01-01');

INSERT INTO tb_categoria (nome)
VALUES ('Front-end'),
       ('Programação'),
       ('Bancos de dados'),
       ('Data Science');

INSERT INTO tb_curso (nome, categoria_id)
VALUES ('HTML', 1),
       ('CSS', 1),
       ('JS', 1),
       ('PHP', 2),
       ('Java', 2),
       ('C++', 2),
       ('PostgreSQL', 3),
       ('MySQL', 3),
       ('Oracle', 3),
       ('SQL Server', 3),
       ('SQLite', 3),
       ('Pandas', 4),
       ('Machine Learning', 4),
       ('Power BI', 4);

INSERT INTO tb_aluno_curso
VALUES (1, 4),
       (1, 11),
       (2, 1),
       (2, 2),
       (3, 4),
       (3, 3),
       (4, 4),
       (4, 6),
       (4, 5);

--Contagem de cursos por aluno:
SELECT tb_aluno.primeiro_nome,
       tb_aluno.ultimo_nome,
       COUNT(tb_curso.id) numero_cursos
FROM tb_aluno
         JOIN tb_aluno_curso ON tb_aluno_curso.aluno_id = tb_aluno.id
         JOIN tb_curso ON tb_curso.id = tb_aluno_curso.curso_id
GROUP BY 1, 2
ORDER BY numero_cursos DESC;

--Contagem de cursos por aluno (outra abordagem):
SELECT tb_aluno.primeiro_nome,
       tb_aluno.ultimo_nome,
       COUNT(tb_aluno_curso.curso_id) numero_cursos
FROM tb_aluno
         JOIN tb_aluno_curso ON tb_aluno_curso.aluno_id = tb_aluno.id
GROUP BY 1, 2
ORDER BY numero_cursos DESC;

--Aluno com o maior número de cursos:
SELECT tb_aluno.primeiro_nome,
       tb_aluno.ultimo_nome,
       COUNT(tb_aluno_curso.curso_id) numero_cursos
FROM tb_aluno
         JOIN tb_aluno_curso ON tb_aluno_curso.aluno_id = tb_aluno.id
GROUP BY 1, 2
ORDER BY numero_cursos DESC
LIMIT 1;

--Curso com o maior número de alunos:
SELECT tb_curso.nome,
       COUNT(tb_aluno_curso.aluno_id) numero_alunos
FROM tb_curso
         JOIN tb_aluno_curso ON tb_aluno_curso.curso_id = tb_curso.id
GROUP BY 1
ORDER BY numero_alunos DESC
LIMIT 1;