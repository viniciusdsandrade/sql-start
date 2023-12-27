DROP TRIGGER IF EXISTS Trg_AfterUpdate;
DROP TABLE IF EXISTS LogAlteracoes;
DROP TABLE IF EXISTS tb_produtos;

CREATE TABLE tb_produtos
(
    ID    INT PRIMARY KEY,
    Nome  NVARCHAR(100),
    Preco DECIMAL(10, 2)
);

-- Criação da Tabela de Log de Alterações
CREATE TABLE LogAlteracoes
(
    LogID         INT PRIMARY KEY IDENTITY,
    IDProduto     INT,
    NomeAntigo    NVARCHAR(100),
    NomeNovo      NVARCHAR(100),
    PrecoAntigo   DECIMAL(10, 2),
    PrecoNovo     DECIMAL(10, 2),
    DataAlteracao DATETIME
);

INSERT INTO tb_produtos (ID, Nome, Preco)
VALUES (1, 'Smartphone Samsung Galaxy S21', 799.99),
       (2, 'Laptop Dell Inspiron 15', 1299.99),
       (3, 'Smart TV LG 55" 4K', 699.99),
       (4, 'Console de Videogame PlayStation 5', 499.99),
       (5, 'Fones de Ouvido Sony WH-1000XM4', 349.99),
       (6, 'Câmera Mirrorless Canon EOS M50', 599.99),
       (7, 'Tablet Apple iPad Pro', 899.99),
       (8, 'Impressora HP LaserJet Pro', 199.99),
       (9, 'Aspirador de Pó Robô iRobot Roomba', 299.99),
       (10, 'Smartwatch Apple Watch Series 7', 399.99);

-- Criação do Trigger AFTER UPDATE
CREATE TRIGGER Trg_AfterUpdate
    ON tb_produtos
    AFTER UPDATE
    AS
BEGIN
    -- Insere registros na tabela de Log de Alterações
    INSERT INTO LogAlteracoes (IDProduto, NomeAntigo, NomeNovo, PrecoAntigo, PrecoNovo, DataAlteracao)
    -- Seleciona dados antigos (deleted) e novos (inserted) para cada registro alterado
    SELECT d.ID,
           d.Nome,
           i.Nome,
           d.Preco,
           i.Preco,
           GETDATE()
    FROM inserted i
             INNER JOIN deleted d
                        ON i.ID = d.ID;
END;

-- Atualização do preço do Smartphone Samsung Galaxy S21
    UPDATE tb_produtos
    SET Preco = 899.99
    WHERE ID = 1;


-- Atualização do nome do Laptop Dell Inspiron 15
    UPDATE tb_produtos
    SET Nome = 'Laptop Dell Inspiron 17'
    WHERE ID = 2;


-- Atualização do preço e nome da Smart TV LG 55" 4K
    UPDATE tb_produtos
    SET Nome  = 'Smart TV LG 65" 4K',
        Preco = 999.99
    WHERE ID = 3;


-- Verificar os dados na tabela de Log de Alterações
    SELECT *
    FROM LogAlteracoes;

    SELECT *
    FROM tb_produtos;