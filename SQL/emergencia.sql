-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 02-Out-2018 às 02:32
-- Versão do servidor: 10.1.30-MariaDB
-- PHP Version: 7.2.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `emergencia`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `cidadao`
--

CREATE TABLE `cidadao` (
  `id` int(10) UNSIGNED NOT NULL,
  `nome` varchar(60) NOT NULL,
  `cpf` varchar(11) NOT NULL,
  `telefone` varchar(11) NOT NULL,
  `endereco` varchar(80) NOT NULL,
  `cidade` varchar(60) NOT NULL,
  `estado` varchar(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `cidadao`
--

INSERT INTO `cidadao` (`id`, `nome`, `cpf`, `telefone`, `endereco`, `cidade`, `estado`) VALUES
(1, 'João Paulo Koerich', '06994260909', '47997536644', 'Rua Gervásio Dechamps-212', 'Blumenau', 'SC'),
(2, 'Carlos Alberto', '02569874509', '47665544331', 'Rua 2 de Setembro-1054', 'Blumenau', 'SC'),
(3, 'Felipe Amorin', '12547845806', '22556699882', 'Rua 21 de Abril-105', 'Indaial', 'SC'),
(4, 'Amanda Rodrigues', '58969854269', '87456932103', 'Rua Hermann Tribess-24', 'São Paulo', 'SP'),
(5, 'Bianca Koerich', '12345678902', '56897412523', 'Rua Geosvaldo Tenoro-222', 'Rio de Janeiro', 'RJ'),
(19, 'Raffael Martins de Morais ', '10040144658', '47988493862', 'Rua Antonio da Veiga,555-ap407 ', 'Blumenau', 'SC');

-- --------------------------------------------------------

--
-- Estrutura da tabela `emergencia`
--

CREATE TABLE `emergencia` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_cidadao` int(10) UNSIGNED NOT NULL,
  `data_hora` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `situacao` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `emergencia`
--

INSERT INTO `emergencia` (`id`, `id_cidadao`, `data_hora`, `situacao`) VALUES
(1, 1, '2018-10-01 03:00:00', 0),
(2, 2, '2018-10-01 03:00:00', 0),
(3, 3, '2018-10-01 03:00:00', 0),
(4, 4, '2018-10-01 03:00:00', 2),
(5, 4, '2018-10-01 03:00:00', 0),
(20, 19, '2018-10-01 03:00:00', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuario`
--

CREATE TABLE `usuario` (
  `id` int(10) UNSIGNED NOT NULL,
  `nome` varchar(60) NOT NULL,
  `login` varchar(60) NOT NULL,
  `senha` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `usuario`
--

INSERT INTO `usuario` (`id`, `nome`, `login`, `senha`) VALUES
(1, 'Administrador', 'admin', 'F6FDFFE48C908DEB0F4C3BD36C032E72');

-- --------------------------------------------------------

--
-- Stand-in structure for view `vw_civil`
-- (See below for the actual view)
--
CREATE TABLE `vw_civil` (
`Id.` int(10) unsigned
,`Nome` varchar(60)
,`CPF` varchar(11)
,`Endereço` varchar(80)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `vw_emergencia`
-- (See below for the actual view)
--
CREATE TABLE `vw_emergencia` (
`Id.` int(10) unsigned
,`Situação` tinyint(4)
,`Desc. Situação` varchar(14)
,`Data e Hora` timestamp
,`Nome do Cidadão` varchar(60)
,`CPF` varchar(11)
,`Tel.` varchar(11)
,`Endereço` varchar(80)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `vw_resumo_ocorrencia_cidade`
-- (See below for the actual view)
--
CREATE TABLE `vw_resumo_ocorrencia_cidade` (
`Cidade` varchar(60)
,`total_ocorrencias` bigint(21)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `vw_usuario`
-- (See below for the actual view)
--
CREATE TABLE `vw_usuario` (
`Cód.` int(10) unsigned
,`login` varchar(60)
,`Nome` varchar(60)
);

-- --------------------------------------------------------

--
-- Structure for view `vw_civil`
--
DROP TABLE IF EXISTS `vw_civil`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_civil`  AS  select `ci`.`id` AS `Id.`,`ci`.`nome` AS `Nome`,`ci`.`cpf` AS `CPF`,`ci`.`endereco` AS `Endereço` from `cidadao` `ci` ;

-- --------------------------------------------------------

--
-- Structure for view `vw_emergencia`
--
DROP TABLE IF EXISTS `vw_emergencia`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_emergencia`  AS  select `em`.`id` AS `Id.`,`em`.`situacao` AS `Situação`,(case `em`.`situacao` when 0 then 'Pendente' when 1 then 'Em Atendimento' when 2 then 'Concluída' end) AS `Desc. Situação`,`em`.`data_hora` AS `Data e Hora`,`ci`.`nome` AS `Nome do Cidadão`,`ci`.`cpf` AS `CPF`,`ci`.`telefone` AS `Tel.`,`ci`.`endereco` AS `Endereço` from (`cidadao` `ci` join `emergencia` `em`) where (`ci`.`id` = `em`.`id_cidadao`) ;

-- --------------------------------------------------------

--
-- Structure for view `vw_resumo_ocorrencia_cidade`
--
DROP TABLE IF EXISTS `vw_resumo_ocorrencia_cidade`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_resumo_ocorrencia_cidade`  AS  select `ci`.`cidade` AS `Cidade`,count(`ci`.`nome`) AS `total_ocorrencias` from `cidadao` `ci` ;

-- --------------------------------------------------------

--
-- Structure for view `vw_usuario`
--
DROP TABLE IF EXISTS `vw_usuario`;

CREATE ALGORITHM=UNDEFINED DEFINER=`trabalhobanca`@`localhost` SQL SECURITY DEFINER VIEW `vw_usuario`  AS  select `usuario`.`id` AS `Cód.`,`usuario`.`login` AS `login`,`usuario`.`nome` AS `Nome` from `usuario` ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cidadao`
--
ALTER TABLE `cidadao`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uk_cpf` (`cpf`);

--
-- Indexes for table `emergencia`
--
ALTER TABLE `emergencia`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ind_id_cidadao` (`id_cidadao`);

--
-- Indexes for table `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uk_nome` (`nome`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cidadao`
--
ALTER TABLE `cidadao`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `emergencia`
--
ALTER TABLE `emergencia`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `emergencia`
--
ALTER TABLE `emergencia`
  ADD CONSTRAINT `fk_emergencia_cidadao` FOREIGN KEY (`id_cidadao`) REFERENCES `cidadao` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
