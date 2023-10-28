/*
1. Crie um banco de dados para um serviço de RH de uma empresa, onde o sistema
trabalhará com as informações dos colaboradores desta empresa.
*/
DROP DATABASE IF EXISTS DB_RH;
CREATE DATABASE IF NOT EXISTS  DB_RH;
USE DB_RH;

/*
2. Crie uma tabela de colaboradores e determine 5 atributos relevantes dos
colaboradores para se trabalhar com o serviço deste RH.
*/
CREATE TABLE IF NOT EXISTS colaboradores
(
    id              TINYINT UNSIGNED NOT NULL AUTO_INCREMENT,
    nome            VARCHAR(100)     NOT NULL,
    sobrenome       VARCHAR(100)     NOT NULL,
    cargo           VARCHAR(100)     NOT NULL,
    salario         DECIMAL(10, 2)   NOT NULL,
    data_nascimento DATE             NOT NULL,
    PRIMARY KEY (id)
);

/*
 3. Insira nesta tabela no mínimo 5 dados (registros).
*/
INSERT INTO colaboradores (nome, sobrenome, cargo, salario, data_nascimento)
VALUES ('Vinícius', 'Andrade', 'Desenvolvedor de Softwware', 5000.00, '2001-12-06'),
       ('Maria', 'Santos', 'Analista de Sistemas', 3000.00, '1996-04-13'),
       ('José', 'Souza', 'Administrador de BD', 2000.00, '1995-01-21'),
       ('Ana', 'Oliveira', 'Estatistico', 3500.00, '1992-09-17'),
       ('Pedro', 'Silva', 'Matemático', 4000.00, '1999-11-28');
/*
4. Faça um SELECT que retorne todes os colaboradores com o salário maior do que
2000.
*/
SELECT *
FROM colaboradores
WHERE salario > 2000;

/*
 5. Faça um SELECT que retorne todes os colaboradores com o salário menor do que
2000.
 */
SELECT *
FROM colaboradores
WHERE salario < 2000;

/*
6. Ao término atualize um registro desta tabela através de uma query de atualização.
*/
UPDATE colaboradores
SET salario = 1000
WHERE id = 1;

/*
7. Salve todas as queries para cada um dos requisitos do exercício em um único script
(arquivo .SQL) e coloque no seu Github pessoal, no repositório que você criou sobre Banco de dados.
*/
