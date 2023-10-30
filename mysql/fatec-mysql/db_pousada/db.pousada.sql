#DROP DATABASE IF EXISTS db_pousada;
CREATE DATABASE IF NOT EXISTS db_pousada;
USE db_pousada;
---------------------------------------------------------------------------------------------------------------
#Tabelas da pousada
SELECT * FROM tiposQuarto;
SELECT * FROM enderecoPousada;
SELECT * FROM nacionalidades;
SELECT * FROM comodidades;
SELECT * FROM quartos;
SELECT * FROM quartoComodidades;
SELECT * FROM cargosFuncionarios;
SELECT * FROM funcionarios;
SELECT * FROM statusPagamento;
SELECT * FROM metodosPagamento;
SELECT * FROM pagamentos;
SELECT * FROM hospedes;
SELECT * FROM reservas;
----------------------------------------------------------------------------------------------------------------
#1 Quantas dados há em cada uma das tabelas 
SELECT COUNT(*) as ' Quantidade de tipos de quartos da pousada' FROM tiposQuarto;
<<<<<<< HEAD
SELECT COUNT(capacidade) as "Quantidade de tipos de quartos da pousada" from tiposQuarto;
SELECT SUM(capacidade) as "ocupacao total" from tiposQuarto;
=======
>>>>>>> 8c5f6e30abc15e8b67b612136868692447bf1f0c
SELECT COUNT(*) as ' Quantidade de endereços registrados' FROM enderecoPousada;
SELECT COUNT(*) as ' Quantidades de nacionalidades registradas' FROM nacionalidades;
SELECT COUNT(*) as ' Quantidade de comodidades da pousada'  FROM comodidades;
SELECT COUNT(*) as ' Numero de quartos' FROM quartos;
SELECT COUNT(*) as ' Quantidade de cargos na pousada' FROM cargosFuncionarios;
SELECT COUNT(*) as ' Quantidade de funcionarios' FROM funcionarios;
SELECT COUNT(*) as ' Quantidade de status de Pagamento' FROM statusPagamento;
SELECT COUNT(*) as ' Quantidade de métodos de pagament o' FROM metodosPagamento;
SELECT COUNT(*) as ' Quantidade de pagamentos' FROM pagamentos;
SELECT COUNT(*) as ' Quantidade de hospedes' FROM hospedes;
SELECT COUNT(*) as '  Quantidade de reservas' FROM reservas;

#2 - Preço médio da diária
SELECT AVG(preco)  as "Preço médio da diária" FROM quartos;

#3 - Preço médio da diária por tipo de quarto
SELECT tp.tipo AS "Tipo de Quarto" , AVG(q.preco) AS "Preço Médio"
FROM tiposQuarto AS tp
<<<<<<< HEAD
INNER JOIN quartos AS q ON tp.id_tipo_quarto = q.id_tipo_quarto
=======
LEFT JOIN quartos AS q ON tp.id_tipo_quarto = q.id_tipo_quarto
>>>>>>> 8c5f6e30abc15e8b67b612136868692447bf1f0c
GROUP BY tp.id_tipo_quarto, tp.tipo;

#4 - Numero de reservas por tipo de quarto
SELECT t.tipo AS "Tipo de Quarto" , COUNT(*) AS "Reservas"
FROM reservas AS r
INNER JOIN quartos AS q ON r.id_quarto = q.id_quarto
INNER JOIN tiposQuarto AS t ON q.id_tipo_quarto = t.id_tipo_quarto
GROUP BY t.tipo;

#5 - Comodidades mais populares
SELECT c.nome AS "Comodidades", COUNT(*) AS "Escolhidos"
FROM quartoComodidades AS qc
JOIN comodidades AS c ON qc.id_comodidade = c.id_comodidade
GROUP BY c.nome
ORDER BY "Reservas" DESC;

#6 - Salário médio por cargo dos funcionários da pousada
<<<<<<< HEAD
SELECT cf.nome_cargo AS "Cargo", CONCAT('R$', FORMAT(AVG(f.salario), 2, 'de_DE')) AS "Salário Médio"
FROM funcionarios AS f
INNER JOIN cargosFuncionarios AS cf ON f.id_cargo = cf.id_cargo
=======
SELECT cf.nome_cargo AS "Cargo", AVG(f.salario) AS "Salário Médio"
FROM funcionarios AS f
JOIN cargosFuncionarios AS cf ON f.id_cargo = cf.id_cargo
>>>>>>> 8c5f6e30abc15e8b67b612136868692447bf1f0c
GROUP BY cf.nome_cargo
ORDER BY AVG(f.salario) DESC;

#7 - Quantidade de funcionários por cargo
SELECT c.nome_cargo AS "Cargo", COUNT(f.id_funcionario) AS "Funcionários"
FROM cargosFuncionarios AS c
JOIN funcionarios AS f ON c.id_cargo = f.id_cargo
GROUP BY c.id_cargo;

#8 - Numero de reservas por Hospede
SELECT h.nome AS "Hóspede", COUNT(*) AS "Reservas"
FROM reservas AS r
INNER JOIN hospedes AS h ON r.id_hospede = h.id_hospede
GROUP BY h.nome;

#9 - Tempo médio de estadia por reserva
SELECT AVG(DATEDIFF(data_saida, data_entrada)) AS "Tempo médio de estadia por reserva em dias"
FROM reservas;

#10 - Método de pagamento utilizados
SELECT m.metodo_pagamento AS "Pagamento", COUNT(p.id_pagamento) AS "Quantidade"
FROM metodosPagamento AS m
JOIN pagamentos AS p ON m.id_metodo_pagamento = p.id_metodo_pagamento
GROUP BY m.id_metodo_pagamento
ORDER BY "Quantidade" DESC;

#11 - Tipo de quarto que cada Hospede optou
SELECT h.nome AS "Hóspede", t.tipo AS "Tipo de quarto"
FROM hospedes AS h
LEFT JOIN reservas AS r ON h.id_hospede = r.id_hospede
JOIN quartos AS q ON r.id_quarto = q.id_quarto
JOIN tiposQuarto AS t ON q.id_tipo_quarto = t.id_tipo_quarto;

#12 - 3 tipos de quarto que tiveram mais procura
SELECT tq.Tipo AS "Modelo de Quarto", COUNT(r.id_quarto) AS "Reservas"
FROM tiposQuarto AS tq
INNER JOIN quartos AS q ON tq.id_tipo_quarto = q.id_tipo_quarto
INNER JOIN reservas AS r ON q.id_quarto = r.id_quarto
GROUP BY tq.id_tipo_quarto
ORDER BY "Reservas" DESC
LIMIT 3;

#12.1 - tipos de quarto que tiveram menos procura
SELECT tq.Tipo AS "Modelo de Quarto", COUNT(r.id_quarto) AS "Reservas"
FROM tiposQuarto AS tq
LEFT JOIN quartos AS q ON tq.id_tipo_quarto = q.id_tipo_quarto
LEFT JOIN reservas AS r ON q.id_quarto = r.id_quarto
GROUP BY tq.id_tipo_quarto
ORDER BY "Reservas" ASC
LIMIT 5;
<<<<<<< HEAD

#13 - Selecione todos os quartos do tipo "Deluxe" com capacidade superior a 3 pessoas.
SELECT * FROM quartos;
SELECT * FROM tiposQuarto;

SELECT q.id_quarto as "id", q.numero_quarto as "Numero Quarto"
FROM quartos AS q 
INNER JOIN tiposQuarto AS tp ON q.id_tipo_quarto = tp.id_tipo_quarto
WHERE tp.capacidade > 1 AND q.id_tipo_quarto = 7
ORDER BY tp.capacidade;

#14 - Encontre o número e o preço de todos os quartos que possuem a comodidade "Wi-Fi".
SELECT * FROM quartos;
SELECT * FROM comodidades;
SELECT * FROM quartoComodidades;

SELECT q.numero_quarto AS "Number", q.preco AS "R$"
FROM quartos AS Q 
INNER JOIN quartoComodidades AS qc ON q.id_quarto = qc.id_quarto
INNER JOIN comodidades AS c ON c.id_comodidade = qc.id_comodidade
WHERE c.nome = "Wi-Fi";

#15 - Obtenha os detalhes de contato de todos os hóspedes cujo nome começa com a letra "A".
SELECT h.nome AS "Nome", h.detalhes_contato AS "Contato"
FROM hospedes AS h
WHERE h.nome LIKE "A%";

#16 - Determine a quantidade de reservas feitas por cada método de pagamento.
SELECT * FROM reservas;
SELECT * FROM pagamentos;
SELECT * FROM metodosPagamento;

SELECT COUNT(id_reserva) AS "Quantidade de Reservas", mp.metodo_pagamento AS "Método Pagamento"
FROM pagamentos AS p
INNER JOIN metodosPagamento AS mp ON mp.id_metodo_pagamento = p.id_metodo_pagamento
INNER JOIN reservas AS r ON r.id_pagamento = p.id_pagamento 
GROUP BY  mp.metodo_pagamento
ORDER BY COUNT(id_reserva) DESC;

#17 - Quais os numeros dos quartosquartos que possuem todas as comodidades disponíveis?
SELECT q.numero_quarto AS "Numero"
FROM quartos AS q 
JOIN quartoComodidades AS qc ON q.id_quarto = qc.id_quarto
JOIN comodidades AS c ON qc.id_comodidade = c.id_comodidade
WHERE NOT EXISTS (
    SELECT id_comodidade AS "id_comodidade"
    FROM comodidades
    WHERE id_comodidade NOT IN (
        SELECT id_comodidade AS "id_comodidade"
        FROM quartoComodidades
        WHERE id_quarto = q.id_quarto
    )
)
GROUP BY q.numero_quarto;

#18 - Quais são os hóspedes que fizeram reservas com pagamento em dinheiro?
SELECT * FROM pagamentos;
SELECT * FROM metodosPagamento;
SELECT * FROM hospedes;
SELECT * FROM reservas;

SELECT h.nome AS 'Hospede', mp.metodo_pagamento AS 'Tipo pagamento'
FROM pagamentos AS p 
INNER JOIN metodosPagamento AS mp ON p.id_metodo_pagamento = mp.id_metodo_pagamento
INNER JOIN reservas AS R on r.id_pagamento = p.id_pagamento
INNER JOIN hospedes AS H ON h.id_hospede = r.id_hospede
WHERE mp.metodo_pagamento = "Dinheiro";
=======
>>>>>>> 8c5f6e30abc15e8b67b612136868692447bf1f0c
----------------------------------------------------------------------------------------------------------------
CREATE TABLE tiposQuarto (
    id_tipo_quarto TINYINT UNSIGNED AUTO_INCREMENT,
    tipo VARCHAR(120) NOT NULL,
    capacidade SMALLINT UNSIGNED NOT NULL,
    
    PRIMARY KEY(id_tipo_quarto),

    INDEX idx_capacidade(capacidade)
);

CREATE TABLE enderecoPousada (
    id_endereco MEDIUMINT UNSIGNED AUTO_INCREMENT NOT NULL,
    CEP VARCHAR(8) NOT NULL,
    numero MEDIUMINT UNSIGNED NOT NULL,
    complemento VARCHAR(60) NULL,
    
    PRIMARY KEY(id_endereco, CEP, numero),
    
    INDEX idx_CEP (CEP)
);

CREATE TABLE nacionalidades (
    id_nacionalidade TINYINT UNSIGNED AUTO_INCREMENT,
    nacionalidade VARCHAR(80) NOT NULL,
    sigla VARCHAR(5) NOT NULL,
    
    PRIMARY KEY(id_nacionalidade),
    
    INDEX idx_nacionalidades_sigla (sigla)
);

CREATE TABLE comodidades (
    id_comodidade TINYINT UNSIGNED AUTO_INCREMENT,
    nome VARCHAR(60) NOT NULL,
    descricao VARCHAR(255),
    preco DECIMAL(10, 2) NOT NULL,
    
    PRIMARY KEY(id_comodidade)
);

CREATE TABLE quartos (
    id_quarto SMALLINT UNSIGNED AUTO_INCREMENT,
    numero_quarto MEDIUMINT UNSIGNED NOT NULL,
    id_tipo_quarto TINYINT UNSIGNED NOT NULL,
    preco DECIMAL(10, 2) NOT NULL,
    
    PRIMARY KEY(id_quarto),
    
    FOREIGN KEY (id_tipo_quarto) REFERENCES tiposQuarto(id_tipo_quarto)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
        
    INDEX idx_quarto_tipo (id_tipo_quarto),
    INDEX idx_numero_tipo (numero_quarto)
);

CREATE TABLE quartoComodidades (
    id_quarto SMALLINT UNSIGNED NOT NULL,
    id_comodidade TINYINT UNSIGNED NOT NULL,
    
    PRIMARY KEY (id_quarto, id_comodidade),
    
    FOREIGN KEY (id_quarto) REFERENCES quartos(id_quarto)
		ON DELETE CASCADE
		ON UPDATE CASCADE,
    FOREIGN KEY (id_comodidade) REFERENCES comodidades(id_comodidade)
		ON DELETE CASCADE
		ON UPDATE CASCADE,
    
    INDEX idx_quartoComodidades_quarto (id_quarto),
    INDEX idx_quartoComodidades_comodidade (id_comodidade)
);

CREATE TABLE cargosFuncionarios (
    id_cargo SMALLINT UNSIGNED AUTO_INCREMENT,
    nome_cargo VARCHAR(120),
        
    PRIMARY KEY(id_cargo),
    
    INDEX idx_nome_cargo (nome_cargo)
);

CREATE TABLE funcionarios (
    id_funcionario SMALLINT UNSIGNED AUTO_INCREMENT,
    id_cargo SMALLINT UNSIGNED NOT NULL,
	nome VARCHAR(255) NOT NULL,
    detalhes_contato VARCHAR(120) NOT NULL,
    salario DECIMAL(10, 2) NOT NULL,
    contratacao DATE NOT NULL,
    demissao DATE NULL,
    
    PRIMARY KEY(id_funcionario),
    
    FOREIGN KEY (id_cargo) REFERENCES cargosFuncionarios(id_cargo)
		ON DELETE CASCADE
		ON UPDATE CASCADE,
    
    INDEX idx_funcionario_cargo (id_cargo),
    INDEX idx_salario(salario)
);

CREATE TABLE statusPagamento (
    id_status_pagamento TINYINT UNSIGNED AUTO_INCREMENT,
    descricao VARCHAR(60),
    
    PRIMARY KEY(id_status_pagamento)
);

CREATE TABLE metodosPagamento (
    id_metodo_pagamento TINYINT UNSIGNED AUTO_INCREMENT,
    metodo_pagamento VARCHAR(60) NOT NULL,
    
    PRIMARY KEY(id_metodo_pagamento)
);

CREATE TABLE pagamentos (
    id_pagamento MEDIUMINT UNSIGNED AUTO_INCREMENT,
    id_status_pagamento TINYINT UNSIGNED NOT NULL,
    id_metodo_pagamento TINYINT UNSIGNED NOT NULL,
    dataPagamento DATE NULL,
    
    PRIMARY KEY(id_pagamento),
    
    FOREIGN KEY (id_status_pagamento) REFERENCES statusPagamento(id_status_pagamento)
		ON DELETE CASCADE
		ON UPDATE CASCADE,
    FOREIGN KEY (id_metodo_pagamento) REFERENCES metodosPagamento(id_metodo_pagamento)
		ON DELETE CASCADE
		ON UPDATE CASCADE,
    
	INDEX idx_pagamento_status (id_status_pagamento),
    INDEX idx_pagamento_metodo (id_metodo_pagamento)
);

CREATE TABLE hospedes (
    id_hospede MEDIUMINT UNSIGNED AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    detalhes_contato VARCHAR(255) NOT NULL,
    id_nacionalidade TINYINT UNSIGNED NOT NULL,
    id_endereco MEDIUMINT UNSIGNED NOT NULL,
    
    PRIMARY KEY(id_hospede),
    
    FOREIGN KEY (id_nacionalidade) REFERENCES nacionalidades(id_nacionalidade)
		ON DELETE CASCADE
		ON UPDATE CASCADE,
    FOREIGN KEY (id_endereco) REFERENCES enderecoPousada(id_endereco)
		ON DELETE CASCADE
		ON UPDATE CASCADE,
    
    INDEX idx_hospede_nacionalidade (id_nacionalidade),
    INDEX idx_hospede_endereco (id_endereco),
    INDEX idx_nome (nome)
);

CREATE TABLE reservas (
    id_reserva INT UNSIGNED AUTO_INCREMENT,
    id_hospede MEDIUMINT UNSIGNED NOT NULL,
    id_quarto SMALLINT UNSIGNED NOT NULL,
	id_funcionario SMALLINT UNSIGNED NOT NULL,
    id_pagamento MEDIUMINT UNSIGNED NOT NULL,
    data_entrada DATE NOT NULL,
    data_saida DATE NOT NULL,
    
    PRIMARY KEY(id_reserva, id_hospede, id_quarto, id_funcionario),
    
    FOREIGN KEY (id_hospede) REFERENCES hospedes(id_hospede)
		ON DELETE CASCADE
		ON UPDATE CASCADE,
    FOREIGN KEY (id_quarto) REFERENCES quartos(id_quarto)
		ON DELETE CASCADE
		ON UPDATE CASCADE,
	FOREIGN KEY (id_funcionario) REFERENCES funcionarios(id_funcionario)
		ON DELETE CASCADE
		ON UPDATE CASCADE,
	FOREIGN KEY (id_pagamento) REFERENCES pagamentos(id_pagamento)
		ON DELETE CASCADE
		ON UPDATE CASCADE,
    
    INDEX idx_reserva_hospede (id_hospede),
    INDEX idx_reserva_quarto (id_quarto),
    INDEX idx_id_funcionario(id_funcionario)
);
----------------------------------------------------------------------------------------------------------
#Povoando as tabelas da pousada
INSERT INTO tiposQuarto (tipo, capacidade) VALUES
    ('Quarto de Solteiro', 1),
    ('Quarto de Casal', 2),
    ('Quarto Duplo', 2),
    ('Suíte', 2),
    ('Quarto Familiar', 4),
    ('Quarto Executivo', 2),
    ('Quarto Deluxe', 2),
    ('Quarto Superior', 2),
    ('Quarto Standard', 2),
    ('Quarto Adaptado', 2);


INSERT INTO enderecoPousada (CEP, numero, complemento) VALUES
('12345678', 10, 'Apartamento 101'),
('23456789', 25, 'Casa 2'),
('34567890', 15, 'Sobrado 3'),
('45678901', 7, 'Bloco A, Apartamento 202'),
('56789012', 30, 'Lote 5, Quadra B'),
('67890123', 12, 'Apartamento 301'),
('78901234', 5, 'Casa 1'),
('89012345', 20, 'Sobrado 2'),
('90123456', 9, 'Bloco B, Apartamento 102'),
('01234567', 35, 'Lote 6, Quadra C'),
('12345678', 18, 'Apartamento 201'),
('23456789', 11, 'Casa 3'),
('34567890', 28, 'Sobrado 4'),
('45678901', 4, 'Bloco A, Apartamento 102'),
('56789012', 22, 'Lote 7, Quadra B'),
('67890123', 14, 'Apartamento 401'),
('78901234', 8, 'Casa 2A'),
('89012345', 24, 'Sobrado 1B'),
('90123456', 11, 'Bloco C, Apartamento 202'),
('01234567', 32, 'Lote 8, Quadra C'),
('12345678', 16, 'Apartamento 302'),
('23456789', 9, 'Casa 4'),
('34567890', 23, 'Sobrado 5'),
('45678901', 6, 'Bloco B, Apartamento 201'),
('56789012', 28, 'Lote 9, Quadra B'),
('67890123', 13, 'Apartamento 302A'),
('78901234', 7, 'Casa 1A'),
('89012345', 21, 'Sobrado 2A'),
('90123456', 10, 'Bloco B, Apartamento 101'),
('01234567', 36, 'Lote 7, Quadra C'),
('12345678', 17, 'Apartamento 303'),
('23456789', 10, 'Casa 5'),
('34567890', 24, 'Sobrado 6'),
('45678901', 5, 'Bloco A, Apartamento 101'),
('56789012', 23, 'Lote 10, Quadra B'),
('67890123', 15, 'Apartamento 402'),
('78901234', 9, 'Casa 2B'),
('89012345', 25, 'Sobrado 1C'),
('90123456', 12, 'Bloco C, Apartamento 201'),
('01234567', 33, 'Lote 9, Quadra C'),
('12345678', 19, 'Apartamento 304'),
('23456789', 12, 'Casa 6'),
('34567890', 29, 'Sobrado 7'),
('45678901', 8, 'Bloco A, Apartamento 301'),
('56789012', 26, 'Lote 11, Quadra B'),
('67890123', 16, 'Apartamento 403'),
('78901234', 10, 'Casa 3A'),
('89012345', 26, 'Sobrado 2B'),
('90123456', 13, 'Bloco B, Apartamento 202'),
('01234567', 34, 'Lote 10, Quadra C');

-- Insert com as nacionalidades e siglas
INSERT INTO nacionalidades (nacionalidade, sigla) VALUES
('Afghan', 'AFG'),
('Albanian', 'ALB'),
('Algerian', 'DZA'),
('American', 'USA'),
('Andorran', 'AND'),
('Angolan', 'AGO'),
('Antiguans', 'ATG'),
('Argentinean', 'ARG'),
('Armenian', 'ARM'),
('Australian', 'AUS'),
('Austrian', 'AUT'),
('Azerbaijani', 'AZE'),
('Bahamian', 'BHS'),
('Bahraini', 'BHR'),
('Bangladeshi', 'BGD'),
('Barbadian', 'BRB'),
('Barbudans', 'ATG'),
('Batswana', 'BWA'),
('Belarusian', 'BLR'),
('Belgian', 'BEL'),
('Belizean', 'BLZ'),
('Beninese', 'BEN'),
('Bhutanese', 'BTN'),
('Bolivian', 'BOL'),
('Bosnian', 'BIH'),
('Brazilian', 'BRA'),
('British', 'GBR'),
('Bruneian', 'BRN'),
('Bulgarian', 'BGR'),
('Burkinabe', 'BFA'),
('Burmese', 'MMR'),
('Burundian', 'BDI'),
('Cambodian', 'KHM'),
('Cameroonian', 'CMR'),
('Canadian', 'CAN'),
('Cape Verdean', 'CPV'),
('Central African', 'CAF'),
('Chadian', 'TCD'),
('Chilean', 'CHL'),
('Chinese', 'CHN'),
('Colombian', 'COL'),
('Comoran', 'COM'),
('Congolese', 'COD'),
('Costa Rican', 'CRI'),
('Croatian', 'HRV'),
('Cuban', 'CUB'),
('Cypriot', 'CYP'),
('Czech', 'CZE'),
('Danish', 'DNK'),
('Djibouti', 'DJI'),
('Dominican', 'DOM'),
('Dutch', 'NLD'),
('East Timorese', 'TLS'),
('Ecuadorean', 'ECU'),
('Egyptian', 'EGY'),
('Emirian', 'ARE'),
('Equatorial Guinean', 'GNQ'),
('Eritrean', 'ERI'),
('Estonian', 'EST'),
('Ethiopian', 'ETH'),
('Fijian', 'FJI'),
('Filipino', 'PHL'),
('Finnish', 'FIN'),
('French', 'FRA'),
('Gabonese', 'GAB'),
('Gambian', 'GMB'),
('Georgian', 'GEO'),
('German', 'DEU'),
('Ghanaian', 'GHA'),
('Greek', 'GRC'),
('Grenadian', 'GRD'),
('Guatemalan', 'GTM'),
('Guinea-Bissauan', 'GNB'),
('Guinean', 'GIN'),
('Guyanese', 'GUY'),
('Haitian', 'HTI'),
('Herzegovinian', 'BIH'),
('Honduran', 'HND'),
('Hungarian', 'HUN'),
('I-Kiribati', 'KIR'),
('Icelander', 'ISL'),
('Indian', 'IND'),
('Indonesian', 'IDN'),
('Iranian', 'IRN'),
('Iraqi', 'IRQ'),
('Irish', 'IRL'),
('Israeli', 'ISR'),
('Italian', 'ITA'),
('Ivorian', 'CIV'),
('Jamaican', 'JAM'),
('Japanese', 'JPN'),
('Jordanian', 'JOR'),
('Kazakhstani', 'KAZ'),
('Kenyan', 'KEN'),
('Kittian and Nevisian', 'KNA'),
('Kuwaiti', 'KWT'),
('Kyrgyz', 'KGZ'),
('Laotian', 'LAO'),
('Latvian', 'LVA'),
('Lebanese', 'LBN'),
('Liberian', 'LBR'),
('Libyan', 'LBY'),
('Liechtensteiner', 'LIE'),
('Lithuanian', 'LTU'),
('Luxembourger', 'LUX'),
('Macedonian', 'MKD'),
('Malagasy', 'MDG'),
('Malawian', 'MWI'),
('Malaysian', 'MYS'),
('Maldivan', 'MDV'),
('Malian', 'MLI'),
('Maltese', 'MLT'),
('Marshallese', 'MHL'),
('Mauritanian', 'MRT'),
('Mauritian', 'MUS'),
('Mexican', 'MEX'),
('Micronesian', 'FSM'),
('Moldovan', 'MDA'),
('Monacan', 'MCO'),
('Mongolian', 'MNG'),
('Moroccan', 'MAR'),
('Mosotho', 'LSO'),
('Motswana', 'BWA'),
('Mozambican', 'MOZ'),
('Namibian', 'NAM'),
('Nauruan', 'NRU'),
('Nepalese', 'NPL'),
('New Zealander', 'NZL'),
('Nicaraguan', 'NIC'),
('Nigerian', 'NGA'),
('Nigerien', 'NER'),
('North Korean', 'PRK'),
('Northern Irish', 'GBR'),
('Norwegian', 'NOR'),
('Omani', 'OMN'),
('Pakistani', 'PAK'),
('Palauan', 'PLW'),
('Panamanian', 'PAN'),
('Papua New Guinean', 'PNG'),
('Paraguayan', 'PRY'),
('Peruvian', 'PER'),
('Polish', 'POL'),
('Portuguese', 'PRT'),
('Qatari', 'QAT'),
('Romanian', 'ROU'),
('Russian', 'RUS'),
('Rwandan', 'RWA'),
('Saint Lucian', 'LCA'),
('Salvadoran', 'SLV'),
('Samoan', 'WSM'),
('San Marinese', 'SMR'),
('Sao Tomean', 'STP'),
('Saudi', 'SAU'),
('Scottish', 'GBR'),
('Senegalese', 'SEN'),
('Serbian', 'SRB'),
('Seychellois', 'SYC'),
('Sierra Leonean', 'SLE'),
('Singaporean', 'SGP'),
('Slovakian', 'SVK'),
('Slovenian', 'SVN'),
('Solomon Islander', 'SLB'),
('Somali', 'SOM'),
('South African', 'ZAF'),
('South Korean', 'KOR'),
('Spanish', 'ESP'),
('Sri Lankan', 'LKA'),
('Sudanese', 'SDN'),
('Surinamer', 'SUR'),
('Swazi', 'SWZ'),
('Swedish', 'SWE'),
('Swiss', 'CHE'),
('Syrian', 'SYR'),
('Taiwanese', 'TWN'),
('Tajik', 'TJK'),
('Tanzanian', 'TZA'),
('Thai', 'THA'),
('Togolese', 'TGO'),
('Tongan', 'TON'),
('Trinidadian or Tobagonian', 'TTO'),
('Tunisian', 'TUN'),
('Turkish', 'TUR'),
('Tuvaluan', 'TUV'),
('Ugandan', 'UGA'),
('Ukrainian', 'UKR'),
('Uruguayan', 'URY'),
('Uzbekistani', 'UZB'),
('Venezuelan', 'VEN'),
('Vietnamese', 'VNM'),
('Welsh', 'GBR'),
('Yemenite', 'YEM'),
('Zambian', 'ZMB'),
('Zimbabwean', 'ZWE');

INSERT INTO comodidades (nome, descricao, preco) VALUES
    ('Wi-Fi', 'Acesso à internet sem fio', 10.00),
    ('Ar condicionado', 'Sistema de refrigeração do ambiente', 20.00),
    ('TV a cabo', 'Canais de televisão pagos', 15.00),
    ('Frigobar', 'Pequeno refrigerador abastecido com bebidas', 12.00),
    ('Café da manhã incluso', 'Refeição matinal servida no quarto', 25.00),
    ('Serviço de quarto', 'Entrega de alimentos e bebidas no quarto', 18.00),
    ('Estacionamento', 'Vagas de estacionamento disponíveis', 10.00),
    ('Piscina', 'Piscina para uso dos hóspedes', 30.00),
    ('Academia', 'Espaço com equipamentos para exercícios físicos', 25.00),
    ('Spa', 'Centro de bem-estar e tratamentos estéticos', 40.00),
    ('Sala de jogos', 'Espaço para entretenimento com jogos', 15.00),
    ('Restaurante', 'Restaurante no local', 20.00),
    ('Bar', 'Bar no local', 12.00),
    ('Sauna', 'Sauna para uso dos hóspedes', 25.00),
    ('Salão de eventos', 'Espaço para eventos e conferências', 30.00),
    ('Lavanderia', 'Serviço de lavanderia disponível', 18.00),
    ('Recepção 24 horas', 'Atendimento na recepção durante 24 horas', 10.00),
    ('Cofre', 'Cofre para guarda de objetos de valor', 15.00),
    ('Área de lazer', 'Área destinada ao lazer dos hóspedes', 12.00),
    ('Jardim', 'Jardim para relaxamento e contemplação', 25.00);

INSERT INTO quartos (numero_quarto, id_tipo_quarto, preco) VALUES
    (101, 1, 250.00),
    (102, 2, 300.00),
    (103, 3, 200.00),
    (104, 2, 320.00),
    (105, 4, 400.00),
    (201, 1, 280.00),
    (202, 3, 230.00),
    (203, 4, 350.00),
    (204, 2, 270.00),
    (205, 5, 500.00),
    (301, 6, 450.00),
    (302, 7, 380.00),
    (303, 8, 320.00),
    (304, 9, 420.00),
    (305, 10, 550.00),
    (401, 1, 290.00),
    (402, 2, 310.00),
    (403, 3, 250.00),
    (404, 2, 330.00),
    (405, 4, 420.00),
    (501, 6, 400.00),
    (502, 7, 350.00),
    (503, 8, 290.00),
    (504, 9, 390.00),
    (505, 10, 520.00);

-- Insert comodidades for quarto 1
INSERT INTO quartoComodidades (id_quarto, id_comodidade) VALUES
    (1, 1), -- Wi-Fi
    (1, 2), -- Ar condicionado
    (1, 3), -- TV a cabo
    (1, 4), -- Frigobar
    (1, 5); -- Café da manhã incluso

-- Insert comodidades for quarto 2
INSERT INTO quartoComodidades (id_quarto, id_comodidade) VALUES
    (2, 1), -- Wi-Fi
    (2, 2), -- Ar condicionado
    (2, 6), -- Serviço de quarto
    (2, 7), -- Estacionamento
    (2, 8); -- Piscina

-- Insert comodidades for quarto 3
INSERT INTO quartoComodidades (id_quarto, id_comodidade) VALUES
    (3, 1), -- Wi-Fi
    (3, 3), -- TV a cabo
    (3, 4), -- Frigobar
    (3, 9), -- Academia
    (3, 10); -- Spa
    
    -- Insert comodidades for quarto 4
INSERT INTO quartoComodidades (id_quarto, id_comodidade) VALUES
    (4, 1), -- Wi-Fi
    (4, 2), -- Ar condicionado
    (4, 3), -- TV a cabo
    (4, 11), -- Sala de jogos
    (4, 12); -- Restaurante

-- Insert comodidades for quarto 5
INSERT INTO quartoComodidades (id_quarto, id_comodidade) VALUES
    (5, 1), -- Wi-Fi
    (5, 5), -- Café da manhã incluso
    (5, 9), -- Serviço de quarto
    (5, 17), -- Estacionamento
    (5, 13); -- Bar

-- Insert comodidades for quarto 6
INSERT INTO quartoComodidades (id_quarto, id_comodidade) VALUES
    (6, 1), 
    (6, 15), 
    (6, 16), 
    (6, 8), 
    (6, 13); 

-- Insert comodidades for quarto 7
INSERT INTO quartoComodidades (id_quarto, id_comodidade) VALUES
    (7, 1), 
    (7, 5), 
    (7, 9), 
    (7, 14), 
    (7, 19); 

-- Insert comodidades for quarto 8
INSERT INTO quartoComodidades (id_quarto, id_comodidade) VALUES
    (8, 1), 
    (8, 2), 
    (8, 4), 
    (8, 7), 
    (8, 16); 

-- Insert comodidades for quarto 9
INSERT INTO quartoComodidades (id_quarto, id_comodidade) VALUES
    (9, 1),
    (9, 2), 
    (9, 5),
    (9, 9), 
    (9, 19); 
    
-- Insert comodidades for quarto 10
INSERT INTO quartoComodidades (id_quarto, id_comodidade) VALUES
    (10, 1), 
    (10, 3), 
    (10, 5), 
    (10, 10), 
    (10, 20); 

-- Insert comodidades for quarto 11
INSERT INTO quartoComodidades (id_quarto, id_comodidade) VALUES
    (11, 2), 
    (11, 9), 
    (11, 13), 
    (11, 17), 
    (11, 20); 

-- Insert comodidades for quarto 12
INSERT INTO quartoComodidades (id_quarto, id_comodidade) VALUES
    (12, 1),  
    (12, 3),     
    (12, 8),    
    (12, 9),  
    (12, 11);  

-- Insert comodidades for quarto 13
INSERT INTO quartoComodidades (id_quarto, id_comodidade) VALUES
    (13, 1),  
    (13, 15),     
    (13, 16),    
    (13, 17),  
    (13, 19); 

-- Insert comodidades for quarto 14
INSERT INTO quartoComodidades (id_quarto, id_comodidade) VALUES
    (14, 1),
    (14, 2), 
    (14, 9), 
    (14, 10), 
    (14, 12); 

-- Insert comodidades for quarto 15
INSERT INTO quartoComodidades (id_quarto, id_comodidade) VALUES
    (15, 1), 
    (15, 4), 
    (15, 8), 
    (15, 11), 
    (15, 13); 
    
-- Insert comodidades for quarto 16
INSERT INTO quartoComodidades (id_quarto, id_comodidade) VALUES
    (16, 2), 
    (16, 6), 
    (16, 11), 
    (16, 15), 
    (16, 18); 
-- Insert comodidades for quarto 17
INSERT INTO quartoComodidades (id_quarto, id_comodidade) VALUES
    (17, 11), 
    (17, 13), 
    (17, 8), 
    (17, 4), 
    (17, 1); 

-- Insert comodidades for quarto 18
INSERT INTO quartoComodidades (id_quarto, id_comodidade) VALUES
    (18, 1),
    (18, 5), 
    (18, 2), 
    (18, 13), 
    (18, 7); 

-- Insert comodidades for quarto 19
INSERT INTO quartoComodidades (id_quarto, id_comodidade) VALUES
    (19, 12), 
    (19, 15), 
    (19, 6), 
    (19, 8), 
    (19, 2); 

-- Insert comodidades for quarto 20
INSERT INTO quartoComodidades (id_quarto, id_comodidade) VALUES
    (20, 4),
    (20, 7), 
    (20, 11),
    (20, 16), 
    (20, 10); 
        
-- Insert comodidades for quarto 22
INSERT INTO quartoComodidades (id_quarto, id_comodidade) VALUES
    (21, 1), 
    (21, 15), 
    (21, 5), 
    (22, 17), 
    (22, 19); 
    
    -- Insert comodidades for quarto 21
INSERT INTO quartoComodidades (id_quarto, id_comodidade) VALUES
    (22, 1), 
    (22, 5), 
    (22, 6), 
    (22, 7), 
    (22, 13); 
    
-- Insert comodidades for quarto 23
INSERT INTO quartoComodidades (id_quarto, id_comodidade) VALUES
    (23, 7), 
    (23, 3), 
    (23, 11), 
    (23, 13), 
    (23, 17); 
    
-- Insert comodidades for quarto 24
INSERT INTO quartoComodidades (id_quarto, id_comodidade) VALUES
    (24, 11), 
    (24, 2), 
    (24, 15), 
    (24, 17), 
    (24, 3); 
    
-- Insert comodidades for quarto 25
INSERT INTO quartoComodidades (id_quarto, id_comodidade) VALUES
    (25, 3), 
    (25, 7), 
    (25, 8), 
    (25, 11), 
    (25, 17); 

INSERT INTO cargosFuncionarios (nome_cargo) VALUES
    ('Recepcionista'),
    ('Camareira'),
    ('Garçom'),
    ('Cozinheiro'),
    ('Manobrista'),
    ('Segurança'),
    ('Supervisor de Limpeza'),
    ('Gerente de Restaurante'),
    ('Auxiliar de Manutenção'),
    ('Coordenador de Eventos'),
	('Recepcionista Noturno'),
    ('Arrumador de Bagagens'),
    ('Barman'),
    ('Chefe de Cozinha'),
    ('Porteiro'),
    ('Vigilante'),
    ('Supervisor de Atendimento ao Cliente'),
    ('Gerente de Recursos Humanos'),
    ('Auxiliar de Jardinagem'),
    ('Coordenador de Marketing');
  
INSERT INTO funcionarios (nome, detalhes_contato, salario, id_cargo, contratacao) VALUES
    ('João Silva', 'joao.silva@email.com', 2500.00, 1, '2022-01-01'),
    ('Maria Santos', 'maria.santos@email.com', 2200.00, 2, '2022-01-02'),
    ('Pedro Oliveira', 'pedro.oliveira@email.com', 3000.00, 3, '2022-01-03'),
    ('Ana Souza', 'ana.souza@email.com', 2800.00, 4, '2022-01-04'),
    ('Carlos Rodrigues', 'carlos.rodrigues@email.com', 2600.00, 5, '2022-01-05'),
    ('Mariana Lima', 'mariana.lima@email.com', 2400.00, 6, '2022-01-06'),
    ('Ricardo Costa', 'ricardo.costa@email.com', 2800.00, 7, '2022-01-07'),
    ('Camila Pereira', 'camila.pereira@email.com', 3200.00, 8, '2022-01-08'),
    ('Gustavo Santos', 'gustavo.santos@email.com', 2900.00, 9, '2022-01-09'),
    ('Amanda Ferreira', 'amanda.ferreira@email.com', 2700.00, 10, '2022-01-10'),
    ('Lucas Oliveira', 'lucas.oliveira@email.com', 2500.00, 1, '2022-01-11'),
    ('Carolina Rodrigues', 'carolina.rodrigues@email.com', 2300.00, 2, '2022-01-12'),
    ('Fernando Silva', 'fernando.silva@email.com', 2700.00, 3, '2022-01-13'),
    ('Isabela Gomes', 'isabela.gomes@email.com', 3100.00, 4, '2022-01-14'),
    ('Rafaela Costa', 'rafaela.costa@email.com', 2900.00, 5, '2022-01-15'),
    ('Paulo Martins', 'paulo.martins@email.com', 2700.00, 6, '2022-01-16'),
    ('Luisa Sousa', 'luisa.sousa@email.com', 2500.00, 7, '2022-01-17'),
    ('Tiago Santos', 'tiago.santos@email.com', 2300.00, 8, '2022-01-18'),
    ('Vanessa Ferreira', 'vanessa.ferreira@email.com', 2700.00, 9, '2022-01-19'),
    ('Bruno Oliveira', 'bruno.oliveira@email.com', 3100.00, 10, '2022-01-20'),
    ('Fernanda Silva', 'fernanda.silva@email.com', 2900.00, 1, '2022-01-21'),
    ('Rodrigo Almeida', 'rodrigo.almeida@email.com', 2700.00, 2, '2022-01-22'),
    ('Juliana Santos', 'juliana.santos@email.com', 2500.00, 3, '2022-01-23'),
    ('Thiago Pereira', 'thiago.pereira@email.com', 2300.00, 4, '2022-01-24'),
    ('Viviane Costa', 'viviane.costa@email.com', 2700.00, 5, '2022-01-25'),
    ('Renata Lima', 'renata.lima@email.com', 2500.00, 10, '2022-01-26'),
    ('Felipe Castro', 'felipe.castro@email.com', 2200.00, 11, '2022-01-27'),
    ('Laura Mendes', 'laura.mendes@email.com', 3000.00, 12, '2022-01-28'),
    ('Rafael Sousa', 'rafael.sousa@email.com', 2800.00, 13, '2022-01-29'),
    ('Carla Santos', 'carla.santos@email.com', 2600.00, 14, '2022-01-30'),
    ('Guilherme Oliveira', 'guilherme.oliveira@email.com', 2400.00, 15, '2022-01-31'),
    ('Patricia Costa', 'patricia.costa@email.com', 2800.00, 16, '2022-02-01'),
    ('Diego Pereira', 'diego.pereira@email.com', 3200.00, 17, '2022-02-02'),
    ('Vanessa Ferreira', 'vanessa.ferreira@email.com', 2900.00, 18, '2022-02-03'),
    ('Leonardo Almeida', 'leonardo.almeida@email.com', 2700.00, 19, '2022-02-04'),
    ('Bruna Santos', 'bruna.santos@email.com', 2500.00, 20, '2022-02-05'),
    ('Renan Oliveira', 'renan.oliveira@email.com', 2300.00, 10, '2022-02-06'),
    ('Fernanda Costa', 'fernanda.costa@email.com', 2700.00, 11, '2022-02-07'),
    ('Thiago Rodrigues', 'thiago.rodrigues@email.com', 3100.00, 12, '2022-02-08'),
    ('Mariana Pereira', 'mariana.pereira@email.com', 2900.00, 13, '2022-02-09'),
    ('Daniel Martins', 'daniel.martins@email.com', 2700.00, 14, '2022-02-10'),
    ('Larissa Silva', 'larissa.silva@email.com', 2500.00, 15, '2022-02-11'),
    ('Rodrigo Costa', 'rodrigo.costa@email.com', 2300.00, 16, '2022-02-12'),
    ('Ana Oliveira', 'ana.oliveira@email.com', 2700.00, 17, '2022-02-13'),
    ('Lucas Santos', 'lucas.santos@email.com', 3100.00, 18, '2022-02-14'),
    ('Giovanna Almeida', 'giovanna.almeida@email.com', 2900.00, 19, '2022-02-15'),
    ('Gabriel Ferreira', 'gabriel.ferreira@email.com', 2700.00, 20, '2022-02-16');


INSERT INTO hospedes (nome, detalhes_contato, id_nacionalidade, id_endereco) VALUES
('João Silva', 'joao.silva@example.com', 1, 1),
('Maria Santos', 'maria.santos@example.com', 2, 2),
('Pedro Oliveira', 'pedro.oliveira@example.com', 3, 3),
('Ana Pereira', 'ana.pereira@example.com', 4, 4),
('Carlos Almeida', 'carlos.almeida@example.com', 5, 5),
('Mariana Costa', 'mariana.costa@example.com', 6, 6),
('José Rodrigues', 'jose.rodrigues@example.com', 7, 7),
('Fernanda Fernandes', 'fernanda.fernandes@example.com', 8, 8),
('Ricardo Martins', 'ricardo.martins@example.com', 9, 9),
('Isabel Ferreira', 'isabel.ferreira@example.com', 10, 10),
('Luís Sousa', 'luis.sousa@example.com', 11, 11),
('Sofia Gonçalves', 'sofia.goncalves@example.com', 12, 12),
('António Carvalho', 'antonio.carvalho@example.com', 13, 13),
('Patrícia Ribeiro', 'patricia.ribeiro@example.com', 14, 14),
('Hugo Cardoso', 'hugo.cardoso@example.com', 15, 15),
('Catarina Lopes', 'catarina.lopes@example.com', 16, 16),
('André Mota', 'andre.mota@example.com', 17, 17),
('Teresa Fernandes', 'teresa.fernandes@example.com', 18, 18),
('Miguel Marques', 'miguel.marques@example.com', 19, 19),
('Sara Santos', 'sara.santos@example.com', 20, 20),
('Paulo Silva', 'paulo.silva@example.com', 21, 21),
('Inês Oliveira', 'ines.oliveira@example.com', 22, 22),
('Gustavo Pereira', 'gustavo.pereira@example.com', 23, 23),
('Rita Almeida', 'rita.almeida@example.com', 24, 24),
('Francisco Costa', 'francisco.costa@example.com', 25, 25),
('Beatriz Rodrigues', 'beatriz.rodrigues@example.com', 26, 26),
('Daniel Fernandes', 'daniel.fernandes@example.com', 27, 27),
('Lara Martins', 'lara.martins@example.com', 28, 28),
('Alexandre Ferreira', 'alexandre.ferreira@example.com', 29, 29),
('Ingrid Sousa', 'ingrid.sousa@example.com', 30, 30),
('Raul Gonçalves', 'raul.goncalves@example.com', 31, 31),
('Marta Carvalho', 'marta.carvalho@example.com', 32, 32),
('Leonardo Ribeiro', 'leonardo.ribeiro@example.com', 33, 33),
('Paula Silva', 'paula.silva@example.com', 34, 34),
('Fábio Oliveira', 'fabio.oliveira@example.com', 35, 35),
('Laura Pereira', 'laura.pereira@example.com', 36, 36),
('Vitor Almeida', 'vitor.almeida@example.com', 37, 37),
('Camila Costa', 'camila.costa@example.com', 38, 38),
('Roberto Rodrigues', 'roberto.rodrigues@example.com', 39, 39),
('Mariano Fernandes', 'mariano.fernandes@example.com', 40, 40),
('Carla Martins', 'carla.martins@example.com', 41, 41),
('Hugo Ferreira', 'hugo.ferreira@example.com', 42, 42),
('Isabela Sousa', 'isabela.sousa@example.com', 43, 43),
('Gustavo Gonçalves', 'gustavo.goncalves@example.com', 44, 44),
('Rafael Carvalho', 'rafael.carvalho@example.com', 45, 45),
('Lívia Ribeiro', 'livia.ribeiro@example.com', 46, 46),
('Eduardo Costa', 'eduardo.costa@example.com', 47, 47),
('Sandra Rodrigues', 'sandra.rodrigues@example.com', 48, 48),
('Diego Fernandes', 'diego.fernandes@example.com', 49, 49),
('Renata Martins', 'renata.martins@example.com', 50, 50);

INSERT INTO statusPagamento (descricao) VALUES
('Aguardando pagamento'),
('Pagamento pendente'),
('Pagamento recebido'),
('Pagamento confirmado'),
('Pagamento cancelado');

INSERT INTO metodosPagamento (metodo_pagamento) VALUES
('Cartão de crédito'),
('Transferência bancária'),
('PayPal'),
('Boleto bancário'),
('Dinheiro');

INSERT INTO pagamentos (id_status_pagamento, id_metodo_pagamento, dataPagamento) VALUES
    (1, 1, '2023-05-01'),
    (2, 2, '2023-05-02'),
    (3, 3, '2023-05-03'),
    (4, 4, '2023-05-04'),
    (5, 5, '2023-05-05'),
    (1, 2, '2023-05-06'),
    (2, 3, '2023-05-07'),
    (3, 4, '2023-05-08'),
    (4, 5, '2023-05-09'),
    (5, 1, '2023-05-10'),
    (1, 3, '2023-05-11'),
    (2, 4, '2023-05-12'),
    (3, 5, '2023-05-13'),
    (4, 1, '2023-05-14'),
    (5, 2, '2023-05-15'),
    (1, 4, '2023-05-16'),
    (2, 5, '2023-05-17'),
    (3, 1, '2023-05-18'),
    (4, 2, '2023-05-19'),
    (5, 3, '2023-05-20'),
    (1, 5, '2023-05-21'),
    (2, 1, '2023-05-22'),
    (3, 2, '2023-05-23'),
    (4, 3, '2023-05-24'),
    (5, 4, '2023-05-25'),
    (1, 1, '2023-05-26'),
    (2, 2, '2023-05-27'),
    (3, 3, '2023-05-28'),
    (4, 4, '2023-05-29'),
    (5, 5, '2023-05-30'),
    (1, 2, '2023-05-31'),
    (2, 3, '2023-06-01'),
    (3, 4, '2023-06-02'),
    (4, 5, '2023-06-03'),
    (5, 1, '2023-06-04'),
    (1, 3, '2023-06-05'),
    (2, 4, '2023-06-06'),
    (3, 5, '2023-06-07'),
    (4, 1, '2023-06-08'),
    (5, 2, '2023-06-09'),
    (1, 4, '2023-06-10'),
    (2, 5, '2023-06-11'),
    (3, 1, '2023-06-12'),
    (4, 2, '2023-06-13'),
    (5, 3, '2023-06-14'),
    (1, 5, '2023-06-15'),
    (2, 1, '2023-06-16'),
    (3, 2, '2023-06-17'),
    (4, 3, '2023-06-18'),
    (5, 4, '2023-06-19');


INSERT INTO reservas (id_hospede, id_quarto, id_funcionario, id_pagamento, data_entrada, data_saida)
VALUES
    (1, 3, 1, 1, '2023-01-01', '2023-01-05'),
    (2, 7, 11, 2, '2023-01-02', '2023-01-06'),
    (3, 2, 1, 3, '2023-01-03', '2023-01-07'),
    (4, 5, 11, 4, '2023-01-04', '2023-01-08'),
    (5, 1, 1, 5, '2023-01-05', '2023-01-09'),
    (6, 9, 11, 6, '2023-01-06', '2023-01-10'),
    (7, 4, 1, 7, '2023-01-07', '2023-01-11'),
    (8, 8, 11, 8, '2023-01-08', '2023-01-12'),
    (9, 6, 1, 9, '2023-01-09', '2023-01-13'),
    (10, 10, 11, 10, '2023-01-10', '2023-01-14'),
    (11, 3, 1, 11, '2023-01-11', '2023-01-15'),
    (12, 7, 11, 12, '2023-01-12', '2023-01-16'),
    (13, 2, 1, 13, '2023-01-13', '2023-01-17'),
    (14, 5, 11, 14, '2023-01-14', '2023-01-18'),
    (15, 1, 1, 15, '2023-01-15', '2023-01-19'),
    (16, 9, 11, 16, '2023-01-16', '2023-01-20'),
    (17, 4, 1, 17, '2023-01-17', '2023-01-21'),
    (18, 8, 11, 18, '2023-01-18', '2023-01-22'),
    (19, 6, 1, 19, '2023-01-19', '2023-01-23'),
    (20, 10, 11, 20, '2023-01-20', '2023-01-24'),
    (21, 3, 1, 21, '2023-01-21', '2023-01-25'),
    (22, 7, 11, 22, '2023-01-22', '2023-01-26'),
    (23, 2, 1, 23, '2023-01-23', '2023-01-27'),
    (24, 5, 11, 24, '2023-01-24', '2023-01-28'),
    (25, 1, 1, 25, '2023-01-24', '2023-01-28'),
	(26, 9, 11, 26, '2023-01-25', '2023-01-29'),
    (27, 4, 1, 27, '2023-01-26', '2023-01-30'),
    (28, 8, 11, 28, '2023-01-27', '2023-01-31'),
    (29, 6, 1, 29, '2023-01-28', '2023-02-01'),
    (30, 10, 11, 30, '2023-01-29', '2023-02-02'),
    (31, 3, 1, 31, '2023-01-30', '2023-02-03'),
    (32, 7, 11, 32, '2023-01-31', '2023-02-04'),
    (33, 2, 1, 33, '2023-02-01', '2023-02-05'),
    (34, 5, 11, 34, '2023-02-02', '2023-02-06'),
    (35, 1, 1, 35, '2023-02-03', '2023-02-07'),
    (36, 9, 11, 36, '2023-02-04', '2023-02-08'),
    (37, 4, 1, 37, '2023-02-05', '2023-02-09'),
    (38, 8, 11, 38, '2023-02-06', '2023-02-10'),
    (39, 6, 1, 39, '2023-02-07', '2023-02-11'),
    (40, 10, 11, 40, '2023-02-08', '2023-02-12'),
    (41, 3, 1, 41, '2023-02-09', '2023-02-13'),
    (42, 7, 11, 42, '2023-02-10', '2023-02-14'),
    (43, 2, 1, 43, '2023-02-11', '2023-02-15'),
    (44, 5, 11, 44, '2023-02-12', '2023-02-16'),
    (45, 1, 1, 45, '2023-02-13', '2023-02-17'),
    (46, 9, 11, 46, '2023-02-14', '2023-02-18'),
    (47, 4, 1, 47, '2023-02-15', '2023-02-19'),
    (48, 8, 11, 48, '2023-02-16', '2023-02-20'),
    (49, 6, 1, 49, '2023-02-17', '2023-02-21'),
    (50, 10, 11, 50, '2023-02-18', '2023-02-22');