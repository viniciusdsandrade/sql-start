/*
1 - Stored Procedure para Inserir um Personagem:
2 - Stored Procedure para Atualizar os Dados de um Personagem:
3 - Função para Calcular o Total de Personagens em uma Classe:
4 - Função para Recuperar o Nome da Classe de um Personagem:
5 - Stored Procedure para Excluir um Personagem:
6 - Stored Procedure para Listar todos os Personagens de uma Classe:
7 - Função para Calcular o Poder Médio de Ataque de uma Classe:
8 - Função para Verificar se uma Classe tem Personagens:

Stored Procedure:
Uma stored procedure é um conjunto de instruções SQL que podem ser executadas de forma independente. 
Elas são geralmente usadas para agrupar várias instruções em uma única unidade lógica, facilitando a 
execução e a reutilização do código. As stored procedures podem receber parâmetros de entrada e 
podem retornar resultados ou valores por meio de parâmetros de saída. 
Elas também podem executar operações de modificação nos dados do banco de dados. 
As stored procedures são executadas usando a declaração CALL.

Função:
Uma função é um bloco de código SQL que recebe argumentos de entrada, processa esses argumentos e retorna um valor. 
Diferentemente das stored procedures, as funções sempre retornam um valor e não podem realizar operações de modificação nos dados do banco de dados. 
As funções são mais utilizadas para realizar cálculos, manipulações de dados ou operações que geram um resultado baseado nas entradas fornecidas. 
Elas podem ser usadas em consultas SQL como parte de uma expressão.

Diferenças Principais:
1 - Retorno de Valor: A principal diferença é que as stored procedures podem ou não retornar valores, enquanto as funções sempre retornam um valor.
2 - Modificações nos Dados: As stored procedures podem executar operações de modificação nos dados, como inserção, atualização e exclusão. 
As funções não podem realizar tais operações.
3 - Uso em Expressões: As funções podem ser usadas em expressões SQL, como parte de uma consulta, para calcular valores ou realizar operações, 
enquanto as stored procedures não são usadas dessa maneira.
4 - Utilização: As stored procedures são frequentemente usadas para encapsular lógica de negócios complexa ou para executar tarefas administrativas, 
enquanto as funções são mais adequadas para cálculos e manipulações de dados.
*/

/* Stored Procedure para Inserir um personagem*/
DROP PROCEDURE IF EXISTS sp_inserir_personagem;
DELIMITER //
CREATE PROCEDURE sp_inserir_personagem(IN name VARCHAR(100),
                                       IN attack INT,
                                       IN defense INT,
                                       IN id_super INT)
BEGIN
    INSERT INTO tb_personagens (nome,
                                poder_ataque,
                                poder_defesa,
                                id_classe)
    VALUES (name, attack, defense, id_super);
END //
DELIMITER ;

/*Testar*/
CALL sp_inserir_personagem('Personagem genérico', 1000, 2000, 1);

/* Stored Procedure para Atualizar os Dados de um Personagem*/
DROP PROCEDURE IF EXISTS sp_atualizar_personagem;
DELIMITER //
CREATE PROCEDURE sp_atualizar_personagem(IN id_personagem INT,
                                         IN name VARCHAR(100),
                                         IN attack INT,
                                         IN defence INT,
                                         IN id_super INT)
BEGIN
    UPDATE tb_personagens
    SET nome         = name,
        poder_ataque = attack,
        poder_defesa = defence,
        id_classe    = id_super
    WHERE id = id_personagem;
END //
DELIMITER ;

/*Testar*/
CALL sp_atualizar_personagem(1, 'Personagem genérico atualizado', 2000, 3000, 2);

/* Função para Calcular o Total de Personagens em uma Classe*/
DROP FUNCTION IF EXISTS fn_total_personagens_classe;


/* Função para Recuperar o Nome da Classe de um Personagem*/
DROP FUNCTION IF EXISTS fn_nome_classe_personagem;
DELIMITER //
CREATE FUNCTION fn_total_personagens_classe_por_nome(nome_classe VARCHAR(100))
    RETURNS INT
    DETERMINISTIC
BEGIN
    DECLARE total_personagens INT;
    SELECT COUNT(*)
    INTO total_personagens
    FROM tb_personagens p
             JOIN tb_classes c ON p.id_classe = c.id
    WHERE c.nome = nome_classe;
    RETURN total_personagens;
END //
DELIMITER ;

/*Testar*/
SELECT fn_total_personagens_classe_por_nome('Arqueiro'); -- Retorna o total de personagens na classe "Arqueiro"
SELECT fn_total_personagens_classe_por_nome('Mago'); -- Retorna o total de personagens na classe "Mago"
SELECT fn_total_personagens_classe_por_nome('Guerreiro');-- Retorna o total de personagens na classe "Guerreiro"
SELECT fn_total_personagens_classe_por_nome('Lutador'); -- Retorna o total de personagens na classe "Lutador"
SELECT fn_total_personagens_classe_por_nome('Cavaleiro');
-- total de personagens na classe "Cavaleiro"


/* Stored Procedure para Excluir um Personagem*/
DROP PROCEDURE IF EXISTS sp_excluir_personagem;
DELIMITER //
CREATE PROCEDURE sp_excluir_personagem(IN id_personagem INT)
BEGIN
    DELETE
    FROM tb_personagens
    WHERE id = id_personagem;
END //

DELIMITER ;

/*Testar*/
CALL sp_excluir_personagem(1);

/* Stored Procedure para Listar todos os Personagens de uma Classe */
DROP PROCEDURE IF EXISTS sp_listar_personagens_classe_por_nome;
DELIMITER //
CREATE PROCEDURE sp_listar_personagens_classe_por_nome(IN nome_classe VARCHAR(100))
BEGIN
    SELECT p.*
    FROM tb_personagens p
             JOIN tb_classes c ON p.id_classe = c.id
    WHERE c.nome = nome_classe;
END //
DELIMITER ;

/*Testar*/
CALL sp_listar_personagens_classe_por_nome('Arqueiro'); -- Listará todos os personagens da classe "Arqueiro"
CALL sp_listar_personagens_classe_por_nome('Mago'); -- Listará todos os personagens da classe "Mago"
CALL sp_listar_personagens_classe_por_nome('Guerreiro');-- Listará todos os personagens da classe "Guerreiro"
CALL sp_listar_personagens_classe_por_nome('Lutador'); -- Listará todos os personagens da classe "Lutador"
CALL sp_listar_personagens_classe_por_nome('Cavaleiro');
-- Listará todos os personagens da classe "Cavaleiro"


/* Função para Calcular o Poder Médio de Ataque de uma Classe*/
DROP FUNCTION IF EXISTS fn_poder_medio_ataque_classe;
DELIMITER //
CREATE FUNCTION fn_poder_medio_ataque_classe(id_classe INT)
    RETURNS DECIMAL(10, 2)
BEGIN
    DECLARE poder_medio_ataque DECIMAL(10, 2);
    SELECT AVG(poder_ataque)
    INTO poder_medio_ataque
    FROM tb_personagens
    WHERE id = id_classe;
    RETURN poder_medio_ataque;
END //
DELIMITER ;

/*Testar*/
SELECT fn_poder_medio_ataque_classe(1);

/* Função para Verificar se uma Classe tem Personagens*/
DROP FUNCTION IF EXISTS fn_verificar_classe_tem_personagens;
DELIMITER //
CREATE FUNCTION fn_verificar_classe_tem_personagens(id_classe INT)
    RETURNS INT
    DETERMINISTIC
BEGIN
    DECLARE total_personagens INT;
    SELECT COUNT(*)
    INTO total_personagens
    FROM tb_personagens
    WHERE id = id_classe;
    IF total_personagens > 0 THEN
        RETURN 1;
    ELSE
        RETURN 0;
    END IF;
END //
DELIMITER ;


/*Testar*/
SELECT fn_verificar_classe_tem_personagens(3);


/*
ATIVIDADE 01
Crie um banco de dados para um serviço de um Games Online. 
O nome do Banco de dados deverá ter o seguinte nome db_generation_game_online. 
O sistema trabalhará com as informações dos personagens do jogo. 
O sistema trabalhará com 2 tabelas tb_personagens e tb_classes, 
que deverão estar relacionadas.

Boas Práticas:
a) Crie a tabela tb_classes e determine pelo menos 2 atributos, além da Chave Primária, relevantes para classificar
os personagens do Game Online.

b) Crie a tabela tb_personagens e determine 4 atributos, além da Chave Primária, relevantes aos personagens 
do Game Online.Não esqueça de criar a Foreign Key da tabela tb_classes na tabela tb_personagens.

c) Insira 5 registros na tabela tb_classes.

d) Insira 8 registros na tabela tb_personagens, preenchendo a Chave Estrangeira para criar a relação 
com a tabela tb_classes.

e) Faça um SELECT que retorne todes os personagens cujo poder de ataque seja maior do que 2000.

f) Faça um SELECT que retorne todes os personagens cujo poder de defesa esteja no intervalo 1000 e 2000.

g) Faça um SELECT utilizando o operador LIKE, buscando todes os personagens que possuam a letra C no atributo nome.

h) Faça um SELECT utilizando a cláusula INNER JOIN, unindo os dados da tabela tb_personagens 
com os dados da tabela tb_classes.

i) Faça um SELECT utilizando a cláusula INNER JOIN, unindo os dados da tabela tb_personagens 
com os dados da tabela tb_classes, onde traga apenas os personagens que pertençam a uma classe específica 
(Exemplo: Todes os personagens da classe dos arqueiros).

Salve todas as queries para cada um dos requisitos do exercício em um único script (arquivo .SQL) e 
coloque no seu Github pessoal, no repositório que você criou sobre Banco de dados.
*/
DROP DATABASE IF EXISTS db_generation_game_online;
CREATE DATABASE IF NOT EXISTS db_generation_game_online;
USE db_generation_game_online;

CREATE TABLE tb_classes
(
    id        INT          NOT NULL AUTO_INCREMENT,
    nome      VARCHAR(100) NOT NULL,
    descricao VARCHAR(100) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE tb_personagens
(
    id           INT          NOT NULL AUTO_INCREMENT,
    nome         VARCHAR(100) NOT NULL,
    poder_ataque INT          NOT NULL,
    poder_defesa INT          NOT NULL,
    id_classe    INT          NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (id_classe) REFERENCES tb_classes (id)
);

INSERT INTO tb_classes (nome, descricao)
VALUES ('Arqueiro', 'Classe de personagens que atacam a distância'),
       ('Mago', 'Classe de personagens que atacam com magia'),
       ('Guerreiro', 'Classe de personagens que atacam com espadas'),
       ('Lutador', 'Classe de personagens que atacam com socos e chutes'),
       ('Cavaleiro', 'Classe de personagens que atacam com lanças');

INSERT INTO tb_personagens (nome,
                            poder_ataque,
                            poder_defesa,
                            id_classe)
VALUES ('Arqueiro1', 3000, 1000, 1),
       ('Arqueiro2', 4000, 1200, 1),
       ('Arqueiro3', 5000, 1400, 1);

INSERT INTO tb_personagens (nome,
                            poder_ataque,
                            poder_defesa,
                            id_classe)
VALUES ('Mago1', 2000, 500, 2),
       ('Mago2', 3000, 700, 2),
       ('Mago3', 4000, 800, 2);

INSERT INTO tb_personagens (nome,
                            poder_ataque,
                            poder_defesa,
                            id_classe)
VALUES ('Guerreiro1', 1000, 2200, 3),
       ('Guerreiro2', 2000, 2400, 3),
       ('Guerreiro3', 3000, 2800, 3);

INSERT INTO tb_personagens (nome,
                            poder_ataque,
                            poder_defesa,
                            id_classe)
VALUES ('Cavaleiro1', 1000, 2300, 5),
       ('Cavaleiro2', 2000, 2600, 5),
       ('Cavaleiro3', 3000, 2900, 5);

INSERT INTO tb_personagens (nome,
                            poder_ataque,
                            poder_defesa,
                            id_classe)
VALUES ('Lutador1', 2000, 1000, 4),
       ('Lutador2', 3000, 1300, 4),
       ('Lutador3', 4000, 1600, 4);

SELECT *
FROM tb_personagens
WHERE poder_ataque > 2000;

SELECT *
FROM tb_personagens
WHERE poder_defesa BETWEEN 1000 AND 2000;

SELECT *
FROM tb_personagens
WHERE nome LIKE '%C%';

SELECT *
FROM tb_personagens
         INNER JOIN tb_classes ON tb_personagens.id_classe = tb_classes.id;

SELECT *
FROM tb_personagens
         INNER JOIN tb_classes ON tb_personagens.id_classe = tb_classes.id
WHERE tb_classes.nome = 'Arqueiro';
/*=================================================================================================================================================================================================================================================================*/
/*
Atividade 2
Crie um banco de dados para um serviço de uma Pizzaria. 
O nome do Banco de dados deverá ter o seguinte nome db_pizzaria_legal. 
O sistema trabalhará com as informações dos produtos comercializados pela empresa. 
O sistema trabalhará com 2 tabelas tb_pizzas e tb_categorias, que deverão estar relacionadas.

Boas Práticas:
a) Crie a tabela tb_categorias e determine pelo menos 2 atributos, além da Chave Primária, relevantes para 
classificar as pizzas.

b) Crie a tabela tb_pizzas e determine 4 atributos, além da Chave Primária, relevantes aos produtos da pizzaria.
Não esqueça de criar a Foreign Key da tabela tb_categorias na tabela tb_pizzas.

c) Insira 5 registros na tabela tb_categorias.

d) Insira 8 registros na tabela tb_pizzas, preenchendo a Chave Estrangeira para criar a relação com a 
tabela tb_categorias.

e) Faça um SELECT que retorne todas as pizzas cujo valor seja maior do que R$ 45,00.

f) Faça um SELECT que retorne todas as pizzas cujo valor esteja no intervalo R$ 50,00 e R$ 100,00.

h) Faça um SELECT utilizando o operador LIKE, buscando todas as pizzas que possuam a letra M no atributo nome.

i) Faça um SELECT utilizando a cláusula INNER JOIN, unindo os dados da tabela tb_pizzas com os dados da 
tabela tb_categorias.
j) Faça um SELECT utilizando a cláusula INNER JOIN, unindo os dados da tabela tb_pizzas com os dados da tabela 
tb_categorias, onde traga apenas as pizzas que pertençam a uma categoria específica 
(Exemplo: Todas as pizzas que são doce).

Salve todas as queries para cada um dos requisitos do exercício em um único script (arquivo .SQL) e 
coloque no seu Github pessoal, no repositório que você criou sobre Banco de dados.
*/
DROP DATABASE IF EXISTS db_pizzaria_legal;
CREATE DATABASE IF NOT EXISTS db_pizzaria_legal;
USE db_pizzaria_legal;

CREATE TABLE tb_categorias
(
    id        INT          NOT NULL AUTO_INCREMENT,
    nome      VARCHAR(100) NOT NULL,
    descricao VARCHAR(100) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE tb_pizzas
(
    id           INT            NOT NULL AUTO_INCREMENT,
    nome         VARCHAR(100)   NOT NULL,
    valor        DECIMAL(10, 2) NOT NULL,
    ingredientes VARCHAR(100)   NOT NULL,
    id_categoria INT            NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (id_categoria) REFERENCES tb_categorias (id)
);

INSERT INTO tb_categorias (nome, descricao)
VALUES ('Salgada', 'Pizzas salgadas'),
       ('Doce', 'Pizzas doces'),
       ('Vegetariana', 'Pizzas vegetarianas'),
       ('Vegana', 'Pizzas veganas'),
       ('Sem glúten', 'Pizzas sem glúten');


INSERT INTO tb_pizzas (nome,
                       valor,
                       ingredientes,
                       id_categoria)
VALUES ('Calabresa', 50.00, 'Calabresa, queijo e molho de tomate', 1),
       ('Mussarela', 45.00, 'Mussarela, queijo e molho de tomate', 1),
       ('Frango com catupiry', 60.00, 'Frango, catupiry, queijo e molho de tomate', 1),
       ('Quatro queijos', 65.00, 'Mussarela, provolone, parmesão e catupiry', 1),
       ('Brigadeiro', 50.00, 'Chocolate, leite condensado e granulado', 2),
       ('Banana com canela', 45.00, 'Banana, canela e leite condensado', 2),
       ('Romeu e Julieta', 55.00, 'Goiabada, queijo e leite condensado', 2),
       ('Chocolate com morango', 60.00, 'Chocolate, morango e leite condensado', 2),
       ('Marguerita', 50.00, 'Mussarela, tomate e manjericão', 3),
       ('Berinjela', 45.00, 'Berinjela, queijo e molho de tomate', 3),
       ('Abobrinha', 55.00, 'Abobrinha, queijo e molho de tomate', 3),
       ('Palmito', 60.00, 'Palmito, queijo e molho de tomate', 3),
       ('Berinjela', 50.00, 'Berinjela, queijo e molho de tomate', 4),
       ('Abobrinha', 45.00, 'Abobrinha, queijo e molho de tomate', 4),
       ('Palmito', 55.00, 'Palmito, queijo e molho de tomate', 4),
       ('Sem glúten', 60.00, 'Sem glúten, queijo e molho de tomate', 5);

SELECT *
FROM tb_pizzas
WHERE valor > 45.00;

SELECT *
FROM tb_pizzas
WHERE valor BETWEEN 50.00 AND 100.00;

SELECT *
FROM tb_pizzas
WHERE nome LIKE '%M%';

SELECT *
FROM tb_pizzas
         INNER JOIN tb_categorias ON tb_pizzas.id_categoria = tb_categorias.id;

SELECT *
FROM tb_pizzas
         INNER JOIN tb_categorias ON tb_pizzas.id_categoria = tb_categorias.id
WHERE tb_categorias.nome = 'Doce';
/*=================================================================================================================================================================================================================================================================*/
/*
Atividade 3
Crie um banco de dados para um serviço de uma Farmácia. 
O nome do Banco de dados deverá ter o seguinte nome db_farmacia_bem_estar. 
O sistema trabalhará com as informações dos produtos comercializados pela empresa. 
O sistema trabalhará com 2 tabelas tb_produtos e tb_categorias, que deverão estar relacionadas.

Boas Práticas:
a) Crie a tabela tb_categorias e determine pelo menos 2 atributos, além da Chave Primária, relevantes para 
classificar os produtos.

b) Crie a tabela tb_produtos e determine 4 atributos, além da Chave Primária, relevantes aos produtos da farmácia.
Não esqueça de criar a Foreign Key da tabela tb_categorias na tabela tb_produtos.

c) Insira 5 registros na tabela tb_categorias.

d) Insira 8 registros na tabela tb_produtos, preenchendo a Chave Estrangeira para criar a relação com a 
tabela tb_categorias.

e) Faça um SELECT que retorne todes os produtos cujo valor seja maior do que R$ 50,00.

f) Faça um SELECT que retorne todes os produtos cujo valor esteja no intervalo R$ 5,00 e R$ 60,00.

g) Faça um SELECT utilizando o operador LIKE, buscando todes os produtos que possuam a letra C no atributo nome.

h) Faça um SELECT utilizando a cláusula INNER JOIN, unindo os dados da tabela tb_produtos com os dados da 
tabela tb_categorias.

i) Faça um SELECT utilizando a cláusula INNER JOIN, unindo os dados da tabela tb_produtos com os dados da 
tabela tb_categorias, onde traga apenas os produtos que pertençam a uma categoria específica 
(Exemplo: Todes os produtos que pertencem a categoria cosméticos).

Salve todas as queries para cada um dos requisitos do exercício em um único script (arquivo .SQL) e 
coloque no seu Github pessoal, no repositório que você criou sobre Banco de dados.
*/
DROP DATABASE IF EXISTS db_farmacia_bem_estar;
CREATE DATABASE IF NOT EXISTS db_farmacia_bem_estar;
USE db_farmacia_bem_estar;

CREATE TABLE tb_categorias
(
    id        INT          NOT NULL AUTO_INCREMENT,
    nome      VARCHAR(100) NOT NULL,
    descricao VARCHAR(100) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE tb_produtos
(
    id           INT            NOT NULL AUTO_INCREMENT,
    nome         VARCHAR(100)   NOT NULL,
    valor        DECIMAL(10, 2) NOT NULL,
    descricao    VARCHAR(100)   NOT NULL,
    id_categoria INT            NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (id_categoria) REFERENCES tb_categorias (id)
);

INSERT INTO tb_categorias (nome, descricao)
VALUES ('Cosméticos', 'Produtos de beleza'),
       ('Higiene', 'Produtos de higiene pessoal'),
       ('Medicamentos', 'Produtos medicamentosos'),
       ('Suplementos', 'Produtos suplementares');


-- Inserir produtos na tabela tb_produtos
INSERT INTO tb_produtos (nome,
                         valor,
                         descricao,
                         id_categoria)
VALUES ('Produto 1', 19.99, 'Descrição do Produto 1', 1),
       ('Produto 2', 12.49, 'Descrição do Produto 2', 1),
       ('Produto 3', 5.99, 'Descrição do Produto 3', 2),
       ('Produto 4', 7.99, 'Descrição do Produto 4', 2),
       ('Produto 5', 29.99, 'Descrição do Produto 5', 3),
       ('Produto 6', 8.99, 'Descrição do Produto 6', 3),
       ('Produto 7', 15.99, 'Descrição do Produto 7', 4),
       ('Produto 8', 11.49, 'Descrição do Produto 8', 4),
       ('Produto 9', 23.99, 'Descrição do Produto 9', 1),
       ('Produto 10', 9.99, 'Descrição do Produto 10', 1),
       ('Produto 11', 4.99, 'Descrição do Produto 11', 2),
       ('Produto 12', 6.99, 'Descrição do Produto 12', 2),
       ('Produto 13', 25.99, 'Descrição do Produto 13', 3),
       ('Produto 14', 7.49, 'Descrição do Produto 14', 3),
       ('Produto 15', 12.99, 'Descrição do Produto 15', 4),
       ('Produto 16', 10.49, 'Descrição do Produto 16', 4),
       ('Produto 17', 21.99, 'Descrição do Produto 17', 1),
       ('Produto 18', 14.99, 'Descrição do Produto 18', 1),
       ('Produto 19', 3.99, 'Descrição do Produto 19', 2),
       ('Produto 20', 9.49, 'Descrição do Produto 20', 2);

SELECT *
FROM tb_produtos
WHERE valor > 50.00;

SELECT *
FROM tb_produtos
WHERE valor BETWEEN 5.00 AND 60.00;

SELECT *
FROM tb_produtos
WHERE nome LIKE '%C%';

SELECT *
FROM tb_produtos
         INNER JOIN tb_categorias ON tb_produtos.id_categoria = tb_categorias.id;

SELECT *
FROM tb_produtos
         INNER JOIN tb_categorias ON tb_produtos.id_categoria = tb_categorias.id
WHERE tb_categorias.nome = 'Cosméticos';
/*=================================================================================================================================================================================================================================================================*/
/*
Atividade 4

Crie um banco de dados para um serviço de um Açougue ou de um Hortifruti. 
O nome do Banco de dados deverá ter o seguinte:
nome db_cidade_das_carnes 
ou 
cidade_dos_vegetais. 
O sistema trabalhará com as informações dos produtos comercializados pela empresa. 
O sistema trabalhará com 2 tabelas tb_produtos e tb_categorias, 
que deverão estar relacionadas.

Boas Práticas:
a) Crie a tabela tb_categorias e determine pelo menos 2 atributos, além da Chave Primária, relevantes para 
classificar os produtos.

b) Crie a tabela tb_produtos e determine 4 atributos, além da Chave Primária, relevantes aos produtos da farmácia.
Não esqueça de criar a Foreign Key da tabela tb_categorias na tabela tb_produtos.

c) Insira 5 registros na tabela tb_categorias.

d) Insira 8 registros na tabela tb_produtos, preenchendo a Chave Estrangeira para criar a relação 
com a tabela tb_categorias.

e) Faça um SELECT que retorne todes os produtos cujo valor seja maior do que R$ 50,00.

f) Faça um SELECT que retorne todes os produtos cujo valor esteja no intervalo R$ 50,00 e R$ 150,00.

g) Faça um SELECT utilizando o operador LIKE, buscando todes os produtos que possuam a letra C no atributo nome.

h) Faça um SELECT utilizando a cláusula INNER JOIN, unindo os dados da tabela tb_produtos com os dados da 
tabela tb_categorias.

i) Faça um SELECT utilizando a cláusula INNER JOIN, unindo os dados da tabela tb_produtos com os dados da 
tabela tb_categorias, onde traga apenas os produtos que pertençam a uma categoria específica 
(Exemplo: Todes os produtos que pertencem a categoria aves ou frutas).

Salve todas as queries para cada um dos requisitos do exercício em um único script (arquivo .SQL) e 
coloque no seu Github pessoal, no repositório que você criou sobre Banco de dados.
*/
DROP DATABASE IF EXISTS db_cidade_das_carnes;
CREATE DATABASE IF NOT EXISTS db_cidade_das_carnes;
USE db_cidade_das_carnes;

CREATE TABLE tb_categorias
(
    id        INT          NOT NULL AUTO_INCREMENT,
    nome      VARCHAR(100) NOT NULL,
    descricao VARCHAR(100) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE tb_produtos
(
    id           INT            NOT NULL AUTO_INCREMENT,
    nome         VARCHAR(100)   NOT NULL,
    valor        DECIMAL(10, 2) NOT NULL,
    descricao    VARCHAR(100)   NOT NULL,
    id_categoria INT            NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (id_categoria) REFERENCES tb_categorias (id)
);

INSERT INTO tb_categorias (nome, descricao)
VALUES ('Aves', 'Produtos de aves'),
       ('Bovinos', 'Produtos de bovinos'),
       ('Suínos', 'Produtos de suínos'),
       ('Frutas', 'Produtos de frutas'),
       ('Legumes', 'Produtos de legumes');

-- Inserir produtos na tabela tb_produtos
INSERT INTO tb_produtos (nome,
                         valor,
                         descricao,
                         id_categoria)
VALUES ('Peito de Frango', 9.99, 'Peito de frango sem pele e osso', 1),
       ('Coxa de Frango', 7.49, 'Coxa de frango fresca', 1),
       ('Alcatra Bovina', 15.99, 'Corte de alcatra bovina de alta qualidade', 2),
       ('Picanha Bovina', 21.49, 'Picanha suculenta e macia', 2),
       ('Lombo Suíno', 12.99, 'Lombo de porco para assados', 3),
       ('Costela Suína', 9.99, 'Costela suína para churrasco', 3),
       ('Maçãs', 2.49, 'Maçãs frescas e crocantes', 4),
       ('Bananas', 1.99, 'Bananas maduras e saborosas', 4),
       ('Cenouras', 0.99, 'Cenouras orgânicas', 5),
       ('Batatas', 1.29, 'Batatas de qualidade para cozimento', 5),
       ('Filé de Frango', 11.99, 'Filé de peito de frango desossado', 1),
       ('Contrafilé Bovino', 17.99, 'Contrafilé bovino bem marmorizado', 2),
       ('Linguiça Suína', 8.99, 'Linguiça suína temperada para churrasco', 3),
       ('Uvas', 3.99, 'Uvas frescas e doces', 4),
       ('Brócolis', 1.49, 'Brócolis verde e saudável', 5),
       ('Salsicha de Frango', 6.49, 'Salsichas de frango para hot dog', 1),
       ('Pernil Suíno', 10.99, 'Pernil de porco para assados', 3),
       ('Abacaxi', 2.99, 'Abacaxi maduro e suculento', 4),
       ('Couve-Flor', 1.99, 'Couve-flor branca e fresca', 5),
       ('Bisteca Bovina', 13.99, 'Bisteca bovina para grelhados', 2);

SELECT *
FROM tb_produtos
WHERE valor > 50.00;

SELECT *
FROM tb_produtos
WHERE valor BETWEEN 50.00 AND 150.00;

SELECT *
FROM tb_produtos
WHERE nome LIKE '%C%';

SELECT *
FROM tb_produtos
         INNER JOIN tb_categorias ON tb_produtos.id_categoria = tb_categorias.id;

SELECT *
FROM tb_produtos
         INNER JOIN tb_categorias ON tb_produtos.id_categoria = tb_categorias.id
WHERE tb_categorias.nome = 'Aves'
   OR tb_categorias.nome = 'Frutas';

/*=================================================================================================================================================================================================================================================================*/
/*
Atividade 5
Crie um banco de dados para um serviço de uma loja de Material de Construção. 
O nome do Banco de dados deverá ter o seguinte nome db_construindo_vidas. 
O sistema trabalhará com as informações dos produtos comercializados pela empresa. 
O sistema trabalhará com 2 tabelas tb_produtos e tb_categorias, 
que deverão estar relacionadas.

Boas Práticas:
a) Crie a tabela tb_categorias e determine pelo menos 2 atributos, além da Chave Primária, relevantes para 
classificar os produtos.

b) Crie a tabela tb_produtos e determine 4 atributos, além da Chave Primária, relevantes aos produtos da farmácia. 
Não esqueça de criar a Foreign Key da tabela tb_categorias na tabela tb_produtos.

c) Insira 5 registros na tabela tb_categorias.

d) Insira 8 registros na tabela tb_produtos, preenchendo a Chave Estrangeira para criar a relação com a tabela 
tb_categorias.
e) Faça um SELECT que retorne todes os produtos cujo valor seja maior do que R$ 100,00.

f) Faça um SELECT que retorne todes os produtos cujo valor esteja no intervalo R$ 70,00 e R$ 150,00.

g) Faça um SELECT utilizando o operador LIKE, buscando todes os produtos que possuam a letra C no atributo nome.

h) Faça um SELECT utilizando a cláusula INNER JOIN, unindo os dados da tabela tb_produtos com os dados da 
tabela tb_categorias.

i) Faça um SELECT utilizando a cláusula INNER JOIN, unindo os dados da tabela tb_produtos com os dados da 
tabela tb_categorias, onde traga apenas os produtos que pertençam a uma categoria específica 
(Exemplo: Todes os produtos que pertencem a categoria hidráulica).

Salve todas as queries para cada um dos requisitos do exercício em um único script (arquivo .SQL) e 
coloque no seu Github pessoal, no repositório que você criou sobre Banco de dados.
*/
DROP DATABASE IF EXISTS db_construindo_vidas;
CREATE DATABASE IF NOT EXISTS db_construindo_vidas;
USE db_construindo_vidas;

CREATE TABLE tb_categorias
(
    id        INT          NOT NULL AUTO_INCREMENT,
    nome      VARCHAR(100) NOT NULL,
    descricao VARCHAR(100) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE tb_produtos
(
    id           INT            NOT NULL AUTO_INCREMENT,
    nome         VARCHAR(100)   NOT NULL,
    valor        DECIMAL(10, 2) NOT NULL,
    descricao    VARCHAR(100)   NOT NULL,
    id_categoria INT            NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (id_categoria) REFERENCES tb_categorias (id)
);

INSERT INTO tb_categorias (nome, descricao)
VALUES ('Hidráulica', 'Produtos hidráulicos'),
       ('Elétrica', 'Produtos elétricos'),
       ('Ferramentas', 'Produtos ferramentais'),
       ('Pisos', 'Produtos de pisos'),
       ('Tintas', 'Produtos de tintas');

-- Inserir produtos na tabela tb_produtos
INSERT INTO tb_produtos (nome, valor, descricao, id_categoria)
VALUES ('Chave de Grifo', 45.99, 'Chave ajustável para trabalhos hidráulicos', 1),
       ('Disjuntor 20A', 12.49, 'Disjuntor unipolar para proteção elétrica', 2),
       ('Martelo de Garra', 18.99, 'Martelo para trabalhos de carpintaria', 3),
       ('Piso Laminado Carvalho', 29.99, 'Piso laminado de madeira artificial', 4),
       ('Tinta Acrílica Branca', 24.49, 'Tinta à base de água para paredes internas', 5),
       ('Chave Inglesa', 39.99, 'Chave ajustável para múltiplas medidas', 1),
       ('Interruptor Simples', 6.99, 'Interruptor simples para instalações elétricas', 2),
       ('Furadeira de Impacto', 129.99, 'Furadeira potente para perfurações diversas', 3),
       ('Piso Cerâmico Bege', 19.99, 'Piso cerâmico de alta resistência', 4),
       ('Tinta Esmalte Preto Fosco', 17.49, 'Tinta esmalte para metais e madeira', 5),
       ('Chave de Boca', 29.99, 'Chave fixa para apertos precisos', 1),
       ('Tomada Dupla', 8.49, 'Tomada elétrica dupla para ambientes internos', 2),
       ('Serrote de Poda', 22.99, 'Serrote para trabalhos de poda de galhos', 3),
       ('Piso Vinílico Marrom', 25.99, 'Piso vinílico de fácil instalação', 4),
       ('Tinta Spray Prata', 7.99, 'Tinta spray de secagem rápida', 5),
       ('Chave de Fenda Conjunto', 19.99, 'Conjunto de chaves de fenda variadas', 1),
       ('Caixa de Distribuição', 35.49, 'Caixa de distribuição elétrica com disjuntores', 2),
       ('Trena 5 Metros', 11.99, 'Trena para medições precisas', 3),
       ('Piso Porcelanato Branco', 32.99, 'Piso porcelanato de alta qualidade', 4),
       ('Tinta Epóxi Cinza', 42.99, 'Tinta epóxi para pisos industriais', 5);

SELECT *
FROM tb_produtos
WHERE valor > 100.00;

SELECT *
FROM tb_produtos
WHERE valor BETWEEN 70.00 AND 150.00;

SELECT *
FROM tb_produtos
WHERE nome LIKE '%C%';

SELECT *
FROM tb_produtos
         INNER JOIN tb_categorias ON tb_produtos.id_categoria = tb_categorias.id;

SELECT *
FROM tb_produtos
         INNER JOIN tb_categorias ON tb_produtos.id_categoria = tb_categorias.id
WHERE tb_categorias.nome = 'Hidráulica';


/*=================================================================================================================================================================================================================================================================*/
/*
Atividade 6
Crie um banco de dados para uma plataforma de Cursos Online (EAD). 
O nome do Banco de dados deverá ter o seguinte nome db_curso_da_minha_vida. 
O sistema trabalhará com as informações dos produtos comercializados pela empresa. 
O sistema trabalhará com 2 tabelas tb_cursos e tb_categorias, 
que deverão estar relacionadas.

Boas Práticas:
a) Crie a tabela tb_categorias e determine pelo menos 2 atributos, além da Chave Primária, relevantes para 
classificar os produtos.

b) Crie a tabela tb_cursos e determine 4 atributos, além da Chave Primária, relevantes aos produtos da farmácia.
Não esqueça de criar a Foreign Key da tabela tb_categorias na tabela tb_cursos.

c) Insira 5 registros na tabela tb_categorias.

d) Insira 8 registros na tabela tb_cursos, preenchendo a Chave Estrangeira para criar a relação com a 
tabela tb_categorias.

e) Faça um SELECT que retorne todes os cursos cujo valor seja maior do que R$ 500,00.

f) Faça um SELECT que retorne todes os cursos cujo valor esteja no intervalo R$ 600,00 e R$ 1000,00.

g) Faça um SELECT utilizando o operador LIKE, buscando todes os cursos que possuam a letra J no atributo nome.

h) Faça um SELECT utilizando a cláusula INNER JOIN, unindo os dados da tabela tb_cursos com os dados da 
tabela tb_categorias.

i) Faça um SELECT utilizando a cláusula INNER JOIN, unindo os dados da tabela tb_cursos com os dados da 
tabela tb_categorias, onde traga apenas os produtos que pertençam a uma categoria específica 
Exemplo: Todes os cursos que pertencem a categoria Java).

Salve todas as queries para cada um dos requisitos do exercício em um único script (arquivo .SQL) e 
coloque no seu Github pessoal, no repositório que você criou sobre Banco de dados.
*/
DROP DATABASE IF EXISTS db_curso_da_minha_vida;
CREATE DATABASE IF NOT EXISTS db_curso_da_minha_vida;
USE db_curso_da_minha_vida;

CREATE TABLE tb_categorias
(
    id        INT          NOT NULL AUTO_INCREMENT,
    nome      VARCHAR(100) NOT NULL,
    descricao VARCHAR(100) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE tb_cursos
(
    id           INT            NOT NULL AUTO_INCREMENT,
    nome         VARCHAR(100)   NOT NULL,
    valor        DECIMAL(10, 2) NOT NULL,
    descricao    VARCHAR(100)   NOT NULL,
    id_categoria INT            NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (id_categoria) REFERENCES tb_categorias (id)
);

INSERT INTO tb_categorias (nome, descricao)
VALUES ('Programação', 'Cursos de programação'),
       ('Design', 'Cursos de design'),
       ('Marketing', 'Cursos de marketing'),
       ('Finanças', 'Cursos de finanças'),
       ('Idiomas', 'Cursos de idiomas');


-- Inserir cursos na tabela tb_cursos
INSERT INTO tb_cursos (nome, valor, descricao, id_categoria)
VALUES ('Introdução à Programação em Python', 49.99, 'Aprenda os conceitos básicos de programação usando Python', 1),
       ('Design de Logotipos Profissionais', 29.99, 'Crie logotipos impressionantes usando ferramentas de design', 2),
       ('Marketing Digital para Iniciantes', 39.99, 'Explore estratégias de marketing online', 3),
       ('Fundamentos de Contabilidade', 59.99, 'Compreenda os princípios contábeis básicos', 4),
       ('Inglês para Viagens', 19.99, 'Aprenda o básico do inglês para suas viagens', 5),
       ('Desenvolvimento Web com HTML e CSS', 69.99, 'Crie websites usando HTML e CSS', 1),
       ('Design de Interfaces para Aplicativos', 49.99, 'Crie interfaces atraentes para aplicativos móveis', 2),
       ('Estratégias Avançadas de Marketing de Conteúdo', 79.99, 'Aprofunde-se nas táticas de marketing de conteúdo',
        3),
       ('Gestão Financeira Pessoal', 59.99, 'Aprenda a gerenciar suas finanças de forma eficaz', 4),
       ('Espanhol para Negócios', 24.99, 'Desenvolva suas habilidades de espanhol no contexto empresarial', 5),
       ('Desenvolvimento Avançado em JavaScript', 89.99, 'Explore recursos avançados do JavaScript', 1),
       ('Design de Experiência do Usuário (UX)', 59.99, 'Crie experiências de usuário excepcionais', 2),
       ('SEO: Otimização de Sites para Mecanismos de Busca', 49.99,
        'Melhore a visibilidade do seu site nos mecanismos de busca', 3),
       ('Investindo no Mercado de Ações', 79.99, 'Aprenda sobre investimento em ações e estratégias', 4),
       ('Francês Intermediário', 29.99, 'Aperfeiçoe suas habilidades em francês', 5),
       ('Desenvolvimento de Aplicativos Android com Kotlin', 79.99,
        'Crie aplicativos Android usando a linguagem Kotlin', 1),
       ('Ilustração Digital com Photoshop', 44.99, 'Crie ilustrações digitais incríveis com o Photoshop', 2),
       ('Redes Sociais para Negócios', 34.99, 'Utilize as redes sociais de forma eficaz para o seu negócio', 3),
       ('Planejamento Financeiro para o Futuro', 69.99, 'Desenvolva um plano financeiro sólido para o longo prazo', 4),
       ('Japonês Básico', 22.99, 'Aprenda o básico do japonês para comunicação cotidiana', 5),
       ('Desenvolvimento de Jogos com Unity', 99.99, 'Crie jogos empolgantes usando a plataforma Unity', 1);

SELECT *
FROM tb_cursos
WHERE valor > 500.00;

SELECT *
FROM tb_cursos
WHERE valor BETWEEN 600.00 AND 1000.00;

SELECT *
FROM tb_cursos
WHERE nome LIKE '%J%';

SELECT *
FROM tb_cursos
         INNER JOIN tb_categorias ON tb_cursos.id_categoria = tb_categorias.id;

SELECT *
FROM tb_cursos
         INNER JOIN tb_categorias ON tb_cursos.id_categoria = tb_categorias.id
WHERE tb_categorias.nome = 'Programação';