SELECT * FROM tb_aluno;
SELECT * FROM tb_curso;
SELECT * FROM tb_aluno_curso;

DROP TABLE IF EXISTS tb_aluno;
DROP TABLE IF EXISTS tb_curso;
DROP TABLE IF EXISTS tb_aluno_curso;

CREATE TABLE tb_aluno_curso
(
    aluno_id INTEGER,
    curso_id INTEGER,
    PRIMARY KEY (aluno_id, curso_id),

    FOREIGN KEY (aluno_id)
        REFERENCES tb_aluno (id)
        ON DELETE CASCADE,

    FOREIGN KEY (curso_id)
        REFERENCES tb_curso (id)
);

INSERT INTO tb_aluno_curso (aluno_id, curso_id)
VALUES (1, 1),
       (1, 2),
       (2, 1),
       (3, 2),
       (3, 3),
       (1, 3);

--  seleciona o nome do aluno da tabela tb_aluno, o nome do curso da tabela tb_curso, relacionando-os através da tabela de associação tb_aluno_curso
SELECT a.nome AS "Nome do Aluno",
       c.nome AS "Nome do Curso"
FROM tb_aluno a
         JOIN tb_aluno_curso ac ON a.id = ac.aluno_id
         JOIN tb_curso c ON ac.curso_id = c.id;

--  seleciona o nome do aluno da tabela tb_aluno, o nome do curso da tabela tb_curso, relacionando-os através da tabela de associação tb_aluno_curso
SELECT
    tb_aluno.id AS "ID do Aluno",
    tb_aluno.nome AS "Nome do Aluno",
    tb_curso.id AS "ID do Curso",
    tb_curso.nome AS "Nome do Curso"
FROM tb_aluno
         JOIN tb_aluno_curso ON tb_aluno.id = tb_aluno_curso.aluno_id
         JOIN tb_curso ON tb_aluno_curso.curso_id = tb_curso.id;
