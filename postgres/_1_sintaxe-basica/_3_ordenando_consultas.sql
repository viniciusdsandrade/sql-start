CREATE TABLE tb_funcionarios
(
    id        SERIAL,
    matricula VARCHAR(10),
    nome      VARCHAR(255),
    sobrenome VARCHAR(255),

    PRIMARY KEY (id)
);

INSERT INTO tb_funcionarios (matricula, nome, sobrenome)
VALUES ('M001', 'Diogo', 'Mascarenhas'),
       ('M002', 'João', 'Silva'),
       ('M003', 'Maria', 'Santos'),
       ('M004', 'José', 'Oliveira'),
       ('M005', 'Ana', 'Costa');

SELECT *
FROM tb_funcionarios
ORDER BY nome;

SELECT *
FROM tb_funcionarios
ORDER BY nome
LIMIT 5;

SELECT *
FROM tb_funcionarios
ORDER BY 4 DESC, nome DESC, 2;

-- 1. Qual é o nome do curso que o aluno de id 1 está matriculado?
SELECT tb_aluno.id      as aluno_id,
       tb_aluno.nome    as "Nome do Aluno",
       tb_curso.nome as "Nome do Curso"
FROM tb_aluno
         JOIN tb_aluno_curso ON tb_aluno_curso.aluno_id = tb_aluno.id
         JOIN tb_curso ON tb_curso.id = tb_aluno_curso.curso_id
ORDER BY tb_curso.nome, tb_aluno.nome
