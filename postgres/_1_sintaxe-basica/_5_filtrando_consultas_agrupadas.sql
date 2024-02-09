-- Consulta para listar todos os cursos com seus alunos associados:
SELECT *
FROM tb_curso
         LEFT JOIN tb_aluno_curso ON tb_curso.id = tb_aluno_curso.curso_id
         LEFT JOIN tb_aluno ON tb_aluno.id = tb_aluno_curso.aluno_id;

-- Consulta para contar o número de alunos inscritos em cada curso:
SELECT tb_curso.nome,
       COUNT(tb_aluno.id) AS qtd_alunos
FROM tb_curso
         LEFT JOIN tb_aluno_curso ON tb_curso.id = tb_aluno_curso.curso_id
         LEFT JOIN tb_aluno ON tb_aluno.id = tb_aluno_curso.aluno_id
GROUP BY tb_curso.nome;

-- Consulta para contar o número de alunos inscritos nos cursos 'C#' ou 'Java':
SELECT tb_curso.nome,
       COUNT(tb_aluno.id)
FROM tb_curso
         LEFT JOIN tb_aluno_curso ON tb_curso.id = tb_aluno_curso.curso_id
         LEFT JOIN tb_aluno ON tb_aluno.id = tb_aluno_curso.aluno_id
WHERE tb_curso.nome IN ('C#', 'Java')
GROUP BY tb_curso.nome;

-- Consulta para contar o número de funcionários com nomes duplicados:
SELECT nome,
       COUNT(id) AS qtd_duplicados
FROM tb_funcionarios
GROUP BY nome
HAVING COUNT(id) > 1;
