/*
Atividade 3
1. Crie um banco de dados para um registro de uma escola, onde o sistema trabalhará
com as informações dos estudantes deste registro dessa escola.
*/
DROP DATABASE IF EXISTS db_escola;
CREATE DATABASE IF NOT EXISTS db_escola;
USE db_escola;

/*
2. Crie uma tabela estudantes e utilizando a habilidade de abstração e determine 5
atributos relevantes dos estudantes para se trabalhar com o serviço dessa escola.
*/
CREATE TABLE IF NOT EXISTS estudantes
(
    id              INT           NOT NULL AUTO_INCREMENT,
    nome            VARCHAR(255)  NOT NULL,
    email           VARCHAR(100)  NOT NULL UNIQUE,
    data_nascimento DATE          NOT NULL,
    nota            DECIMAL(3, 1) NOT NULL,
    PRIMARY KEY (id)
);

/*
3. Insira nesta tabela no mínimo 8 dados (registros).
*/
INSERT INTO estudantes (nome, email, data_nascimento, nota)
VALUES ('João Silva', 'joao@email.com', '2000-03-15', 9.5),
       ('Maria Santos', 'maria@email.com', '2001-07-20', 8.7),
       ('Pedro Oliveira', 'pedro@email.com', '1999-01-10', 7.2),
       ('Ana Souza', 'ana@email.com', '2002-05-03', 6.8),
       ('Carlos Pereira', 'carlos@email.com', '2003-11-28', 8.9);


/*
4. Faça um SELECT que retorne todes o/a(s) estudantes com a nota maior do que 7.0.
*/
SELECT *
FROM estudantes
WHERE nota > 7.0;

/*
5. Faça um SELECT que retorne todes o/a(s) estudantes com a nota menor do que 7.0.
*/
SELECT *
FROM estudantes
WHERE nota < 7.0;

/*
6. Ao término atualize um registro desta tabela através de uma query de atualização.
*/
UPDATE estudantes
SET nota = 8.0
WHERE id = 1;

/*
7. Salve todas as queries para cada um dos requisitos do exercício em um único script
(arquivo .SQL) e coloque no seu Github pessoal, no repositório que você criou sobre
Banco de dados.
*/