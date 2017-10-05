-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 28-Set-2017 às 17:02
-- Versão do servidor: 10.1.19-MariaDB
-- PHP Version: 7.0.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sistema_bancario`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `agencias`
--

CREATE TABLE `agencias` (
  `id` int(11) NOT NULL,
  `numero` varchar(255) NOT NULL,
  `nome` varchar(255) NOT NULL,
  `ativo` tinyint(1) NOT NULL DEFAULT '1',
  `criado` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modificado` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `agencias`
--

INSERT INTO `agencias` (`id`, `numero`, `nome`, `ativo`, `criado`, `modificado`) VALUES
(1, '1213', 'Lins', 1, '2017-08-24 12:03:10', '2017-08-24 12:03:10'),
(2, '1516', 'Ibirapuera', 1, '2017-09-28 11:38:38', '2017-09-28 11:38:38'),
(3, '4444', 'fedgfdfgdg', 1, '2017-09-28 11:55:21', '2017-09-28 11:55:21');

-- --------------------------------------------------------

--
-- Estrutura da tabela `caixas`
--

CREATE TABLE `caixas` (
  `id` int(11) NOT NULL,
  `agencia_id` int(11) NOT NULL,
  `ativo` tinyint(1) NOT NULL DEFAULT '1',
  `criado` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modificado` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `caixas_notas`
--

CREATE TABLE `caixas_notas` (
  `id` int(11) NOT NULL,
  `caixa_id` int(11) NOT NULL,
  `valor` int(11) NOT NULL DEFAULT '0',
  `quantidade` int(11) NOT NULL DEFAULT '0',
  `ativo` tinyint(1) NOT NULL DEFAULT '1',
  `criado` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modificado` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `contas`
--

CREATE TABLE `contas` (
  `id` int(11) NOT NULL,
  `agencia_id` int(11) NOT NULL,
  `numero` varchar(255) NOT NULL,
  `saldo` decimal(10,2) NOT NULL DEFAULT '0.00',
  `usuario_id` int(11) NOT NULL,
  `ativo` tinyint(1) NOT NULL DEFAULT '1',
  `criado` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modificado` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `transacoes`
--

CREATE TABLE `transacoes` (
  `id` int(11) NOT NULL,
  `conta_id` int(11) NOT NULL,
  `conta_destino_id` int(11) NOT NULL,
  `valor` decimal(10,2) NOT NULL DEFAULT '0.00',
  `data` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `criado` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `nome` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `senha` varchar(255) NOT NULL,
  `agencia_id` int(11) NOT NULL,
  `administrador` tinyint(1) NOT NULL,
  `ativo` tinyint(1) NOT NULL DEFAULT '1',
  `criado` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modificado` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `usuarios`
--

INSERT INTO `usuarios` (`id`, `nome`, `email`, `senha`, `agencia_id`, `administrador`, `ativo`, `criado`, `modificado`) VALUES
(1, 'Paulo', 'Salvatore', '1234', 1, 1, 0, '2017-08-24 12:03:27', '2017-08-24 12:03:27');

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuarios_login`
--

CREATE TABLE `usuarios_login` (
  `id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `data` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `agencias`
--
ALTER TABLE `agencias`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `caixas`
--
ALTER TABLE `caixas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `agencia_id` (`agencia_id`);

--
-- Indexes for table `caixas_notas`
--
ALTER TABLE `caixas_notas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `caixa_id` (`caixa_id`);

--
-- Indexes for table `contas`
--
ALTER TABLE `contas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `agencia_id` (`agencia_id`),
  ADD KEY `usuario_id` (`usuario_id`);

--
-- Indexes for table `transacoes`
--
ALTER TABLE `transacoes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `conta_id` (`conta_id`),
  ADD KEY `conta_destino_id` (`conta_destino_id`);

--
-- Indexes for table `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD KEY `agencia_id` (`agencia_id`);

--
-- Indexes for table `usuarios_login`
--
ALTER TABLE `usuarios_login`
  ADD PRIMARY KEY (`id`),
  ADD KEY `usuario_id` (`usuario_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `agencias`
--
ALTER TABLE `agencias`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `caixas`
--
ALTER TABLE `caixas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `caixas_notas`
--
ALTER TABLE `caixas_notas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `contas`
--
ALTER TABLE `contas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `transacoes`
--
ALTER TABLE `transacoes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `usuarios_login`
--
ALTER TABLE `usuarios_login`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `caixas`
--
ALTER TABLE `caixas`
  ADD CONSTRAINT `caixas_ibfk_1` FOREIGN KEY (`agencia_id`) REFERENCES `agencias` (`id`);

--
-- Limitadores para a tabela `caixas_notas`
--
ALTER TABLE `caixas_notas`
  ADD CONSTRAINT `caixas_notas_ibfk_1` FOREIGN KEY (`caixa_id`) REFERENCES `caixas` (`id`);

--
-- Limitadores para a tabela `contas`
--
ALTER TABLE `contas`
  ADD CONSTRAINT `contas_ibfk_1` FOREIGN KEY (`agencia_id`) REFERENCES `agencias` (`id`),
  ADD CONSTRAINT `contas_ibfk_2` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`);

--
-- Limitadores para a tabela `transacoes`
--
ALTER TABLE `transacoes`
  ADD CONSTRAINT `transacoes_ibfk_1` FOREIGN KEY (`conta_id`) REFERENCES `contas` (`id`),
  ADD CONSTRAINT `transacoes_ibfk_2` FOREIGN KEY (`conta_destino_id`) REFERENCES `contas` (`id`);

--
-- Limitadores para a tabela `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `usuarios_ibfk_1` FOREIGN KEY (`agencia_id`) REFERENCES `agencias` (`id`);

--
-- Limitadores para a tabela `usuarios_login`
--
ALTER TABLE `usuarios_login`
  ADD CONSTRAINT `usuarios_login_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
