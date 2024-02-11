CREATE TABLE tb_conta
(
    id    SERIAL,
    saldo DECIMAL(10, 2) NOT NULL DEFAULT 0.00,

    PRIMARY KEY (id)
);

INSERT INTO tb_conta (saldo) VALUES (0.00);
INSERT INTO tb_conta (saldo) VALUES (100.00);

CREATE TABLE tb_transacao
(
    id        SERIAL,
    conta_id  INTEGER        NOT NULL,
    tipo      VARCHAR(50)    NOT NULL CHECK (tipo IN ('deposito', 'saque')),
    valor     DECIMAL(10, 2) NOT NULL,
    data_hora TIMESTAMP      NOT NULL DEFAULT CURRENT_TIMESTAMP,

    PRIMARY KEY (id),
    FOREIGN KEY (conta_id) REFERENCES tb_conta (id)
);

DROP FUNCTION IF EXISTS atualizar_saldo() CASCADE;
CREATE OR REPLACE FUNCTION atualizar_saldo() RETURNS TRIGGER AS $$
BEGIN
    IF NEW.tipo = 'deposito' THEN
        UPDATE tb_conta SET saldo = saldo + NEW.valor WHERE id = NEW.conta_id;
    ELSIF NEW.tipo = 'saque' THEN
        UPDATE tb_conta SET saldo = saldo - NEW.valor WHERE id = NEW.conta_id;
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;


CREATE TRIGGER transacao_trigger
AFTER INSERT ON tb_transacao
FOR EACH ROW EXECUTE PROCEDURE atualizar_saldo();


INSERT INTO tb_transacao (conta_id, tipo, valor) VALUES (1, 'deposito', 100.00);
INSERT INTO tb_transacao (conta_id, tipo, valor) VALUES (1, 'saque', 50.00);
SELECT saldo FROM tb_conta WHERE id = 1;

SELECT * FROM tb_transacao;