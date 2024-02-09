-- COUNT - Retorna a quantidade de registros
-- SUM -   Retorna a soma dos registros
-- MAX -   Retorna o maior valor dos registros
-- MIN -   Retorna o menor valor dos registros
-- AVG -   Retorna a média dos registros


-- Quantos registros temos na tabela de cursos?
SELECT COUNT(id) AS quantidade_de_registros
FROM tb_curso;

-- Qual é a soma de todos os valores da tabela de cursos?
SELECT COUNT(id),
       SUM(id),
       MAX(id),
       MIN(id),
       ROUND(AVG(id), 0)
FROM tb_funcionarios;

-- Qual é a média de valores da tabela de cursos?
SELECT nome,
       sobrenome,
       COUNT(*) AS quantidade_de_registros
FROM tb_funcionarios
GROUP BY nome, sobrenome
ORDER BY nome;


-- Quantos alunos temos em cada curso?
SELECT tb_curso.nome AS nome_do_curso,
       COUNT(tb_aluno.id) AS quantidade_de_alunos
FROM tb_aluno
         JOIN tb_aluno_curso ON tb_aluno.id = tb_aluno_curso.aluno_id
         JOIN tb_curso ON tb_curso.id = tb_aluno_curso.curso_id
GROUP BY tb_curso.nome
ORDER BY tb_curso.nome;



