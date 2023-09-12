-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 21-Abr-2023 às 16:54
-- Versão do servidor: 10.4.27-MariaDB
-- versão do PHP: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `locadora2`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `acessorio_automovel`
--
#DROP DATABASE IF EXISTS locadora2;
CREATE DATABASE IF NOT EXISTS locadora2;
USE locadora2;

SELECT * FROM acessorio_automovel;
SELECT * FROM automovel;
SELECT * FROM camioneta_carga;
SELECT * FROM capacidade_camioneta_carga;
SELECT * FROM cliente_locadora;
SELECT * FROM cnh;
SELECT * FROM cor_veiculo_locadora;
SELECT * FROM endereco;
SELECT * FROM filial_locadora;
SELECT * FROM locacao;
SELECT * FROM modelo_veiculo_locadora;
SELECT * FROM motorista_locadora;
SELECT * FROM pessoa_fisica_locadora;
SELECT * FROM pessoa_juridica_locadora;
SELECT * FROM reserva_locadora;
SELECT * FROM revisao_entrega_locadora;
SELECT * FROM tamanho_automovel;
SELECT * FROM status_seguro;
SELECT * FROM status_revisao;
SELECT * FROM seguro_locadora;
SELECT * FROM tipo_veiculo_locadora;
SELECT * FROM veiculo_locadora;

CREATE TABLE `acessorio_automovel` (
  `acessorio_automovel` int(11) NOT NULL,
  `descricao` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `acessorio_automovel`
--

INSERT INTO `acessorio_automovel` (`acessorio_automovel`, `descricao`) VALUES
(1, 'Ar-condicionado'),
(2, 'Vidro elétrico'),
(3, 'Trava elétrica'),
(4, 'Direção hidráulica'),
(5, 'Câmbio automático'),
(6, 'Bancos de couro'),
(7, 'Rodas de liga-leve'),
(8, 'Sistema de som'),
(9, 'Sensor de estacionamento'),
(10, 'Câmera de ré');

-- --------------------------------------------------------

--
-- Estrutura da tabela `automovel`
--

CREATE TABLE `automovel` (
  `id_automovelPassageiro` int(11) NOT NULL,
  `id_tipo_veiculo` int(11) NOT NULL,
  `id_tamanho_automovel` int(11) NOT NULL,
  `id_acessorio` int(11) NOT NULL,
  `nome` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `automovel`
--

INSERT INTO `automovel` (`id_automovelPassageiro`, `id_tipo_veiculo`, `id_tamanho_automovel`, `id_acessorio`, `nome`) VALUES
(12, 1, 1, 1, 'Carro A'),
(13, 2, 2, 2, 'Carro B'),
(14, 3, 2, 1, 'Carro C'),
(15, 1, 3, 3, 'Carro D'),
(16, 2, 1, 2, 'Carro E'),
(17, 3, 3, 1, 'Carro F'),
(18, 1, 2, 1, 'Carro G'),
(19, 2, 3, 2, 'Carro H'),
(20, 3, 1, 3, 'Carro I'),
(21, 1, 1, 2, 'Carro J');

-- --------------------------------------------------------

--
-- Estrutura da tabela `camioneta_carga`
--

CREATE TABLE `camioneta_carga` (
  `id_camionetaCarga` int(11) NOT NULL,
  `id_tipo_veiculo` int(11) NOT NULL,
  `id_capacidade` int(11) NOT NULL,
  `nome` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `camioneta_carga`
--

INSERT INTO `camioneta_carga` (`id_camionetaCarga`, `id_tipo_veiculo`, `id_capacidade`, `nome`) VALUES
(8, 1, 1, 'Camioneta A'),
(9, 2, 2, 'Camioneta B'),
(10, 3, 3, 'Camioneta C'),
(11, 1, 2, 'Camioneta D'),
(12, 2, 3, 'Camioneta E'),
(13, 3, 1, 'Camioneta F'),
(14, 1, 3, 'Camioneta G'),
(15, 2, 1, 'Camioneta H'),
(16, 3, 2, 'Camioneta I'),
(17, 1, 2, 'Camioneta J');

-- --------------------------------------------------------

--
-- Estrutura da tabela `capacidade_camioneta_carga`
--

CREATE TABLE `capacidade_camioneta_carga` (
  `id_capacidade` int(11) NOT NULL,
  `valor` double NOT NULL,
  `descricao` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `capacidade_camioneta_carga`
--

INSERT INTO `capacidade_camioneta_carga` (`id_capacidade`, `valor`, `descricao`) VALUES
(1, 500, 'Até 500 kg'),
(2, 1000, 'Até 1 tonelada'),
(3, 1500, 'Até 1,5 toneladas'),
(4, 2000, 'Até 2 toneladas'),
(5, 2500, 'Até 2,5 toneladas'),
(6, 3000, 'Até 3 toneladas'),
(7, 3500, 'Até 3,5 toneladas'),
(8, 4000, 'Até 4 toneladas'),
(9, 4500, 'Até 4,5 toneladas'),
(10, 5000, 'Até 5 toneladas');

-- --------------------------------------------------------

--
-- Estrutura da tabela `cliente_locadora`
--

CREATE TABLE `cliente_locadora` (
  `id_cliente` int(11) NOT NULL,
  `id_motorista` int(11) NOT NULL,
  `id_endereco` int(11) NOT NULL,
  `nome` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `cliente_locadora`
--

INSERT INTO `cliente_locadora` (`id_cliente`, `id_motorista`, `id_endereco`, `nome`) VALUES
(1, 1, 1, 'John Smith'),
(2, 2, 2, 'Jane Doe'),
(3, 3, 3, 'Bob Johnson'),
(4, 4, 4, 'Sarah Lee'),
(5, 5, 5, 'Tom Williams'),
(6, 6, 6, 'Emily Brown'),
(7, 7, 7, 'David Jones'),
(8, 8, 8, 'Mary Taylor'),
(9, 9, 9, 'Paul Green'),
(10, 10, 10, 'Samantha Lee');

-- --------------------------------------------------------

--
-- Estrutura da tabela `cnh`
--

CREATE TABLE `cnh` (
  `id_cnh` int(11) NOT NULL,
  `validade` varchar(11) NOT NULL,
  `n_registro` int(11) NOT NULL,
  `categoria` varchar(2) NOT NULL,
  `nome` varchar(70) NOT NULL,
  `CPF` varchar(11) NOT NULL,
  `RG` varchar(9) NOT NULL,
  `data_primeira_habilitacao` date NOT NULL,
  `data_nascimento` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `cnh`
--

INSERT INTO `cnh` (`id_cnh`, `validade`, `n_registro`, `categoria`, `nome`, `CPF`, `RG`, `data_primeira_habilitacao`, `data_nascimento`) VALUES
(1, '2025-12-31', 123456, 'B', 'João Silva', '11122233344', '12345678', '2010-01-01', '1990-01-01'),
(2, '2023-12-31', 789012, 'A', 'Maria Souza', '22233344455', '87654321', '2015-01-01', '1995-02-02'),
(3, '2024-12-31', 654321, 'AB', 'Carlos Ferreira', '33344455566', '98765432', '2008-01-01', '1988-03-03'),
(4, '2024-05-31', 483647, 'AE', 'Maria da Silva', '09876543210', '987654321', '2016-02-01', '1995-07-20'),
(5, '2026-08-31', 214748, 'AD', 'Pedro Oliveira', '11111111111', '222222222', '2018-07-01', '1998-10-08'),
(6, '2023-12-31', 474836, 'AC', 'Ana Souza', '33333333333', '444444444', '2014-05-15', '1989-02-12'),
(7, '2025-05-30', 654321, 'A', 'Ana Silva', '12345678901', '12345678-', '2018-03-15', '1995-01-01'),
(8, '2026-01-20', 654321, 'B', 'Bruno Oliveira', '23456789012', '23456789-', '2019-06-10', '1998-05-20'),
(9, '2027-07-10', 765432, 'AB', 'Carla Santos', '34567890123', '34567890-', '2020-09-25', '1996-11-15'),
(10, '2024-12-05', 876543, 'B', 'Daniel Souza', '45678901234', '45678901-', '2017-01-05', '1994-08-02');

-- --------------------------------------------------------

--
-- Estrutura da tabela `cor_veiculo_locadora`
--

CREATE TABLE `cor_veiculo_locadora` (
  `id_cor_veiculo_locadora` int(11) NOT NULL,
  `descricao` varchar(60) NOT NULL,
  `codigo_hexadecimal` varchar(7) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `cor_veiculo_locadora`
--

INSERT INTO `cor_veiculo_locadora` (`id_cor_veiculo_locadora`, `descricao`, `codigo_hexadecimal`) VALUES
(1, 'Branco', '#FFFFFF'),
(2, 'Preto', '#000000'),
(3, 'Azul', '#0000FF'),
(4, 'Verde', '#008000'),
(5, 'Amarelo', '#FFFF00'),
(6, 'Vermelho', '#FF0000'),
(7, 'Laranja', '#FFA500'),
(8, 'Roxo', '#800080'),
(9, 'Prata', '#C0C0C0'),
(10, 'Cinza', '#808080');

-- --------------------------------------------------------

--
-- Estrutura da tabela `endereco`
--

CREATE TABLE `endereco` (
  `id_endereco` int(11) NOT NULL,
  `CEP` int(13) NOT NULL,
  `numero` int(11) NOT NULL,
  `complemento` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `endereco`
--

INSERT INTO `endereco` (`id_endereco`, `CEP`, `numero`, `complemento`) VALUES
(1, 12345678, 10, ''),
(2, 87654321, 20, 'apartamento 101'),
(3, 45678901, 30, ''),
(4, 23456789, 40, 'casa 2'),
(5, 98765432, 50, ''),
(6, 34567890, 60, 'sala 201'),
(7, 56789012, 70, ''),
(8, 78901234, 80, 'loja 1'),
(9, 45671234, 90, ''),
(10, 23456781, 100, 'casa 3');

-- --------------------------------------------------------

--
-- Estrutura da tabela `filial_locadora`
--

CREATE TABLE `filial_locadora` (
  `id_filial` int(11) NOT NULL,
  `id_endereco` int(11) NOT NULL,
  `nome` varchar(60) NOT NULL,
  `descricao` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `filial_locadora`
--

INSERT INTO `filial_locadora` (`id_filial`, `id_endereco`, `nome`, `descricao`) VALUES
(1, 1, 'Filial Rio de Janeiro', 'Loja localizada na cidade do Rio de Janeiro'),
(2, 2, 'Filial São Paulo', 'Loja localizada na cidade de São Paulo'),
(3, 3, 'Filial Brasília', 'Loja localizada na cidade de Brasília'),
(4, 4, 'Filial Belo Horizonte', 'Loja localizada na cidade de Belo Horizonte'),
(5, 5, 'Filial Recife', 'Loja localizada na cidade de Recife'),
(6, 6, 'Filial Porto Alegre', 'Loja localizada na cidade de Porto Alegre'),
(7, 7, 'Filial Salvador', 'Loja localizada na cidade de Salvador'),
(8, 8, 'Filial Curitiba', 'Loja localizada na cidade de Curitiba'),
(9, 9, 'Filial Fortaleza', 'Loja localizada na cidade de Fortaleza'),
(10, 10, 'Filial Florianópolis', 'Loja localizada na cidade de Florianópolis');

-- --------------------------------------------------------

--
-- Estrutura da tabela `locacao`
--

CREATE TABLE `locacao` (
  `id_locacao` int(11) NOT NULL,
  `placa` varchar(7) NOT NULL,
  `id_seguro` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `locacao`
--

INSERT INTO `locacao` (`id_locacao`, `placa`, `id_seguro`) VALUES
(11, 'ABC1234', 1),
(12, 'DEF5678', 2),
(13, 'GHI9012', 3),
(14, 'JKL3456', 4),
(15, 'MNO7890', 5),
(17, 'PQR2345', 6);

-- --------------------------------------------------------

--
-- Estrutura da tabela `modelo_veiculo_locadora`
--

CREATE TABLE `modelo_veiculo_locadora` (
  `id_modelo_veiculo` int(11) NOT NULL,
  `nome` varchar(60) NOT NULL,
  `descricao` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `modelo_veiculo_locadora`
--

INSERT INTO `modelo_veiculo_locadora` (`id_modelo_veiculo`, `nome`, `descricao`) VALUES
(1, 'P1', 'Automóveis muito pequenos, duas portas e sem ar-condicionado'),
(2, 'P2', 'Automóveis pequenos, duas portas  e com ar-condicionado'),
(3, 'P3', 'Automóveis pequenos, quatro portas e com ar-condicionado'),
(4, 'P4', 'Automóveis medios, quatro portas  e sem ar-condicionado'),
(5, 'P5', 'Automóveis medios, quatro portas  e com ar-condicionado'),
(6, 'G1', 'Automóveis Grandes, duas portas   e sem ar-condicionado'),
(7, 'G2', 'Automóveis Grandes, duas portas   e com ar-condicionado'),
(8, 'G3', 'Automóveis Grandes, quatro portas e sem ar-condicionado'),
(9, 'G4', 'Automóveis Grandes, quatro portas e sem ar-condicionado'),
(10, 'G5', 'Automóveis Grandes, seis portas   e com ar-condicionado');

-- --------------------------------------------------------

--
-- Estrutura da tabela `motorista_locadora`
--

CREATE TABLE `motorista_locadora` (
  `id_motorista` int(11) NOT NULL,
  `id_cnh` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `motorista_locadora`
--

INSERT INTO `motorista_locadora` (`id_motorista`, `id_cnh`) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10);

-- --------------------------------------------------------

--
-- Estrutura da tabela `pessoa_fisica_locadora`
--

CREATE TABLE `pessoa_fisica_locadora` (
  `CPF` varchar(11) NOT NULL,
  `id_cliente` int(11) NOT NULL,
  `sexo` varchar(10) NOT NULL,
  `nascimento` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `pessoa_fisica_locadora`
--

INSERT INTO `pessoa_fisica_locadora` (`CPF`, `id_cliente`, `sexo`, `nascimento`) VALUES
('11122233344', 1, 'M', '1985-01-01'),
('22233344455', 2, 'F', '1990-02-02'),
('33344455566', 3, 'M', '1995-03-03'),
('44455566677', 4, 'F', '2000-04-04'),
('55566677788', 5, 'M', '2005-05-05');

-- --------------------------------------------------------

--
-- Estrutura da tabela `pessoa_juridica_locadora`
--

CREATE TABLE `pessoa_juridica_locadora` (
  `CNPJ` varchar(14) NOT NULL,
  `id_cliente` int(11) NOT NULL,
  `inscricao_estadual` varchar(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `pessoa_juridica_locadora`
--

INSERT INTO `pessoa_juridica_locadora` (`CNPJ`, `id_cliente`, `inscricao_estadual`) VALUES
('00011122233344', 10, '123456789012'),
('66677788899900', 6, '678901234567'),
('77788899900011', 7, '789012345678'),
('88899900011122', 8, '890123456789'),
('99900011122233', 9, '901234567890');

-- --------------------------------------------------------

--
-- Estrutura da tabela `reserva_locadora`
--

CREATE TABLE `reserva_locadora` (
  `id_reserva` int(11) NOT NULL,
  `id_tipo_veiculo` int(11) NOT NULL,
  `id_cliente` int(11) NOT NULL,
  `filial_entrega` int(11) NOT NULL,
  `filial_reserva` int(11) NOT NULL,
  `data_reserva` datetime NOT NULL,
  `data_inicio_locacao` date NOT NULL,
  `data_termino_locacao` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `reserva_locadora`
--

INSERT INTO `reserva_locadora` (`id_reserva`, `id_tipo_veiculo`, `id_cliente`, `filial_entrega`, `filial_reserva`, `data_reserva`, `data_inicio_locacao`, `data_termino_locacao`) VALUES
(2, 1, 5, 2, 1, '2023-05-01 09:00:00', '2023-05-15', '2023-05-20'),
(3, 2, 6, 1, 2, '2023-06-10 14:30:00', '2023-06-20', '2023-06-25'),
(4, 3, 7, 2, 3, '2023-07-05 11:45:00', '2023-07-15', '2023-07-20'),
(5, 4, 8, 4, 2, '2023-08-12 08:15:00', '2023-08-20', '2023-08-27'),
(6, 5, 1, 3, 1, '2023-09-03 10:30:00', '2023-09-15', '2023-09-20'),
(7, 2, 2, 1, 4, '2023-10-21 13:00:00', '2023-11-01', '2023-11-10'),
(8, 4, 3, 2, 3, '2023-11-07 09:30:00', '2023-11-20', '2023-11-27'),
(9, 1, 4, 2, 2, '2023-12-15 16:45:00', '2023-12-23', '2023-12-28');

-- --------------------------------------------------------

--
-- Estrutura da tabela `revisao_entrega_locadora`
--

CREATE TABLE `revisao_entrega_locadora` (
  `id_revisao_entrega` int(11) NOT NULL,
  `id_status_revisao` int(11) NOT NULL,
  `km_atual` float NOT NULL,
  `km_media_diaria` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `revisao_entrega_locadora`
--

INSERT INTO `revisao_entrega_locadora` (`id_revisao_entrega`, `id_status_revisao`, `km_atual`, `km_media_diaria`) VALUES
(1, 1, 1234.5, 80.2),
(2, 1, 1542.8, 76.9),
(3, 1, 1687.3, 85.4),
(4, 1, 1893.2, 92.1),
(5, 1, 2035.1, 84.6),
(6, 1, 2356.9, 76.5),
(7, 1, 2789.5, 89.7),
(8, 1, 2896.2, 94.2),
(9, 1, 3125.6, 82.5),
(10, 1, 3412.7, 78.1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `seguro_locadora`
--

CREATE TABLE `seguro_locadora` (
  `id_seguro` int(11) NOT NULL,
  `id_motorista` int(11) NOT NULL,
  `id_status_seguro` int(11) NOT NULL,
  `descricao` varchar(120) NOT NULL,
  `nome` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `seguro_locadora`
--

INSERT INTO `seguro_locadora` (`id_seguro`, `id_motorista`, `id_status_seguro`, `descricao`, `nome`) VALUES
(1, 1, 1, 'Seguro básico', 'Seguro ABC'),
(2, 2, 1, 'Seguro completo', 'Seguro XYZ'),
(3, 3, 1, 'Seguro para terceiros', 'Seguro 123'),
(4, 4, 1, 'Seguro contra roubo', 'Seguro Roubos'),
(5, 5, 1, 'Seguro para danos a terceiros', 'Seguro Danos'),
(6, 6, 1, 'Seguro para carros de luxo', 'Seguro Luxo'),
(7, 7, 1, 'Seguro para motoristas jovens', 'Seguro Jovens'),
(8, 8, 1, 'Seguro para carros antigos', 'Seguro Antigos'),
(9, 9, 1, 'Seguro para motoristas estrangeiros', 'Seguro Estrangeiros'),
(10, 10, 1, 'Seguro para carros com motoristas por aplicativo', 'Seguro Apps');

-- --------------------------------------------------------

--
-- Estrutura da tabela `status_revisao`
--

CREATE TABLE `status_revisao` (
  `id_status_revisao` int(11) NOT NULL,
  `valor` tinyint(1) NOT NULL,
  `descricao` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `status_revisao`
--

INSERT INTO `status_revisao` (`id_status_revisao`, `valor`, `descricao`) VALUES
(1, 1, 'Revisao OK'),
(2, 0, 'Revisao Pendente');

-- --------------------------------------------------------

--
-- Estrutura da tabela `status_seguro`
--

CREATE TABLE `status_seguro` (
  `id_status_seguro` int(11) NOT NULL,
  `valor` tinyint(1) NOT NULL,
  `descricao` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `status_seguro`
--

INSERT INTO `status_seguro` (`id_status_seguro`, `valor`, `descricao`) VALUES
(1, 1, 'Seguro Ativo'),
(2, 0, 'Seguro Cancelado');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tamanho_automovel`
--

CREATE TABLE `tamanho_automovel` (
  `id_tamanho` int(11) NOT NULL,
  `descricao` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `tamanho_automovel`
--

INSERT INTO `tamanho_automovel` (`id_tamanho`, `descricao`) VALUES
(1, 'pequeno'),
(2, 'medio'),
(3, 'grande');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tipo_veiculo_locadora`
--

CREATE TABLE `tipo_veiculo_locadora` (
  `id_tipo_veiculo` int(11) NOT NULL,
  `id_revisao_entrega` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `tipo_veiculo_locadora`
--

INSERT INTO `tipo_veiculo_locadora` (`id_tipo_veiculo`, `id_revisao_entrega`) VALUES
(1, 1),
(6, 1),
(2, 2),
(7, 2),
(3, 3),
(8, 3),
(4, 4),
(9, 4),
(5, 5),
(10, 5);

-- --------------------------------------------------------

--
-- Estrutura da tabela `veiculo_locadora`
--

CREATE TABLE `veiculo_locadora` (
  `placa` varchar(7) NOT NULL,
  `id_tipo_veiculo` int(11) NOT NULL,
  `id_modelo_veiculo` int(11) NOT NULL,
  `id_filial_alocado` int(11) NOT NULL,
  `id_cor_veiculo_locadora` int(11) NOT NULL,
  `chassi` varchar(17) NOT NULL,
  `n_motor` varchar(17) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `veiculo_locadora`
--

INSERT INTO `veiculo_locadora` (`placa`, `id_tipo_veiculo`, `id_modelo_veiculo`, `id_filial_alocado`, `id_cor_veiculo_locadora`, `chassi`, `n_motor`) VALUES
('ABC1234', 1, 1, 1, 1, '9BWDE21J314025204', 'AB123456789'),
('BCD9012', 5, 10, 10, 10, '3N1AB7AP1JL650622', 'ST987654321'),
('DEF5678', 2, 2, 2, 2, '2T1BR32E54C270799', 'CD987654321'),
('GHI9012', 3, 3, 3, 3, '1C4HJWFG8DL604822', 'EF123456789'),
('JKL3456', 4, 4, 4, 4, '1FA6P8CF6G5249666', 'GH987654321'),
('MNO7890', 5, 5, 5, 5, '5GZCZ33D76S849280', 'IJ123456789'),
('PQR2345', 1, 6, 6, 6, '1J4RR4GG4BC706261', 'KL987654321'),
('STU6789', 2, 7, 7, 7, '5FNRL382X4B028965', 'MN123456789'),
('VWX1234', 3, 8, 8, 8, '1G8ZV1279TZ318075', 'OP987654321'),
('YZA5678', 4, 9, 9, 9, 'JM3LW28A820317114', 'QR123456789');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `acessorio_automovel`
--
ALTER TABLE `acessorio_automovel`
  ADD PRIMARY KEY (`acessorio_automovel`);

--
-- Índices para tabela `automovel`
--
ALTER TABLE `automovel`
  ADD PRIMARY KEY (`id_automovelPassageiro`),
  ADD KEY `FK_id_acessorio` (`id_acessorio`),
  ADD KEY `FK_id_tamanho` (`id_tamanho_automovel`),
  ADD KEY `FK_id_tipo_veiculo8` (`id_tipo_veiculo`);

--
-- Índices para tabela `camioneta_carga`
--
ALTER TABLE `camioneta_carga`
  ADD PRIMARY KEY (`id_camionetaCarga`),
  ADD KEY `FK_capacidade_camioneta_carga` (`id_capacidade`),
  ADD KEY `FK_id_tipo_veiculo7` (`id_tipo_veiculo`);

--
-- Índices para tabela `capacidade_camioneta_carga`
--
ALTER TABLE `capacidade_camioneta_carga`
  ADD PRIMARY KEY (`id_capacidade`);

--
-- Índices para tabela `cliente_locadora`
--
ALTER TABLE `cliente_locadora`
  ADD PRIMARY KEY (`id_cliente`),
  ADD KEY `FK_id_motorista` (`id_motorista`),
  ADD KEY `FK_id_endereco` (`id_endereco`);

--
-- Índices para tabela `cnh`
--
ALTER TABLE `cnh`
  ADD PRIMARY KEY (`id_cnh`);

--
-- Índices para tabela `cor_veiculo_locadora`
--
ALTER TABLE `cor_veiculo_locadora`
  ADD PRIMARY KEY (`id_cor_veiculo_locadora`);

--
-- Índices para tabela `endereco`
--
ALTER TABLE `endereco`
  ADD PRIMARY KEY (`id_endereco`);

--
-- Índices para tabela `filial_locadora`
--
ALTER TABLE `filial_locadora`
  ADD PRIMARY KEY (`id_filial`),
  ADD KEY `FK_endereco3` (`id_endereco`);

--
-- Índices para tabela `locacao`
--
ALTER TABLE `locacao`
  ADD PRIMARY KEY (`id_locacao`),
  ADD KEY `FK_placa_7` (`placa`),
  ADD KEY `FK_id_seguro` (`id_seguro`);

--
-- Índices para tabela `modelo_veiculo_locadora`
--
ALTER TABLE `modelo_veiculo_locadora`
  ADD PRIMARY KEY (`id_modelo_veiculo`);

--
-- Índices para tabela `motorista_locadora`
--
ALTER TABLE `motorista_locadora`
  ADD PRIMARY KEY (`id_motorista`),
  ADD KEY `FK_id_cnh` (`id_cnh`);

--
-- Índices para tabela `pessoa_fisica_locadora`
--
ALTER TABLE `pessoa_fisica_locadora`
  ADD PRIMARY KEY (`CPF`),
  ADD KEY `FK_id_cliente` (`id_cliente`);

--
-- Índices para tabela `pessoa_juridica_locadora`
--
ALTER TABLE `pessoa_juridica_locadora`
  ADD PRIMARY KEY (`CNPJ`),
  ADD KEY `FK_id_cliente_2` (`id_cliente`);

--
-- Índices para tabela `reserva_locadora`
--
ALTER TABLE `reserva_locadora`
  ADD PRIMARY KEY (`id_reserva`),
  ADD KEY `FK_id_tipo_veiculo3` (`id_tipo_veiculo`),
  ADD KEY `FK_id_cliente_locadora2` (`id_cliente`),
  ADD KEY ` FK_Filial_Entrega` (`filial_entrega`),
  ADD KEY `FK_Filial_Reserva` (`filial_reserva`);

--
-- Índices para tabela `revisao_entrega_locadora`
--
ALTER TABLE `revisao_entrega_locadora`
  ADD PRIMARY KEY (`id_revisao_entrega`),
  ADD KEY `FK_id_status_revisao_` (`id_status_revisao`);

--
-- Índices para tabela `seguro_locadora`
--
ALTER TABLE `seguro_locadora`
  ADD PRIMARY KEY (`id_seguro`),
  ADD KEY `FK_id_motorista2` (`id_motorista`),
  ADD KEY `FK_id_status_seguro6` (`id_status_seguro`);

--
-- Índices para tabela `status_revisao`
--
ALTER TABLE `status_revisao`
  ADD PRIMARY KEY (`id_status_revisao`);

--
-- Índices para tabela `status_seguro`
--
ALTER TABLE `status_seguro`
  ADD PRIMARY KEY (`id_status_seguro`);

--
-- Índices para tabela `tamanho_automovel`
--
ALTER TABLE `tamanho_automovel`
  ADD PRIMARY KEY (`id_tamanho`);

--
-- Índices para tabela `tipo_veiculo_locadora`
--
ALTER TABLE `tipo_veiculo_locadora`
  ADD PRIMARY KEY (`id_tipo_veiculo`),
  ADD KEY `FK_id_revisao_entrega5` (`id_revisao_entrega`);

--
-- Índices para tabela `veiculo_locadora`
--
ALTER TABLE `veiculo_locadora`
  ADD PRIMARY KEY (`placa`),
  ADD KEY `FK_id_tipo_veiculo4` (`id_tipo_veiculo`),
  ADD KEY `FK_id_filial_alocado` (`id_filial_alocado`),
  ADD KEY `FK_cor` (`id_cor_veiculo_locadora`),
  ADD KEY `FK_modelo` (`id_modelo_veiculo`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `acessorio_automovel`
--
ALTER TABLE `acessorio_automovel`
  MODIFY `acessorio_automovel` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de tabela `automovel`
--
ALTER TABLE `automovel`
  MODIFY `id_automovelPassageiro` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT de tabela `camioneta_carga`
--
ALTER TABLE `camioneta_carga`
  MODIFY `id_camionetaCarga` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT de tabela `capacidade_camioneta_carga`
--
ALTER TABLE `capacidade_camioneta_carga`
  MODIFY `id_capacidade` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de tabela `cliente_locadora`
--
ALTER TABLE `cliente_locadora`
  MODIFY `id_cliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de tabela `cnh`
--
ALTER TABLE `cnh`
  MODIFY `id_cnh` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de tabela `cor_veiculo_locadora`
--
ALTER TABLE `cor_veiculo_locadora`
  MODIFY `id_cor_veiculo_locadora` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de tabela `endereco`
--
ALTER TABLE `endereco`
  MODIFY `id_endereco` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de tabela `filial_locadora`
--
ALTER TABLE `filial_locadora`
  MODIFY `id_filial` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de tabela `locacao`
--
ALTER TABLE `locacao`
  MODIFY `id_locacao` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT de tabela `modelo_veiculo_locadora`
--
ALTER TABLE `modelo_veiculo_locadora`
  MODIFY `id_modelo_veiculo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de tabela `motorista_locadora`
--
ALTER TABLE `motorista_locadora`
  MODIFY `id_motorista` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de tabela `reserva_locadora`
--
ALTER TABLE `reserva_locadora`
  MODIFY `id_reserva` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de tabela `revisao_entrega_locadora`
--
ALTER TABLE `revisao_entrega_locadora`
  MODIFY `id_revisao_entrega` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de tabela `seguro_locadora`
--
ALTER TABLE `seguro_locadora`
  MODIFY `id_seguro` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de tabela `status_revisao`
--
ALTER TABLE `status_revisao`
  MODIFY `id_status_revisao` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `status_seguro`
--
ALTER TABLE `status_seguro`
  MODIFY `id_status_seguro` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `tamanho_automovel`
--
ALTER TABLE `tamanho_automovel`
  MODIFY `id_tamanho` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `tipo_veiculo_locadora`
--
ALTER TABLE `tipo_veiculo_locadora`
  MODIFY `id_tipo_veiculo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `automovel`
--
ALTER TABLE `automovel`
  ADD CONSTRAINT `FK_id_acessorio` FOREIGN KEY (`id_acessorio`) REFERENCES `acessorio_automovel` (`acessorio_automovel`),
  ADD CONSTRAINT `FK_id_tamanho` FOREIGN KEY (`id_tamanho_automovel`) REFERENCES `tamanho_automovel` (`id_tamanho`),
  ADD CONSTRAINT `FK_id_tipo_veiculo8` FOREIGN KEY (`id_tipo_veiculo`) REFERENCES `tipo_veiculo_locadora` (`id_tipo_veiculo`);

--
-- Limitadores para a tabela `camioneta_carga`
--
ALTER TABLE `camioneta_carga`
  ADD CONSTRAINT `FK_capacidade_camioneta_carga` FOREIGN KEY (`id_capacidade`) REFERENCES `capacidade_camioneta_carga` (`id_capacidade`),
  ADD CONSTRAINT `FK_id_tipo_veiculo7` FOREIGN KEY (`id_tipo_veiculo`) REFERENCES `tipo_veiculo_locadora` (`id_tipo_veiculo`);

--
-- Limitadores para a tabela `cliente_locadora`
--
ALTER TABLE `cliente_locadora`
  ADD CONSTRAINT `FK_id_endereco` FOREIGN KEY (`id_endereco`) REFERENCES `endereco` (`id_endereco`),
  ADD CONSTRAINT `FK_id_motorista` FOREIGN KEY (`id_motorista`) REFERENCES `motorista_locadora` (`id_motorista`);

--
-- Limitadores para a tabela `filial_locadora`
--
ALTER TABLE `filial_locadora`
  ADD CONSTRAINT `FK_endereco3` FOREIGN KEY (`id_endereco`) REFERENCES `endereco` (`id_endereco`);

--
-- Limitadores para a tabela `locacao`
--
ALTER TABLE `locacao`
  ADD CONSTRAINT `FK_id_seguro` FOREIGN KEY (`id_seguro`) REFERENCES `seguro_locadora` (`id_seguro`),
  ADD CONSTRAINT `FK_placa_7` FOREIGN KEY (`placa`) REFERENCES `veiculo_locadora` (`placa`);

--
-- Limitadores para a tabela `motorista_locadora`
--
ALTER TABLE `motorista_locadora`
  ADD CONSTRAINT `FK_id_cnh` FOREIGN KEY (`id_cnh`) REFERENCES `cnh` (`id_cnh`);

--
-- Limitadores para a tabela `pessoa_fisica_locadora`
--
ALTER TABLE `pessoa_fisica_locadora`
  ADD CONSTRAINT `FK_id_cliente` FOREIGN KEY (`id_cliente`) REFERENCES `cliente_locadora` (`id_cliente`);

--
-- Limitadores para a tabela `pessoa_juridica_locadora`
--
ALTER TABLE `pessoa_juridica_locadora`
  ADD CONSTRAINT `FK_id_cliente_2` FOREIGN KEY (`id_cliente`) REFERENCES `cliente_locadora` (`id_cliente`);

--
-- Limitadores para a tabela `reserva_locadora`
--
ALTER TABLE `reserva_locadora`
  ADD CONSTRAINT ` FK_Filial_Entrega` FOREIGN KEY (`filial_entrega`) REFERENCES `filial_locadora` (`id_filial`),
  ADD CONSTRAINT `FK_Filial_Reserva` FOREIGN KEY (`filial_reserva`) REFERENCES `filial_locadora` (`id_filial`),
  ADD CONSTRAINT `FK_id_cliente_locadora2` FOREIGN KEY (`id_cliente`) REFERENCES `cliente_locadora` (`id_cliente`),
  ADD CONSTRAINT `FK_id_tipo_veiculo3` FOREIGN KEY (`id_tipo_veiculo`) REFERENCES `tipo_veiculo_locadora` (`id_tipo_veiculo`);

--
-- Limitadores para a tabela `revisao_entrega_locadora`
--
ALTER TABLE `revisao_entrega_locadora`
  ADD CONSTRAINT `FK_id_status_revisao_` FOREIGN KEY (`id_status_revisao`) REFERENCES `status_revisao` (`id_status_revisao`);

--
-- Limitadores para a tabela `seguro_locadora`
--
ALTER TABLE `seguro_locadora`
  ADD CONSTRAINT `FK_id_motorista2` FOREIGN KEY (`id_motorista`) REFERENCES `motorista_locadora` (`id_motorista`),
  ADD CONSTRAINT `FK_id_status_seguro6` FOREIGN KEY (`id_status_seguro`) REFERENCES `status_seguro` (`id_status_seguro`);

--
-- Limitadores para a tabela `tipo_veiculo_locadora`
--
ALTER TABLE `tipo_veiculo_locadora`
  ADD CONSTRAINT `FK_id_revisao_entrega5` FOREIGN KEY (`id_revisao_entrega`) REFERENCES `revisao_entrega_locadora` (`id_revisao_entrega`);

--
-- Limitadores para a tabela `veiculo_locadora`
--
ALTER TABLE `veiculo_locadora`
  ADD CONSTRAINT `FK_cor` FOREIGN KEY (`id_cor_veiculo_locadora`) REFERENCES `cor_veiculo_locadora` (`id_cor_veiculo_locadora`),
  ADD CONSTRAINT `FK_id_filial_alocado` FOREIGN KEY (`id_filial_alocado`) REFERENCES `filial_locadora` (`id_filial`),
  ADD CONSTRAINT `FK_id_tipo_veiculo4` FOREIGN KEY (`id_tipo_veiculo`) REFERENCES `tipo_veiculo_locadora` (`id_tipo_veiculo`),
  ADD CONSTRAINT `FK_modelo` FOREIGN KEY (`id_modelo_veiculo`) REFERENCES `modelo_veiculo_locadora` (`id_modelo_veiculo`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
