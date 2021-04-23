-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 23-Abr-2021 às 02:31
-- Versão do servidor: 10.4.18-MariaDB
-- versão do PHP: 7.3.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `db_utd_loja`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `categoria`
--

CREATE TABLE `categoria` (
  `codcategoria` int(11) NOT NULL,
  `categoria` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `cidade`
--

CREATE TABLE `cidade` (
  `codcidade` int(11) NOT NULL,
  `cidade` varchar(255) DEFAULT NULL,
  `uf` char(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `entrada`
--

CREATE TABLE `entrada` (
  `codentrada` int(11) NOT NULL,
  `Transportadora_codtransportadora` int(11) DEFAULT NULL,
  `dataped` date DEFAULT NULL,
  `dataentr` date DEFAULT NULL,
  `total` double DEFAULT NULL,
  `frete` double DEFAULT NULL,
  `numnf` int(11) DEFAULT NULL,
  `imposto` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `fornecedor`
--

CREATE TABLE `fornecedor` (
  `codfornecedor` int(11) NOT NULL,
  `Cidade_codcidade` int(11) DEFAULT NULL,
  `fornecedor` varchar(255) DEFAULT NULL,
  `endereco` varchar(255) DEFAULT NULL,
  `num` int(11) DEFAULT NULL,
  `bairro` varchar(255) DEFAULT NULL,
  `cep` char(9) DEFAULT NULL,
  `contato` varchar(255) DEFAULT NULL,
  `cnpj` char(18) DEFAULT NULL,
  `insc` varchar(255) DEFAULT NULL,
  `tel` char(14) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `itementrada`
--

CREATE TABLE `itementrada` (
  `coditementrada` int(11) NOT NULL,
  `Produto_codproduto` int(11) DEFAULT NULL,
  `Entrada_codentrada` int(11) DEFAULT NULL,
  `lote` varchar(255) DEFAULT NULL,
  `qdte` int(11) DEFAULT NULL,
  `valor` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `itemsaida`
--

CREATE TABLE `itemsaida` (
  `coditemsaida` int(11) NOT NULL,
  `Saida_codsaida` int(11) DEFAULT NULL,
  `Produto_codproduto` int(11) DEFAULT NULL,
  `lote` varchar(255) DEFAULT NULL,
  `qdte` int(11) DEFAULT NULL,
  `valor` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `loja`
--

CREATE TABLE `loja` (
  `codloja` int(11) NOT NULL,
  `Cidade_codcidade` int(11) DEFAULT NULL,
  `nome` varchar(255) DEFAULT NULL,
  `endereco` varchar(255) DEFAULT NULL,
  `num` int(11) DEFAULT NULL,
  `bairro` varchar(255) DEFAULT NULL,
  `tel` char(14) DEFAULT NULL,
  `insc` varchar(255) DEFAULT NULL,
  `cnpj` char(18) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `produto`
--

CREATE TABLE `produto` (
  `codproduto` int(11) NOT NULL,
  `Categoria_codproduto` int(11) DEFAULT NULL,
  `Fornecedor_codfornecedor` int(11) DEFAULT NULL,
  `descricao` varchar(255) DEFAULT NULL,
  `peso` double DEFAULT NULL,
  `controlado` tinyint(1) DEFAULT NULL,
  `qtdemin` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `produto`
--

INSERT INTO `produto` (`codproduto`, `Categoria_codproduto`, `Fornecedor_codfornecedor`, `descricao`, `peso`, `controlado`, `qtdemin`) VALUES
(9, NULL, NULL, 'arroz', 2, 1, 13),
(16, NULL, NULL, 'feijão', 2, 0, 15);

-- --------------------------------------------------------

--
-- Estrutura da tabela `saida`
--

CREATE TABLE `saida` (
  `codsaida` int(11) NOT NULL,
  `Loja_codloja` int(11) DEFAULT NULL,
  `Transportadora_codtransportadora` int(11) DEFAULT NULL,
  `total` double DEFAULT NULL,
  `frete` double DEFAULT NULL,
  `imposto` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_notes`
--

CREATE TABLE `tb_notes` (
  `id_note` int(11) NOT NULL,
  `note_value` float(6,2) DEFAULT NULL,
  `note_desc` varchar(255) DEFAULT NULL,
  `note_date` date DEFAULT NULL,
  `note_created_in` timestamp NULL DEFAULT current_timestamp(),
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_profiles`
--

CREATE TABLE `tb_profiles` (
  `id_profile` int(1) NOT NULL,
  `profile_name` varchar(20) NOT NULL,
  `profile_desc` varchar(255) NOT NULL,
  `profile_page` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `tb_profiles`
--

INSERT INTO `tb_profiles` (`id_profile`, `profile_name`, `profile_desc`, `profile_page`) VALUES
(1, 'Administrador', 'Admin da Poha Toda', 'admin.php'),
(2, 'Funcionário', 'Pião', 'func.php'),
(3, 'Cliente', 'O cara mais chato de todos', 'client.php'),
(4, 'Cliente', 'O cara mais chato de todos', 'client.php'),
(5, 'Super Admin', 'Caf&eacute;, &Aacute;gua', 'super_admin.php'),
(6, 'Super Admin 2', 'Caf&eacute;, &Aacute;gua', 'super_admin.php'),
(7, 'Super Admin 3', 'CafÃƒÂ©, ÃƒÂgua', 'super_admin.php'),
(8, 'Super Admin 4', 'Café, Água', 'super_admin.php');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_users`
--

CREATE TABLE `tb_users` (
  `id_user` int(11) NOT NULL,
  `user_name` varchar(255) DEFAULT NULL,
  `user_email` varchar(255) DEFAULT NULL,
  `user_password` varchar(255) DEFAULT NULL,
  `user_birth` date DEFAULT NULL,
  `user_cpf` varchar(25) DEFAULT NULL,
  `user_phone` varchar(25) DEFAULT NULL,
  `user_cellphone` varchar(25) DEFAULT NULL,
  `user_address` varchar(200) DEFAULT NULL,
  `user_created_in` timestamp NULL DEFAULT current_timestamp(),
  `profile_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `tb_users`
--

INSERT INTO `tb_users` (`id_user`, `user_name`, `user_email`, `user_password`, `user_birth`, `user_cpf`, `user_phone`, `user_cellphone`, `user_address`, `user_created_in`, `profile_id`) VALUES
(1, 'Anthony', 'anthony@email.com', '$2y$10$5Ac.tC/syFSa.dOvpdaryOkIRTBzVoaP/laSW9MLU4o1Q9av6Rb5m', '2019-12-01', '123.123.123-00', '(85) 3099-0000', '(85) 99990-0001', 'Rua Bem Alí', '2019-12-18 13:42:21', 1),
(2, 'Pattricia da Silva de Moura', 'paty@email.com', '$2y$10$cBynHBLrsabx1rCgqQsxvuo4QBZSFRhY6G6On9L/39wSG0i7awdUO', '2001-01-01', '12312312312321', '(85) 3099-0268', '213123213132', 'Rua Bem AlÃ­, 23', '2019-12-18 13:45:32', 2),
(3, 'alex', 'alex@email.com', '12345678', '2000-01-01', '12312312345', '85', '85', 'rua asdf', '2021-04-21 18:19:43', 1),
(4, 'jose', 'jose@email.com', '$2y$10$2ZU5Ok1f.BDwPgRF87X6tO0phY3kby3jRt0L8LW6f8PICmw/TasNO', '2000-01-01', '12345678900', '85', '85', 'rua asdf', '2021-04-21 18:31:52', 1),
(5, 'zezim', 'zezim@email.com', '$2y$10$1ZuhEfeclKlk0tPZssI8z.Bwjp1l2OZyoQq/m2Qgvwnx3aJgPeZoC', '2000-02-01', '12345678966', '86', '86', 'bem ali', '2021-04-21 20:38:28', 1),
(6, 'chiquim', 'chiquim@email.com', '$2y$10$G/KKnBuHPvSuqOeRNZU3m.lFTztuAD24BVVoN7PSUlVZ0XKQq9fi2', '2000-02-01', '12345678977', '87', '87', 'bem acola', '2021-04-21 20:45:32', 1),
(7, 'toim', 'toim@email.com', '$2y$10$la.k/7b4yxwynH9cSNj9met6XZJKrJPVmgcBX1r2TGvW1rENzIPzq', '2020-01-22', '12345678988', '42453453', '88', 'bem ali 2', '2021-04-21 21:00:23', 1),
(11, 'huguim', 'huguim@email.com', '$2y$10$4zdGFh1gzsgwUiLJwdOacuBj5m81W2mObIqaKCh0KCzInqx/2.NVu', '2000-03-01', '12345678000', '89', '89', 'rua sem nome', '2021-04-22 21:43:53', 1),
(12, 'hugui', 'hugui@email.com', '$2y$10$QHdMIwDhGutzcZXbggMOVuWr3EiTkqQbv16191AG2oz6ikLBvZy7G', '2000-05-06', '0011001000', '90', '90', 'rua ali', '2021-04-22 21:53:01', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `transportadora`
--

CREATE TABLE `transportadora` (
  `codtransportadora` int(11) NOT NULL,
  `Cidade_codcidade` int(11) DEFAULT NULL,
  `transpotadora` varchar(255) DEFAULT NULL,
  `endereco` varchar(255) DEFAULT NULL,
  `num` int(11) DEFAULT NULL,
  `bairro` varchar(255) DEFAULT NULL,
  `cep` char(9) DEFAULT NULL,
  `cnpj` char(18) DEFAULT NULL,
  `insc` varchar(255) DEFAULT NULL,
  `contato` varchar(255) DEFAULT NULL,
  `tel` char(14) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`codcategoria`);

--
-- Índices para tabela `cidade`
--
ALTER TABLE `cidade`
  ADD PRIMARY KEY (`codcidade`);

--
-- Índices para tabela `entrada`
--
ALTER TABLE `entrada`
  ADD PRIMARY KEY (`codentrada`),
  ADD KEY `Transportadora_codtransportadora` (`Transportadora_codtransportadora`);

--
-- Índices para tabela `fornecedor`
--
ALTER TABLE `fornecedor`
  ADD PRIMARY KEY (`codfornecedor`),
  ADD KEY `Cidade_codcidade` (`Cidade_codcidade`);

--
-- Índices para tabela `itementrada`
--
ALTER TABLE `itementrada`
  ADD PRIMARY KEY (`coditementrada`),
  ADD KEY `Produto_codproduto` (`Produto_codproduto`),
  ADD KEY `Entrada_codentrada` (`Entrada_codentrada`);

--
-- Índices para tabela `itemsaida`
--
ALTER TABLE `itemsaida`
  ADD PRIMARY KEY (`coditemsaida`),
  ADD KEY `Saida_codsaida` (`Saida_codsaida`),
  ADD KEY `Produto_codproduto` (`Produto_codproduto`);

--
-- Índices para tabela `loja`
--
ALTER TABLE `loja`
  ADD PRIMARY KEY (`codloja`),
  ADD KEY `Cidade_codcidade` (`Cidade_codcidade`);

--
-- Índices para tabela `produto`
--
ALTER TABLE `produto`
  ADD PRIMARY KEY (`codproduto`),
  ADD KEY `Categoria_codproduto` (`Categoria_codproduto`),
  ADD KEY `Fornecedor_codfornecedor` (`Fornecedor_codfornecedor`);

--
-- Índices para tabela `saida`
--
ALTER TABLE `saida`
  ADD PRIMARY KEY (`codsaida`),
  ADD KEY `Transportadora_codtransportadora` (`Transportadora_codtransportadora`),
  ADD KEY `Loja_codloja` (`Loja_codloja`);

--
-- Índices para tabela `tb_notes`
--
ALTER TABLE `tb_notes`
  ADD PRIMARY KEY (`id_note`);

--
-- Índices para tabela `tb_profiles`
--
ALTER TABLE `tb_profiles`
  ADD PRIMARY KEY (`id_profile`);

--
-- Índices para tabela `tb_users`
--
ALTER TABLE `tb_users`
  ADD PRIMARY KEY (`id_user`),
  ADD UNIQUE KEY `user_email` (`user_email`),
  ADD UNIQUE KEY `user_cpf` (`user_cpf`);

--
-- Índices para tabela `transportadora`
--
ALTER TABLE `transportadora`
  ADD PRIMARY KEY (`codtransportadora`),
  ADD KEY `Cidade_codcidade` (`Cidade_codcidade`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `categoria`
--
ALTER TABLE `categoria`
  MODIFY `codcategoria` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `cidade`
--
ALTER TABLE `cidade`
  MODIFY `codcidade` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `entrada`
--
ALTER TABLE `entrada`
  MODIFY `codentrada` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `fornecedor`
--
ALTER TABLE `fornecedor`
  MODIFY `codfornecedor` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `itementrada`
--
ALTER TABLE `itementrada`
  MODIFY `coditementrada` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `itemsaida`
--
ALTER TABLE `itemsaida`
  MODIFY `coditemsaida` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `loja`
--
ALTER TABLE `loja`
  MODIFY `codloja` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `produto`
--
ALTER TABLE `produto`
  MODIFY `codproduto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de tabela `saida`
--
ALTER TABLE `saida`
  MODIFY `codsaida` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_notes`
--
ALTER TABLE `tb_notes`
  MODIFY `id_note` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_profiles`
--
ALTER TABLE `tb_profiles`
  MODIFY `id_profile` int(1) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de tabela `tb_users`
--
ALTER TABLE `tb_users`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de tabela `transportadora`
--
ALTER TABLE `transportadora`
  MODIFY `codtransportadora` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `entrada`
--
ALTER TABLE `entrada`
  ADD CONSTRAINT `entrada_ibfk_1` FOREIGN KEY (`Transportadora_codtransportadora`) REFERENCES `transportadora` (`codtransportadora`);

--
-- Limitadores para a tabela `fornecedor`
--
ALTER TABLE `fornecedor`
  ADD CONSTRAINT `fornecedor_ibfk_1` FOREIGN KEY (`Cidade_codcidade`) REFERENCES `cidade` (`codcidade`);

--
-- Limitadores para a tabela `itementrada`
--
ALTER TABLE `itementrada`
  ADD CONSTRAINT `itementrada_ibfk_1` FOREIGN KEY (`Produto_codproduto`) REFERENCES `produto` (`codproduto`),
  ADD CONSTRAINT `itementrada_ibfk_2` FOREIGN KEY (`Entrada_codentrada`) REFERENCES `entrada` (`codentrada`);

--
-- Limitadores para a tabela `itemsaida`
--
ALTER TABLE `itemsaida`
  ADD CONSTRAINT `itemsaida_ibfk_1` FOREIGN KEY (`Saida_codsaida`) REFERENCES `saida` (`codsaida`),
  ADD CONSTRAINT `itemsaida_ibfk_2` FOREIGN KEY (`Produto_codproduto`) REFERENCES `produto` (`codproduto`);

--
-- Limitadores para a tabela `loja`
--
ALTER TABLE `loja`
  ADD CONSTRAINT `loja_ibfk_1` FOREIGN KEY (`Cidade_codcidade`) REFERENCES `cidade` (`codcidade`);

--
-- Limitadores para a tabela `produto`
--
ALTER TABLE `produto`
  ADD CONSTRAINT `produto_ibfk_1` FOREIGN KEY (`Categoria_codproduto`) REFERENCES `categoria` (`codcategoria`),
  ADD CONSTRAINT `produto_ibfk_2` FOREIGN KEY (`Fornecedor_codfornecedor`) REFERENCES `fornecedor` (`codfornecedor`);

--
-- Limitadores para a tabela `saida`
--
ALTER TABLE `saida`
  ADD CONSTRAINT `saida_ibfk_1` FOREIGN KEY (`Transportadora_codtransportadora`) REFERENCES `transportadora` (`codtransportadora`),
  ADD CONSTRAINT `saida_ibfk_2` FOREIGN KEY (`Loja_codloja`) REFERENCES `loja` (`codloja`);

--
-- Limitadores para a tabela `transportadora`
--
ALTER TABLE `transportadora`
  ADD CONSTRAINT `transportadora_ibfk_1` FOREIGN KEY (`Cidade_codcidade`) REFERENCES `cidade` (`codcidade`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
