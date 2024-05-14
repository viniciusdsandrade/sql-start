SELECT *
FROM tb_curso;
SELECT *
FROM tb_categoria;


-- Seleciona todas as colunas da tabela tb_curso onde o categoria_id está contido nos valores 1 ou 2
SELECT *
FROM tb_curso
WHERE categoria_id IN (1, 2);

-- Seleciona cursos em categorias sem espaços nos nomes
SELECT *
FROM tb_curso
WHERE categoria_id IN (SELECT id
                       FROM tb_categoria
                       WHERE nome NOT LIKE ('% %'));

-- Seleciona cursos em categorias com "de" no nome
SELECT *
FROM tb_curso
WHERE categoria_id IN (SELECT id
                       FROM tb_categoria
                       WHERE nome LIKE ('% de %'));

-- o nome de cada categoria junto com o número de cursos associados a ela, contando os cursos correspondentes em cada categoria e agrupando os resultados pelo nome da categoria
SELECT tb_categoria.nome  AS categoria,
       COUNT(tb_curso.id) as numero_cursos
FROM tb_categoria
         JOIN tb_curso ON tb_curso.categoria_id = tb_categoria.id
GROUP BY categoria;


-- Retorna o nome da categoria e o número de cursos associados a ela, apenas para categorias que têm mais de três cursos.
SELECT categoria,
       numero_cursos
FROM (SELECT tb_categoria.nome  AS categoria,
             COUNT(tb_curso.id) as numero_cursos
      FROM tb_categoria
               JOIN tb_curso ON tb_curso.categoria_id = tb_categoria.id
      GROUP BY categoria) AS categoria_cursos
WHERE numero_cursos > 3;


-- Faz exatamente o mesmo que a primeira, usando a cláusula HAVING para filtrar categorias com mais de três cursos após o agrupamento.
SELECT tb_categoria.nome  AS categoria,
       COUNT(tb_curso.id) as numero_cursos
FROM tb_categoria
         JOIN tb_curso ON tb_curso.categoria_id = tb_categoria.id
GROUP BY categoria
HAVING COUNT(tb_curso.id) > 3;


-- Retorna o nome de cada curso junto com o número de alunos matriculados nele, contando os alunos associados a cada curso e filtrando apenas os cursos com mais de dois alunos matriculados, ordenados pelo número de alunos em ordem decrescente.
SELECT t.curso,
       t.numero_alunos
FROM (SELECT tb_curso.nome AS               curso,
             COUNT(tb_aluno_curso.aluno_id) numero_alunos
      FROM tb_curso
               JOIN tb_aluno_curso ON tb_aluno_curso.curso_id = tb_curso.id
      GROUP BY 1) AS t
WHERE t.numero_alunos > 2
ORDER BY t.numero_alunos DESC;


-- Faz o mesmo que a terceira, mas usando a cláusula HAVING para filtrar cursos com mais de dois alunos matriculados após o agrupamento, ordenados pelo número de alunos em ordem decrescente.
SELECT tb_curso.nome,
       COUNT(tb_aluno_curso.aluno_id) numero_alunos
FROM tb_curso
         JOIN tb_aluno_curso ON tb_aluno_curso.curso_id = tb_curso.id
GROUP BY 1
HAVING COUNT(tb_aluno_curso.aluno_id) > 2
ORDER BY numero_alunos DESC;

