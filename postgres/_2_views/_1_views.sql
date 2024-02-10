-- Conta o número de alunos em cada curso com mais de 2 alunos
SELECT tb_curso.nome,
       COUNT(tb_aluno_curso.aluno_id) numero_alunos
FROM tb_curso
         JOIN tb_aluno_curso ON tb_aluno_curso.curso_id = tb_curso.id
GROUP BY 1
HAVING COUNT(tb_aluno_curso.aluno_id) > 2
ORDER BY numero_alunos DESC;

-- Conta o número de cursos em cada categoria com mais de 3 cursos
SELECT tb_categoria.nome  AS categoria,
       COUNT(tb_curso.id) as numero_cursos
FROM tb_categoria
         JOIN tb_curso ON tb_curso.categoria_id = tb_categoria.id
GROUP BY categoria
HAVING COUNT(tb_curso.id) > 3;

-- Cria uma view com o número de alunos em cada curso
CREATE VIEW view_curso_alunos AS
SELECT tb_curso.nome,
       COUNT(tb_aluno_curso.aluno_id) numero_alunos
FROM tb_curso
         JOIN tb_aluno_curso ON tb_aluno_curso.curso_id = tb_curso.id
GROUP BY 1
HAVING COUNT(tb_aluno_curso.aluno_id) > 2
ORDER BY numero_alunos DESC;

-- Cria uma view com o número de cursos em cada categoria
CREATE VIEW view_categoria_cursos AS
SELECT tb_categoria.nome  AS categoria,
       COUNT(tb_curso.id) as numero_cursos
FROM tb_categoria
         JOIN tb_curso ON tb_curso.categoria_id = tb_categoria.id
GROUP BY categoria
HAVING COUNT(tb_curso.id) > 3;

-- Seleciona todos os registros da view 'view_curso_alunos'
SELECT *
FROM view_curso_alunos;

-- Seleciona todos os registros da view 'view_categoria_cursos'
SELECT *
FROM view_categoria_cursos;

-- Deleta a view 'view_curso_alunos'
DROP VIEW view_curso_alunos;

-- Deleta a view 'view_categoria_cursos'
DROP VIEW view_categoria_cursos;


SELECT tb_categoria.id AS categoria_id, view_categoria_cursos.*
FROM view_categoria_cursos
         JOIN tb_categoria ON tb_categoria.nome = view_categoria_cursos.categoria;

