-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le :  sam. 16 juin 2018 à 13:36
-- Version du serveur :  10.1.30-MariaDB
-- Version de PHP :  7.2.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `gta5_gamemode_essential`
--

-- --------------------------------------------------------

--
-- Structure de la table `player_account`
--

CREATE TABLE `player_account` (
  `id` int(11) NOT NULL,
  `player_first_spawn` varchar(255) NOT NULL DEFAULT 'first_spawn',
  `player_identifier` varchar(255) CHARACTER SET utf8mb4 NOT NULL DEFAULT '',
  `player_health` varchar(255) NOT NULL DEFAULT '200',
  `player_position` text NOT NULL,
  `player_group` varchar(50) NOT NULL DEFAULT '0',
  `player_permission_level` int(11) NOT NULL DEFAULT '0',
  `player_money` double NOT NULL DEFAULT '0',
  `player_bank_balance` int(32) DEFAULT '0',
  `player_dirty_money` double NOT NULL DEFAULT '0',
  `player_death_count` varchar(255) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `player_account`
--
ALTER TABLE `player_account`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `player_account`
--
ALTER TABLE `player_account`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
