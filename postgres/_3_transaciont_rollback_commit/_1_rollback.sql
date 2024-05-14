BEGIN;
UPDATE tb_aluno SET data_nascimento = '2001-12-06' WHERE id = 1;
ROLLBACK;

BEGIN;
DELETE FROM tb_aluno WHERE data_nascimento = '2001-12-06';
ROLLBACK;