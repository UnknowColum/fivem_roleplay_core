-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le :  ven. 04 mai 2018 à 17:36
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
-- Base de données :  `fivem_itexzoz`
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
  `player_dirty_money` double NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `server_configuration`
--

CREATE TABLE `server_configuration` (
  `id` int(11) NOT NULL,
  `player_first_spawn_location` varchar(255) NOT NULL,
  `pvp_status` varchar(255) NOT NULL DEFAULT 'true',
  `default_player_money` int(11) NOT NULL,
  `default_player_bank_balance` int(11) NOT NULL,
  `default_player_dirty_money` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `server_configuration`
--

INSERT INTO `server_configuration` (`id`, `player_first_spawn_location`, `pvp_status`, `default_player_money`, `default_player_bank_balance`, `default_player_dirty_money`) VALUES
(1, '{-1015.0816650391, -2752.2185058594,  0.80036240816116, 134.05169677734}', 'false', 10, 20, 30);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `player_account`
--
ALTER TABLE `player_account`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `server_configuration`
--
ALTER TABLE `server_configuration`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `player_account`
--
ALTER TABLE `player_account`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `server_configuration`
--
ALTER TABLE `server_configuration`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
