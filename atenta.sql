-- phpMyAdmin SQL Dump
-- version 4.3.8deb0.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Feb 21, 2016 at 03:36 PM
-- Server version: 5.6.25-3+deb.sury.org~trusty+1
-- PHP Version: 5.5.9-1ubuntu4.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `atenta`
--

-- --------------------------------------------------------

--
-- Table structure for table `compra`
--

CREATE TABLE IF NOT EXISTS `compra` (
  `id` int(11) NOT NULL,
  `mercado` varchar(200) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `id_usuario` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `compra`
--

INSERT INTO `compra` (`id`, `mercado`, `date`, `id_usuario`) VALUES
(4, 'Estrela Dalva', '2016-03-29', NULL),
(5, 'Formosa', '2016-06-01', NULL),
(7, 'Formosa', '2016-03-01', NULL),
(8, 'teste', '1991-03-21', NULL),
(9, 'teste', '1991-03-22', NULL),
(10, 'Mercantil ', '2020-03-29', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `mercado`
--

CREATE TABLE IF NOT EXISTS `mercado` (
  `id` int(11) NOT NULL,
  `nome` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `produto`
--

CREATE TABLE IF NOT EXISTS `produto` (
  `id` int(11) NOT NULL,
  `nome` varchar(200) DEFAULT NULL,
  `marca` varchar(200) DEFAULT NULL,
  `valor` double DEFAULT NULL,
  `validade` date DEFAULT NULL,
  `tipo` varchar(200) DEFAULT NULL,
  `consumido` tinyint(1) DEFAULT NULL,
  `id_compra` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `produto`
--

INSERT INTO `produto` (`id`, `nome`, `marca`, `valor`, `validade`, `tipo`, `consumido`, `id_compra`) VALUES
(3, 'Manteiga 2', 'Primor', 3, '2016-03-20', 'Enlatados', 0, 4),
(4, 'Salcicha', 'Target', 4.5, '2016-03-20', 'Frios', 0, 4),
(5, 'Cerveja', 'Itaipava', 6.2, '2017-03-22', 'Enlatados', 0, 5);

-- --------------------------------------------------------

--
-- Table structure for table `usuario`
--

CREATE TABLE IF NOT EXISTS `usuario` (
  `id` int(11) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `senha` varchar(100) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `usuario`
--

INSERT INTO `usuario` (`id`, `email`, `senha`) VALUES
(1, 'laerte@test.com', 'teste');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `compra`
--
ALTER TABLE `compra`
  ADD PRIMARY KEY (`id`), ADD KEY `id_mercado` (`mercado`), ADD KEY `id_usuario` (`id_usuario`);

--
-- Indexes for table `mercado`
--
ALTER TABLE `mercado`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `produto`
--
ALTER TABLE `produto`
  ADD PRIMARY KEY (`id`), ADD KEY `id_compra` (`id_compra`), ADD KEY `id_compra_2` (`id_compra`);

--
-- Indexes for table `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `compra`
--
ALTER TABLE `compra`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `produto`
--
ALTER TABLE `produto`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `compra`
--
ALTER TABLE `compra`
ADD CONSTRAINT `fk_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id`);

--
-- Constraints for table `produto`
--
ALTER TABLE `produto`
ADD CONSTRAINT `fk_compra` FOREIGN KEY (`id_compra`) REFERENCES `compra` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
