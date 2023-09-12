/*
Atividade 2
1. Crie um banco de dados para um e-commerce, onde o sistema trabalhará com as
informações dos produtos deste e-commerce.
*/
DROP DATABASE IF EXISTS db_e_commerce;
CREATE DATABASE IF NOT EXISTS db_e_commerce;
USE db_e_commerce;

/*
2. Crie uma tabela de produtos e determine 5 atributos relevantes dos produtos para se
trabalhar com o serviço deste e-commerce.
*/
CREATE TABLE produtos
(
    id         INT            NOT NULL AUTO_INCREMENT,
    nome       VARCHAR(50)    NOT NULL,
    descricao  VARCHAR(100)   NOT NULL,
    valor      DECIMAL(10, 2) NOT NULL,
    quantidade INT            NOT NULL,
    categoria  VARCHAR(50)    NOT NULL,
    PRIMARY KEY (id)
);

/*
3. Insira nesta tabela no mínimo 8 dados (registros).
*/
INSERT INTO produtos (nome, descricao, valor, quantidade, categoria)
VALUES ('Camiseta', 'Camiseta de algodão', 50.00, 10, 'Vestuário'),
       ('Calça', 'Calça jeans', 100.00, 5, 'Vestuário'),
       ('Tênis', 'Tênis de corrida', 200.00, 3, 'Calçados'),
       ('Bola', 'Bola de futebol', 30.00, 20, 'Esportes'),
       ('Luvas', 'Luvas de boxe', 150.00, 2, 'Esportes'),
       ('Bicicleta', 'Bicicleta de corrida', 1000.00, 1, 'Esportes'),
       ('Notebook', 'Notebook Dell', 3000.00, 1, 'Informática'),
       ('Mouse', 'Mouse sem fio', 100.00, 5, 'Informática');

/*
4. Faça um SELECT que retorne todes os produtos com o valor maior do que 500.
*/
SELECT *
FROM produtos
WHERE valor > 500;

/*
5. Faça um SELECT que retorne todes os produtos com o valor menor do que 500.
*/
SELECT *
FROM produtos
WHERE valor < 500;

/*
6. Ao término atualize um registro desta tabela através de uma query de atualização.
*/
UPDATE produtos
SET valor = 1500.00
WHERE id = 7;

/*
7. Salve todas as queries para cada um dos requisitos do exercício em um único script
(arquivo .SQL) e coloque no seu Github pessoal, no repositório que você criou sobre
Banco de dados.
*/