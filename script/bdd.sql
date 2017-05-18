-- phpMyAdmin SQL Dump
-- version 4.2.12deb2+deb8u2
-- http://www.phpmyadmin.net
--
-- Client :  localhost
-- Généré le :  Jeu 18 Mai 2017 à 19:43
-- Version du serveur :  5.5.52-0+deb8u1
-- Version de PHP :  5.6.27-0+deb8u1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données :  `arbreetnature`
--

-- --------------------------------------------------------

--
-- Structure de la table `configs`
--

CREATE TABLE IF NOT EXISTS `configs` (
`id` smallint(5) unsigned NOT NULL,
  `tag` varchar(50) NOT NULL,
  `valeur` varchar(500) NOT NULL,
  `description` varchar(255) NOT NULL DEFAULT '',
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `acces_client` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'le client peut il modifier la valeur?',
  `type` enum('core','general','css','font') NOT NULL DEFAULT 'general'
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

--
-- Contenu de la table `configs`
--

INSERT INTO `configs` (`id`, `tag`, `valeur`, `description`, `date`, `acces_client`, `type`) VALUES
(1, 'nom_site', 'Arbre &amp; Nature', 'Nom du site', '0000-00-00 00:00:00', 0, 'core'),
(2, 'slogan', '27 années au service de vos jardins!!', 'phrase affichée dans le premier écran de la page d''accueil', '2017-05-18 17:37:33', 1, 'general'),
(3, 'titre_home', 'Arbre &amp; Nature**', 'titre affiché dans le 1er écran de la homepage', '2017-05-18 16:47:11', 1, 'general'),
(4, 'cp', '27170', 'votre code postal', '2017-05-18 16:47:22', 1, 'general'),
(5, 'ville', 'Beaumontel', 'la ville de vos locaux', '2017-05-18 16:47:34', 1, 'general'),
(6, 'tel', '02 32 44 17 24', 'votre numéro de téléphone', '2017-05-18 16:47:47', 1, 'general'),
(7, 'mail', 'arbresetnature27@wanadoo.fr', 'votre adresse mail', '2017-05-18 16:48:52', 1, 'general'),
(8, 'adresse', '16, rue de Beaumont-la-Ville', 'adresse de vos locaux', '2017-05-18 16:49:03', 1, 'general'),
(9, 'open_hours', '                          ', '', '2017-05-18 16:49:24', 0, 'general'),
(11, 'news_par_page', '6', 'nombre d''lémént listés par pagination dans les pages de section', '2017-05-18 17:14:10', 0, 'general'),
(12, 'taille_miniatures', '[370, 220]', '', '0000-00-00 00:00:00', 0, 'core'),
(13, 'separateur_menu', '๑', 'sépare les éléments du menu', '2017-05-18 16:49:35', 0, 'general'),
(18, 'txt_inter1', 'Aménagez votre jardin ...', 'message entre les deux 1er écrans de la home', '2017-05-18 16:52:46', 1, 'general'),
(19, 'txt_inter2', 'Et bien plus...', 'message entre le 2eme et 3eme écran de la homepage', '2017-05-18 17:36:22', 1, 'general'),
(20, 'txt_screen2', 'Terrasses, Pergolas, Treillages…', 'message affiché dans l''écran 2', '2017-05-18 16:53:10', 0, 'general'),
(21, 'txt_screen1', 'L''Art de la Nature.', 'message affiché dans l''écran1', '2017-05-18 16:53:15', 0, 'general'),
(24, 'color', '0c3d01', 'code hexa de la couleur du texte', '2017-05-18 16:53:27', 0, 'css'),
(25, 'background-color', 'DCEED8', 'couleur de fond du site', '2017-05-18 16:53:31', 0, 'css'),
(26, 'couleur_lien', '262125', 'couleur des liens', '2017-05-18 16:53:38', 0, 'css'),
(27, 'couleur_lien_actif', 'e31051', 'couleur des liens actifs ou survolés', '2017-05-18 16:53:45', 0, 'css'),
(28, 'url_google_map', 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d2612.954028693254!2d0.7825544156824915!3d49.08751387931062!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x47e10c79b143362d%3A0x96105327c5863d70!2s16+Rue+de+Beaumont+la+ville%2C+27170+Beaumont-le-Roger!5e0!3m2!1sfr!2sfr!4v1493224962711', 'url embed google maps', '2017-05-18 16:53:56', 0, 'core');

-- --------------------------------------------------------

--
-- Structure de la table `contacts`
--

CREATE TABLE IF NOT EXISTS `contacts` (
`id` int(10) unsigned NOT NULL,
  `nom` varchar(100) NOT NULL,
  `prenom` varchar(100) NOT NULL,
  `tel` varchar(50) NOT NULL,
  `adresse` varchar(255) NOT NULL,
  `cp` varchar(10) NOT NULL,
  `ville` varchar(100) NOT NULL,
  `note` text NOT NULL,
  `mail` varchar(100) NOT NULL,
  `type_contact` enum('form_contact','livreor','client','') NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

--
-- Contenu de la table `contacts`
--

INSERT INTO `contacts` (`id`, `nom`, `prenom`, `tel`, `adresse`, `cp`, `ville`, `note`, `mail`, `type_contact`, `date`) VALUES
(1, 'test', 'test', '00.00.00.00.00', '5 rue des tests', '50000', 'VilleTest', 'c''est un boulet celui là', 'test@test.fr', 'livreor', '2017-05-11 12:24:04'),
(8, 'nom', 'prenom', '', '', '', '', 'les gamins lui jettent des pierres', 'ttt@test.com', 'livreor', '2017-05-11 12:22:56'),
(9, 'bla', 'blabla', '', '', '', '', '', 'blabla@bla.fr', 'livreor', '2017-05-11 10:01:04'),
(10, 'bidule', 'machin', '', '', '', '', 'on l''aime bien au village...', 'machinbidule@truc.com', 'livreor', '2017-05-11 12:19:31'),
(11, 'test', 'dernier', '', '', '', '', '', 'derniertest@test.fr', 'livreor', '2017-05-11 10:16:43'),
(12, 'Gonzola', 'Igor', '', '', '', '', 'Igor.... Gonzola.... Du lourd, du très lourd...', 'igorgonzola@truc.com', 'form_contact', '2017-05-14 13:44:05'),
(13, 'Tarsèche', 'Guy', '', '', '', '', 'Celui là j''ai dû le lire à haute voix pour comprendre lol', 'guytarseche@bidule.fr', 'form_contact', '2017-05-14 13:44:49');

-- --------------------------------------------------------

--
-- Structure de la table `droits`
--

CREATE TABLE IF NOT EXISTS `droits` (
`id` int(5) unsigned NOT NULL,
  `niveau` varchar(50) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Contenu de la table `droits`
--

INSERT INTO `droits` (`id`, `niveau`) VALUES
(1, 'god'),
(2, 'administrateur'),
(3, 'contributeur');

-- --------------------------------------------------------

--
-- Structure de la table `livreor`
--

CREATE TABLE IF NOT EXISTS `livreor` (
  `id` smallint(11) NOT NULL,
  `date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `nom` varchar(50) NOT NULL,
  `message` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Contenu de la table `livreor`
--

INSERT INTO `livreor` (`id`, `date`, `nom`, `message`) VALUES
(3, '2016-12-03 13:05:54', 'Moe', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut sit amet volutpat nunc, id fermentum magna. Vivamus velit nunc, aliquet sed mauris vitae, tristique pretium nisi. Pellentesque et nunc aliquam, aliquam urna sed, mollis orci. Vivamus suscipit erat nec ante faucibus imperdiet. Integer sit amet est eget turpis tincidunt luctus.'),
(2, '2016-12-02 15:29:38', 'Josiane F.', 'blablalblabla'),
(4, '2016-12-03 13:05:54', 'Gigi', 'Donec sollicitudin vestibulum augue, vitae vulputate sapien posuere a. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec sem lectus, congue quis massa nec, auctor rutrum tellus. Mauris a cursus eros, facilisis vestibulum nibh. Morbi orci velit, condimentum et justo sit amet, bibendum tempus nulla.'),
(5, '2016-12-05 14:35:35', 'Josiane H.', 'Nullam porta eros sit amet nunc euismod sollicitudin. Duis lacinia ornare accumsan. Ut eu ipsum pellentesque dui fringilla condimentum eu vel purus. In pellentesque quam faucibus imperdiet fermentum.'),
(6, '2016-12-05 14:35:35', 'Nanou62', 'Nulla porta, odio porttitor tincidunt feugiat, quam ligula consequat magna, tincidunt ultricies ante lectus vel quam. '),
(7, '2016-12-05 14:36:39', 'Bubulle Guy', 'Duis tincidunt ligula non lectus laoreet, sed vulputate libero ullamcorper. Nunc sed est vel est vestibulum vestibulum ac nec tortor. Nam dictum in nisi et dignissim. Cras at purus hendrerit, dapibus neque faucibus, suscipit risus. Nunc lacus quam, efficitur nec sollicitudin vitae, aliquet consequat sapien. '),
(8, '2016-12-05 14:36:39', 'JP', 'Donec cursus risus at erat congue, id porta ante ullamcorper. Suspendisse potenti. Nunc elementum ante in elit viverra, vel vestibulum dolor commodo.'),
(54, '2016-12-05 22:29:46', 'Dany', 'Yolo yolo trop bien trop bien'),
(55, '2016-12-05 22:30:59', 'Monddie', 'Nullam porta eros sit amet nunc euismod sollicitudin. Duis lacinia ornare accumsan. Ut eu ipsum pellentesque dui fringilla condimentum eu vel purus. In pellentesque quam faucibus imperdiet fermentum.'),
(13, '2016-12-05 21:08:11', 'Moe', 'Trop bien trop bien trop bien\r\nAGAGAGa'),
(56, '2016-12-05 22:32:36', 'Germaine', 'Duis tincidunt ligula non lectus laoreet, sed vulputate libero ullamcorper. Nunc sed est vel est vestibulum vestibulum ac nec tortor. Nam dictum in nisi et dignissim. Cras at purus hendrerit, dapibus neque faucibus, suscipit risus. Nunc lacus quam, effici'),
(57, '2016-12-09 13:41:51', 'Bigoudaine', 'Trop bi1 lolololololol');

-- --------------------------------------------------------

--
-- Structure de la table `logs`
--

CREATE TABLE IF NOT EXISTS `logs` (
`id` int(10) unsigned NOT NULL,
  `user` int(10) unsigned NOT NULL,
  `date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ip` varchar(100) NOT NULL DEFAULT '',
  `action` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB AUTO_INCREMENT=379 DEFAULT CHARSET=utf8;

--
-- Contenu de la table `logs`
--

INSERT INTO `logs` (`id`, `user`, `date`, `ip`, `action`) VALUES
(1, 1, '2017-05-09 08:12:28', '192.168.10.54', 'Authentification'),
(4, 1, '2017-05-09 08:17:55', '192.168.10.254', 'mod sections La section "Les Plantations" est bien en bdd, elle porte l''id : 7'),
(6, 1, '2017-05-09 08:19:49', '192.168.10.254', 'mod sections La section "Clôture et Portail" est bien en bdd, elle porte l''id : 15'),
(7, 1, '2017-05-09 09:23:59', '192.168.10.254', 'Authentification'),
(8, 1, '2017-05-09 09:25:48', '192.168.10.254', 'mod users: Le compte a bien été mis à jour.'),
(9, 1, '2017-05-09 09:26:03', '192.168.10.254', 'mod users: Le compte a bien été mis à jour.'),
(10, 1, '2017-05-09 09:28:28', '192.168.10.254', 'mod users: Le compte 4 a bien été mis à jour.'),
(11, 1, '2017-05-09 09:29:01', '192.168.10.254', 'del users: L''utilisateur &laquo;qq &raquo a correctement été supprimée ( id: 13)'),
(12, 1, '2017-05-09 09:29:37', '192.168.10.254', 'del users: L''utilisateur &laquo;sssss &raquo a correctement été supprimée ( id: 8)'),
(13, 1, '2017-05-09 09:29:40', '192.168.10.254', 'del users: L''utilisateur &laquo;jjjj &raquo a correctement été supprimée ( id: 7)'),
(14, 1, '2017-05-09 09:29:43', '192.168.10.254', 'del users: L''utilisateur &laquo;ddd_mod &raquo a correctement été supprimée ( id: 6)'),
(15, 1, '2017-05-09 09:30:01', '192.168.10.254', 'add users: Le compte "aaa" a bien été créé, il porte l''id : 20'),
(18, 21, '2017-05-09 09:53:34', '192.168.10.254', 'Authentification'),
(19, 1, '2017-05-09 09:56:39', '192.168.10.254', 'Authentification'),
(20, 1, '2017-05-09 10:11:40', '192.168.10.254', 'add configs: L''option test a bien été créée, elle porte l''id : 23'),
(21, 1, '2017-05-09 10:14:21', '192.168.10.254', 'mod configs: L''option test a bien été créée, elle porte l''id : 23'),
(22, 1, '2017-05-09 10:19:44', '192.168.10.254', 'mod users: Le compte 2 a bien été mis à jour.'),
(23, 1, '2017-05-09 10:23:25', '192.168.10.254', 'logout'),
(24, 2, '2017-05-09 10:23:43', '192.168.10.254', 'Authentification'),
(25, 2, '2017-05-09 10:23:55', '192.168.10.254', 'logout'),
(26, 2, '2017-05-09 10:24:02', '192.168.10.254', 'Authentification'),
(27, 2, '2017-05-09 11:17:17', '192.168.10.254', 'Authentification'),
(28, 2, '2017-05-09 11:31:56', '192.168.10.254', 'add tarifs: '),
(29, 2, '2017-05-09 11:33:52', '192.168.10.254', 'add tarifs: '),
(30, 2, '2017-05-09 11:35:07', '192.168.10.254', 'add tarifs: L''option  a bien été créée, elle porte l''id : 13'),
(31, 2, '2017-05-09 11:37:03', '192.168.10.254', 'add tarifs: Le tarif trytry a bien été créée, il porte l''id : 14'),
(32, 2, '2017-05-09 12:51:34', '192.168.10.254', 'addtype tarifs: '),
(33, 2, '2017-05-09 12:54:57', '192.168.10.254', 'addtype tarifs: Le groupe de tarifs test a bien été créée, il porte l''id : 2'),
(34, 2, '2017-05-09 12:55:16', '192.168.10.254', 'deltype tarifs: Le groupe de tarifs &laquo;test &raquo a correctement été supprimée ( id: 2)'),
(35, 2, '2017-05-09 12:57:44', '192.168.10.254', 'addtype tarifs: Le groupe de tarifs test a bien été créée, il porte l''id : 3'),
(36, 2, '2017-05-09 12:59:11', '192.168.10.254', 'mod tarifs: Le tarif trytry a bien été créée, il porte l''id : 14'),
(37, 2, '2017-05-09 13:25:41', '192.168.10.254', 'logout'),
(38, 1, '2017-05-09 13:25:56', '192.168.10.254', 'Authentification'),
(39, 1, '2017-05-09 13:26:27', '192.168.10.254', 'mod users: Le compte 20 a bien été mis à jour.'),
(40, 1, '2017-05-09 13:27:14', '192.168.10.254', 'logout'),
(41, 1, '2017-05-09 13:27:22', '192.168.10.254', 'Authentification'),
(42, 1, '2017-05-09 13:27:46', '192.168.10.254', 'add users: Le compte "moe" a bien été créé, il porte l''id : 22'),
(43, 1, '2017-05-09 13:30:49', '192.168.10.254', 'del users: '),
(44, 1, '2017-05-09 13:30:57', '192.168.10.254', 'del users: '),
(45, 1, '2017-05-09 13:32:03', '192.168.10.254', 'del users: '),
(46, 1, '2017-05-09 13:34:22', '192.168.10.254', 'del users: '),
(47, 1, '2017-05-09 13:35:30', '192.168.10.254', 'del users: '),
(48, 22, '2017-05-09 13:55:19', '90.48.227.28', 'Authentification'),
(49, 1, '2017-05-09 14:00:19', '192.168.10.254', 'modtype tarifs: Le groupe de tarifs tests a bien été créée, il porte l''id : 3'),
(50, 1, '2017-05-09 15:22:25', '192.168.10.254', 'add configs: L''option couleur_text a bien été créée, elle porte l''id : 24'),
(51, 1, '2017-05-09 15:33:44', '192.168.10.254', 'mod configs: L''option couleur_text a bien été créée, elle porte l''id : 24'),
(52, 22, '2017-05-09 15:34:46', '90.48.227.28', 'Authentification'),
(53, 22, '2017-05-09 15:37:46', '90.48.227.28', 'mod configs: L''option couleur_text a bien été créée, elle porte l''id : 24'),
(54, 1, '2017-05-09 15:45:42', '192.168.10.254', 'mod configs: L''option color a bien été créée, elle porte l''id : 24'),
(55, 1, '2017-05-09 15:46:15', '192.168.10.254', 'add configs: L''option background-color a bien été créée, elle porte l''id : 25'),
(56, 22, '2017-05-09 15:48:58', '90.48.227.28', 'mod configs: L''option background-color a bien été créée, elle porte l''id : 25'),
(57, 1, '2017-05-09 16:05:09', '192.168.10.254', 'mod configs: L''option background-color a bien été créée, elle porte l''id : 25'),
(58, 1, '2017-05-09 16:05:23', '192.168.10.254', 'mod configs: L''option color a bien été créée, elle porte l''id : 24'),
(59, 1, '2017-05-09 17:49:00', '192.168.10.254', 'Authentification'),
(60, 1, '2017-05-09 18:56:53', '192.168.10.254', 'del configs: L''option &laquo;nombre_news_index &raquo a correctement été supprimée ( id: 10)'),
(61, 1, '2017-05-09 20:04:15', '192.168.10.254', 'Authentification'),
(62, 1, '2017-05-09 20:05:58', '192.168.10.254', 'mod configs: L''option slogan a bien été créée, elle porte l''id : 2'),
(63, 1, '2017-05-09 20:13:12', '192.168.10.254', 'mod configs: L''option adresse a bien été créée, elle porte l''id : 3'),
(64, 1, '2017-05-09 20:13:48', '192.168.10.254', 'mod configs: L''option slogan a bien été créée, elle porte l''id : 2'),
(65, 1, '2017-05-09 20:14:05', '192.168.10.254', 'mod configs: L''option cp a bien été créée, elle porte l''id : 4'),
(66, 1, '2017-05-09 20:14:26', '192.168.10.254', 'mod configs: L''option ville a bien été créée, elle porte l''id : 5'),
(67, 1, '2017-05-09 20:14:33', '192.168.10.254', 'mod configs: L''option cp a bien été créée, elle porte l''id : 4'),
(68, 1, '2017-05-09 20:14:51', '192.168.10.254', 'mod configs: L''option tel a bien été créée, elle porte l''id : 6'),
(69, 1, '2017-05-09 20:15:04', '192.168.10.254', 'mod configs: L''option mail a bien été créée, elle porte l''id : 7'),
(70, 1, '2017-05-09 20:15:22', '192.168.10.254', 'mod configs: L''option txt_inter1 a bien été créée, elle porte l''id : 18'),
(71, 1, '2017-05-09 20:15:31', '192.168.10.254', 'mod configs: L''option txt_inter2 a bien été créée, elle porte l''id : 19'),
(72, 1, '2017-05-09 20:15:49', '192.168.10.254', 'logout'),
(73, 2, '2017-05-09 20:16:06', '192.168.10.254', 'Authentification'),
(74, 2, '2017-05-09 20:17:48', '192.168.10.254', 'mod configs: L''option slogan a bien été créée, elle porte l''id : 2'),
(75, 2, '2017-05-09 20:21:19', '192.168.10.254', 'add sections: '),
(76, 2, '2017-05-09 20:21:28', '192.168.10.254', 'add sections: La section "test2" est bien en bdd, elle porte l''id : 19'),
(77, 2, '2017-05-09 20:30:28', '192.168.10.254', 'logout'),
(78, 1, '2017-05-09 20:30:36', '192.168.10.254', 'Authentification'),
(79, 1, '2017-05-09 21:47:14', '192.168.10.254', 'Authentification'),
(80, 1, '2017-05-09 21:51:09', '192.168.10.254', 'del sections: La section &laquo;test2 &raquo a correctement été supprimée ( id: 19)'),
(81, 1, '2017-05-09 22:19:27', '192.168.10.54', 'Authentification'),
(82, 1, '2017-05-09 22:33:42', '192.168.10.254', 'mod configs: L''option news_par_page a bien été créée, elle porte l''id : 11'),
(83, 1, '2017-05-09 22:48:38', '192.168.10.254', 'mod configs: L''option news_par_page a bien été créée, elle porte l''id : 11'),
(84, 1, '2017-05-09 22:50:24', '192.168.10.254', 'mod configs: L''option news_par_page a bien été créée, elle porte l''id : 11'),
(85, 1, '2017-05-10 12:34:01', '192.168.10.254', 'Authentification'),
(86, 1, '2017-05-10 12:36:36', '192.168.10.254', 'mod configs: L''option news_par_page a bien été créée, elle porte l''id : 11'),
(87, 1, '2017-05-10 12:45:02', '192.168.10.254', 'del configs: L''option &laquo;test &raquo a correctement été supprimée ( id: 23)'),
(88, 1, '2017-05-10 13:40:17', '192.168.10.254', 'list news: '),
(89, 1, '2017-05-10 13:40:22', '192.168.10.254', 'list news: '),
(90, 1, '2017-05-10 13:40:26', '192.168.10.254', 'list news: '),
(91, 1, '2017-05-10 13:40:29', '192.168.10.254', 'list news: '),
(92, 1, '2017-05-10 13:40:42', '192.168.10.254', 'list news: '),
(93, 1, '2017-05-10 14:14:37', '192.168.10.254', 'del news: L''article &laquo;Exemple de news 49 &raquo a correctement été supprimé ( id: 49)'),
(94, 1, '2017-05-10 14:36:55', '192.168.10.254', 'mod news: '),
(95, 1, '2017-05-10 14:42:28', '192.168.10.254', 'mod news: '),
(96, 1, '2017-05-10 14:42:51', '192.168.10.254', 'mod news: '),
(97, 1, '2017-05-10 14:43:23', '192.168.10.254', 'mod news: '),
(98, 1, '2017-05-10 14:45:33', '192.168.10.254', 'mod news: L''article "" est bien en bdd, il porte l''id : 82'),
(99, 1, '2017-05-10 14:47:11', '192.168.10.254', 'list news: '),
(100, 1, '2017-05-10 14:49:45', '192.168.10.254', 'list news: '),
(101, 1, '2017-05-10 14:52:05', '192.168.10.254', 'add news: L''article "Merci la tempête (bis)" est bien en bdd, il porte l''id : 83'),
(102, 1, '2017-05-10 14:52:40', '192.168.10.254', 'list news: '),
(103, 1, '2017-05-10 14:53:54', '192.168.10.254', 'add news: L''article "tout casser!" est bien en bdd, il porte l''id : 84'),
(104, 1, '2017-05-10 14:55:49', '192.168.10.254', 'mod news: L''article "tout casser!" est bien en bdd, il porte l''id : 84'),
(105, 1, '2017-05-10 14:56:09', '192.168.10.254', 'mod news: L''article "tout casser!" est bien en bdd, il porte l''id : 84'),
(106, 1, '2017-05-10 16:10:40', '192.168.10.254', 'Authentification'),
(107, 1, '2017-05-10 16:13:20', '192.168.10.254', 'mod tarifs: Le tarif trytry a bien été créée, il porte l''id : 14'),
(108, 1, '2017-05-10 16:18:09', '192.168.10.254', 'logout'),
(109, 2, '2017-05-10 16:18:16', '192.168.10.254', 'Authentification'),
(110, 2, '2017-05-10 16:19:58', '192.168.10.254', 'del users: L''utilisateur &laquo;tests &raquo a correctement été supprimée ( id: 5)'),
(111, 1, '2017-05-10 16:22:05', '192.168.10.254', 'Authentification'),
(112, 1, '2017-05-10 16:22:20', '192.168.10.254', 'mod configs: L''option slogan a bien été créée, elle porte l''id : 2'),
(113, 2, '2017-05-10 16:23:58', '192.168.10.254', 'mod users: Le compte 21 a bien été mis à jour.'),
(114, 2, '2017-05-10 16:24:08', '192.168.10.254', 'logout'),
(115, 21, '2017-05-10 16:24:12', '192.168.10.254', 'Authentification'),
(116, 1, '2017-05-10 16:25:01', '192.168.10.254', 'list news: '),
(117, 1, '2017-05-10 16:25:11', '192.168.10.254', 'del news: L''article &laquo;Exemple de news 50 &raquo a correctement été supprimé ( id: 50)'),
(118, 21, '2017-05-10 18:31:04', '192.168.10.254', 'Authentification'),
(119, 21, '2017-05-10 19:35:27', '192.168.10.254', 'logout'),
(120, 1, '2017-05-10 20:13:55', '192.168.10.254', 'Authentification'),
(121, 1, '2017-05-10 20:14:20', '192.168.10.254', 'mod sections: La section "Blog" est bien en bdd, elle porte l''id : 5'),
(122, 1, '2017-05-10 20:15:01', '192.168.10.254', 'logout'),
(123, 2, '2017-05-10 20:15:08', '192.168.10.254', 'Authentification'),
(124, 2, '2017-05-10 21:26:13', '192.168.10.254', 'logout'),
(125, 1, '2017-05-10 21:26:24', '192.168.10.254', 'Authentification'),
(126, 1, '2017-05-11 07:27:59', '192.168.10.254', 'Authentification'),
(127, 1, '2017-05-11 08:02:16', '192.168.10.254', 'add sections: '),
(128, 1, '2017-05-11 08:04:39', '192.168.10.254', 'add sections: La section "Livre d''Or" est bien en bdd, elle porte l''id : 20'),
(129, 1, '2017-05-11 08:46:26', '192.168.10.254', 'add sections: '),
(130, 1, '2017-05-11 08:46:30', '192.168.10.254', 'add sections: La section "testddd" est bien en bdd, elle porte l''id : 21'),
(131, 1, '2017-05-11 08:46:36', '192.168.10.254', 'del sections: La section &laquo;ts &raquo a correctement été supprimée ( id: 21)'),
(132, 1, '2017-05-11 10:00:17', '192.168.10.254', 'mod sections: La section "Livre d''Or" est bien en bdd, elle porte l''id : 20'),
(133, 1, '2017-05-11 11:10:39', '192.168.10.254', 'del livreor: Le message &laquo;test du livre d''or &raquo a correctement été supprimé ( id: 1)'),
(134, 1, '2017-05-11 12:02:57', '192.168.10.254', 'mod contacts: '),
(135, 1, '2017-05-11 12:12:04', '192.168.10.254', 'mod contacts: '),
(136, 1, '2017-05-11 12:14:26', '192.168.10.254', 'mod contacts: '),
(137, 1, '2017-05-11 12:15:34', '192.168.10.254', 'mod contacts: '),
(138, 1, '2017-05-11 12:17:35', '192.168.10.254', 'mod contacts: '),
(139, 1, '2017-05-11 12:18:41', '192.168.10.254', 'mod contacts: '),
(140, 1, '2017-05-11 12:19:02', '192.168.10.254', 'mod contacts: '),
(141, 1, '2017-05-11 12:19:09', '192.168.10.254', 'mod contacts: Le compte 1 a bien été mis à jour.'),
(142, 1, '2017-05-11 12:19:31', '192.168.10.254', 'mod contacts: Le compte 10 a bien été mis à jour.'),
(143, 1, '2017-05-11 12:19:49', '192.168.10.254', 'mod contacts: Le compte 8 a bien été mis à jour.'),
(144, 1, '2017-05-11 12:22:56', '192.168.10.254', 'mod contacts: Le contact prenom nom a bien été mis à jour.'),
(145, 1, '2017-05-11 12:23:56', '192.168.10.254', 'mod contacts: Le contact test test a bien été mis à jour.'),
(146, 1, '2017-05-11 12:24:04', '192.168.10.254', 'mod contacts: Le contact test test a bien été mis à jour.'),
(147, 1, '2017-05-11 14:09:19', '192.168.10.254', 'Authentification'),
(148, 1, '2017-05-11 14:20:30', '192.168.10.254', 'modules configs: '),
(149, 1, '2017-05-11 14:20:35', '192.168.10.254', 'modules configs: '),
(150, 1, '2017-05-11 14:22:02', '192.168.10.254', 'modules configs: '),
(151, 1, '2017-05-11 14:22:22', '192.168.10.254', 'modules configs: '),
(152, 1, '2017-05-11 14:27:04', '192.168.10.254', 'modules configs: '),
(153, 1, '2017-05-11 14:27:17', '192.168.10.254', 'modules configs: '),
(154, 1, '2017-05-11 14:42:02', '192.168.10.254', 'modules configs: '),
(155, 1, '2017-05-11 14:43:22', '192.168.10.254', 'modules configs: '),
(156, 1, '2017-05-11 14:43:57', '192.168.10.254', 'modules configs: '),
(157, 1, '2017-05-11 14:46:57', '192.168.10.254', 'modules configs: '),
(158, 1, '2017-05-11 14:52:21', '192.168.10.254', 'modules configs: '),
(159, 1, '2017-05-11 14:55:45', '192.168.10.254', 'modules configs: Mise à jour effectuée'),
(160, 1, '2017-05-11 14:55:59', '192.168.10.254', 'modules configs: Mise à jour effectuée'),
(161, 1, '2017-05-11 14:56:54', '192.168.10.254', 'modules configs: Mise à jour effectuée'),
(162, 1, '2017-05-11 14:56:59', '192.168.10.254', 'modules configs: Mise à jour effectuée'),
(163, 1, '2017-05-11 14:57:09', '192.168.10.254', 'modules configs: Mise à jour effectuée'),
(164, 1, '2017-05-11 14:58:47', '192.168.10.254', 'modules configs: Mise à jour effectuée'),
(165, 1, '2017-05-11 15:00:15', '192.168.10.254', 'modules configs: Mise à jour effectuée'),
(166, 1, '2017-05-11 15:01:36', '192.168.10.254', 'modules configs: Mise à jour effectuée'),
(167, 1, '2017-05-11 15:02:20', '192.168.10.254', 'modules configs: '),
(168, 1, '2017-05-11 15:03:04', '192.168.10.254', 'modules configs: Mise à jour effectuée'),
(169, 1, '2017-05-11 15:03:09', '192.168.10.254', 'modules configs: Mise à jour effectuée'),
(170, 1, '2017-05-11 15:03:15', '192.168.10.254', 'modules configs: Mise à jour effectuée'),
(171, 1, '2017-05-11 15:03:35', '192.168.10.254', 'modules configs: Mise à jour effectuée'),
(172, 1, '2017-05-11 15:04:06', '192.168.10.254', 'modules configs: Mise à jour effectuée'),
(173, 1, '2017-05-11 15:04:16', '192.168.10.254', 'modules configs: Mise à jour effectuée'),
(174, 1, '2017-05-11 15:06:04', '192.168.10.254', 'modules configs: Mise à jour effectuée'),
(175, 1, '2017-05-11 15:06:36', '192.168.10.254', 'modules configs: Mise à jour effectuée'),
(176, 1, '2017-05-11 15:07:26', '192.168.10.254', 'modules configs: Mise à jour effectuée'),
(177, 1, '2017-05-11 15:10:26', '192.168.10.54', 'Authentification'),
(178, 1, '2017-05-11 15:10:39', '192.168.10.54', 'logout'),
(179, 2, '2017-05-11 15:10:47', '192.168.10.54', 'Authentification'),
(180, 1, '2017-05-11 15:36:31', '192.168.10.254', 'modules configs: Mise à jour effectuée'),
(181, 1, '2017-05-11 16:13:42', '192.168.10.254', 'modules configs: Mise à jour effectuée'),
(182, 1, '2017-05-11 16:17:44', '192.168.10.254', 'modules configs: Mise à jour effectuée'),
(183, 1, '2017-05-11 16:24:45', '192.168.10.254', 'modules configs: Mise à jour effectuée'),
(184, 1, '2017-05-11 16:54:43', '192.168.10.254', 'modules configs: Mise à jour effectuée'),
(185, 2, '2017-05-11 16:56:08', '192.168.10.54', 'logout'),
(186, 21, '2017-05-11 16:56:15', '192.168.10.54', 'Authentification'),
(187, 1, '2017-05-11 16:59:27', '192.168.10.254', 'modules configs: Mise à jour effectuée'),
(188, 21, '2017-05-11 16:59:38', '192.168.10.54', 'logout'),
(189, 2, '2017-05-11 16:59:46', '192.168.10.54', 'Authentification'),
(190, 1, '2017-05-11 16:59:58', '192.168.10.254', 'modules configs: Mise à jour effectuée'),
(191, 1, '2017-05-11 17:06:02', '192.168.10.254', 'modules configs: Mise à jour effectuée'),
(192, 1, '2017-05-11 17:06:16', '192.168.10.254', 'modules configs: Mise à jour effectuée'),
(193, 1, '2017-05-11 17:09:57', '192.168.10.254', 'modules configs: Mise à jour effectuée'),
(194, 1, '2017-05-11 17:10:53', '192.168.10.254', 'modules configs: Mise à jour effectuée'),
(195, 1, '2017-05-11 17:56:15', '192.168.10.254', 'Authentification'),
(196, 1, '2017-05-11 17:56:23', '192.168.10.254', 'modules configs: Mise à jour effectuée'),
(197, 2, '2017-05-11 17:56:52', '192.168.10.54', 'Authentification'),
(198, 1, '2017-05-11 17:59:22', '192.168.10.254', 'modules configs: Mise à jour effectuée'),
(199, 1, '2017-05-11 18:01:02', '192.168.10.254', 'mod news: L''article "Allée" est bien en bdd, il porte l''id : 78'),
(200, 1, '2017-05-11 18:01:18', '192.168.10.254', 'list news: '),
(201, 1, '2017-05-12 07:41:03', '192.168.10.254', 'Authentification'),
(202, 22, '2017-05-14 12:44:35', '92.148.204.65', 'Authentification'),
(203, 22, '2017-05-14 13:21:12', '92.148.204.65', 'Authentification'),
(204, 22, '2017-05-14 13:22:59', '92.148.204.65', 'list news: '),
(205, 22, '2017-05-14 13:23:04', '92.148.204.65', 'list news: '),
(206, 22, '2017-05-14 13:23:08', '92.148.204.65', 'list news: '),
(207, 22, '2017-05-14 13:23:14', '92.148.204.65', 'list news: '),
(208, 22, '2017-05-14 13:23:18', '92.148.204.65', 'list news: '),
(209, 22, '2017-05-14 13:23:22', '92.148.204.65', 'list news: '),
(210, 22, '2017-05-14 13:24:26', '92.148.204.65', 'add news: '),
(211, 22, '2017-05-14 13:26:48', '92.148.204.65', 'add news: L''article "Mini golf" est bien en bdd, il porte l''id : 85'),
(212, 22, '2017-05-14 13:26:59', '92.148.204.65', 'list news: '),
(213, 22, '2017-05-14 13:28:38', '92.148.204.65', 'mod news: L''article "Mini golf 2" est bien en bdd, il porte l''id : 85'),
(214, 22, '2017-05-14 13:28:49', '92.148.204.65', 'list news: '),
(215, 22, '2017-05-14 13:28:55', '92.148.204.65', 'list news: '),
(216, 22, '2017-05-14 13:31:05', '92.148.204.65', 'list news: '),
(217, 22, '2017-05-14 13:31:08', '92.148.204.65', 'list news: '),
(218, 22, '2017-05-14 13:32:41', '92.148.204.65', 'mod configs: L''option color a bien été créée, elle porte l''id : 24'),
(219, 22, '2017-05-14 13:32:56', '92.148.204.65', 'mod configs: L''option background-color a bien été créée, elle porte l''id : 25'),
(220, 22, '2017-05-14 13:33:33', '92.148.204.65', 'mod configs: L''option background-color a bien été créée, elle porte l''id : 25'),
(221, 22, '2017-05-14 13:34:24', '92.148.204.65', 'mod configs: L''option color a bien été créée, elle porte l''id : 24'),
(222, 22, '2017-05-14 13:36:17', '92.148.204.65', 'mod configs: L''option separateur_menu a bien été créée, elle porte l''id : 13'),
(223, 22, '2017-05-14 13:37:02', '92.148.204.65', 'mod configs: L''option separateur_menu a bien été créée, elle porte l''id : 13'),
(224, 22, '2017-05-14 13:37:38', '92.148.204.65', 'mod configs: L''option separateur_menu a bien été créée, elle porte l''id : 13'),
(225, 22, '2017-05-14 13:38:36', '92.148.204.65', 'add sections: La section "Fleurs" est bien en bdd, elle porte l''id : 22'),
(226, 22, '2017-05-14 13:44:05', '92.148.204.65', 'mod contacts: Le contact Igor Gonzola a bien été mis à jour.'),
(227, 22, '2017-05-14 13:44:49', '92.148.204.65', 'mod contacts: Le contact Guy Tarsèche a bien été mis à jour.'),
(228, 22, '2017-05-14 13:46:12', '92.148.204.65', 'add tarifs: Le tarif Planter des navets a bien été créée, il porte l''id : 15'),
(229, 22, '2017-05-14 13:46:24', '92.148.204.65', 'mod tarifs: Le tarif Planter des navets a bien été créée, il porte l''id : 15'),
(230, 22, '2017-05-14 13:47:45', '92.148.204.65', 'mod tarifs: Le tarif Planter des navets a bien été créée, il porte l''id : 15'),
(231, 22, '2017-05-14 13:48:00', '92.148.204.65', 'addtype tarifs: Le groupe de tarifs Jardin a bien été créée, il porte l''id : 4'),
(232, 22, '2017-05-14 13:48:10', '92.148.204.65', 'mod tarifs: Le tarif Planter des navets a bien été créée, il porte l''id : 15'),
(233, 22, '2017-05-14 13:48:42', '92.148.204.65', 'mod tarifs: Le tarif Planter des navets a bien été créée, il porte l''id : 15'),
(234, 22, '2017-05-14 13:56:03', '92.148.204.65', 'add users: Le compte "nadine" a bien été créé, il porte l''id : 23'),
(235, 22, '2017-05-14 13:57:08', '92.148.204.65', 'logout'),
(236, 23, '2017-05-14 13:57:20', '92.148.204.65', 'Authentification'),
(237, 23, '2017-05-14 14:00:32', '92.148.204.65', 'add news: '),
(238, 23, '2017-05-14 14:00:47', '92.148.204.65', 'add news: L''article "Ohoho le ciel" est bien en bdd, il porte l''id : 86'),
(239, 23, '2017-05-14 14:01:09', '92.148.204.65', 'mod news: L''article "Ohoho le ciel" est bien en bdd, il porte l''id : 86'),
(240, 23, '2017-05-14 14:01:54', '92.148.204.65', 'mod news: L''article "Ohoho le ciel" est bien en bdd, il porte l''id : 86'),
(241, 23, '2017-05-14 14:02:52', '92.148.204.65', 'add news: L''article "test image" est bien en bdd, il porte l''id : 87'),
(242, 23, '2017-05-14 14:03:41', '92.148.204.65', 'del news: L''article &laquo;test image &raquo a correctement été supprimé ( id: 87)'),
(243, 23, '2017-05-14 14:03:50', '92.148.204.65', 'list news: '),
(244, 23, '2017-05-14 14:04:15', '92.148.204.65', 'logout'),
(245, 22, '2017-05-14 14:04:19', '92.148.204.65', 'Authentification'),
(246, 22, '2017-05-14 14:06:45', '92.148.204.65', 'mod users: Le compte 23 a bien été mis à jour.'),
(247, 22, '2017-05-14 14:07:09', '92.148.204.65', 'logout'),
(248, 23, '2017-05-14 14:07:26', '92.148.204.65', 'Authentification'),
(249, 23, '2017-05-14 14:07:35', '92.148.204.65', 'logout'),
(250, 2, '2017-05-14 14:07:48', '92.148.204.65', 'Authentification'),
(251, 2, '2017-05-14 14:08:02', '92.148.204.65', 'logout'),
(252, 22, '2017-05-14 14:08:12', '92.148.204.65', 'Authentification'),
(253, 22, '2017-05-14 14:10:20', '92.148.204.65', 'logout'),
(254, 2, '2017-05-14 14:10:35', '92.148.204.65', 'Authentification'),
(255, 2, '2017-05-14 14:20:14', '92.148.204.65', 'logout'),
(256, 22, '2017-05-14 14:20:21', '92.148.204.65', 'Authentification'),
(257, 1, '2017-05-15 07:35:02', '192.168.10.254', 'Authentification'),
(258, 1, '2017-05-15 12:27:44', '192.168.10.254', 'Authentification'),
(259, 1, '2017-05-15 12:31:05', '192.168.10.254', 'mod configs: L''option news_par_page a bien été créée, elle porte l''id : 11'),
(260, 22, '2017-05-15 12:31:06', '92.148.204.65', 'Authentification'),
(261, 1, '2017-05-15 12:32:23', '192.168.10.254', 'mod news: L''article "tout casser!" est bien en bdd, il porte l''id : 84'),
(262, 1, '2017-05-15 12:35:56', '192.168.10.254', 'logout'),
(263, 2, '2017-05-15 12:36:11', '192.168.10.254', 'Authentification'),
(264, 22, '2017-05-15 12:36:23', '92.148.204.65', 'logout'),
(265, 22, '2017-05-15 12:37:35', '92.148.204.65', 'Authentification'),
(266, 22, '2017-05-15 12:37:55', '92.148.204.65', 'list news: '),
(267, 2, '2017-05-15 12:38:09', '192.168.10.254', 'logout'),
(268, 1, '2017-05-15 12:38:25', '192.168.10.254', 'Authentification'),
(269, 22, '2017-05-15 12:43:23', '92.148.204.65', 'mod sections: La section "Fleurs" est bien en bdd, elle porte l''id : 22'),
(270, 22, '2017-05-15 12:49:52', '92.148.204.65', 'modules configs: Mise à jour effectuée'),
(271, 22, '2017-05-15 12:50:18', '92.148.204.65', 'modules configs: Mise à jour effectuée'),
(272, 22, '2017-05-15 12:50:46', '92.148.204.65', 'logout'),
(273, 22, '2017-05-15 12:50:56', '92.148.204.65', 'Authentification'),
(274, 2, '2017-05-15 12:51:20', '92.148.204.65', 'Authentification'),
(275, 22, '2017-05-15 12:52:03', '92.148.204.65', 'modules configs: Mise à jour effectuée'),
(276, 22, '2017-05-15 12:52:28', '92.148.204.65', 'modules configs: Mise à jour effectuée'),
(277, 22, '2017-05-15 12:52:50', '92.148.204.65', 'modules configs: Mise à jour effectuée'),
(278, 22, '2017-05-15 12:54:55', '92.148.204.65', 'modules configs: Mise à jour effectuée'),
(279, 22, '2017-05-15 12:57:04', '92.148.204.65', 'modules configs: Mise à jour effectuée'),
(280, 22, '2017-05-15 12:58:11', '92.148.204.65', 'modules configs: Mise à jour effectuée'),
(281, 1, '2017-05-15 13:14:21', '192.168.10.254', 'mod news: L''article "tout casser!" est bien en bdd, il porte l''id : 84'),
(282, 1, '2017-05-17 09:32:12', '192.168.10.254', 'Authentification'),
(283, 1, '2017-05-17 12:33:22', '192.168.10.254', 'Authentification'),
(284, 1, '2017-05-17 12:34:28', '192.168.10.254', 'mod news: L''article "Allée" est bien en bdd, il porte l''id : 78'),
(285, 1, '2017-05-17 12:35:10', '192.168.10.254', 'list news: '),
(286, 1, '2017-05-17 12:35:20', '192.168.10.254', 'list news: '),
(287, 1, '2017-05-17 12:46:56', '192.168.10.254', 'list news: '),
(288, 1, '2017-05-17 12:51:56', '192.168.10.254', 'list news: '),
(289, 1, '2017-05-17 12:52:47', '192.168.10.254', 'mod configs: L''option news_par_page a bien été créée, elle porte l''id : 11'),
(290, 1, '2017-05-17 12:52:50', '192.168.10.254', 'list news: '),
(291, 1, '2017-05-18 09:40:18', '192.168.10.254', 'Authentification'),
(292, 1, '2017-05-18 09:41:01', '192.168.10.254', 'mod news: L''article "Allée" est bien en bdd, il porte l''id : 78'),
(293, 1, '2017-05-18 09:41:09', '192.168.10.254', 'list news: '),
(294, 1, '2017-05-18 09:41:22', '192.168.10.254', 'mod configs: L''option news_par_page a bien été créée, elle porte l''id : 11'),
(295, 1, '2017-05-18 09:41:59', '192.168.10.254', 'mod news: L''article "Merci la tempête (bis)" est bien en bdd, il porte l''id : 83'),
(296, 1, '2017-05-18 09:42:17', '192.168.10.254', 'mod news: L''article "Merci la tempête :(" est bien en bdd, il porte l''id : 68'),
(297, 1, '2017-05-18 09:42:35', '192.168.10.254', 'list news: '),
(298, 1, '2017-05-18 09:43:31', '192.168.10.254', 'mod news: L''article "Ginkgo biloba à l''école" est bien en bdd, il porte l''id : 82'),
(299, 1, '2017-05-18 09:43:53', '192.168.10.254', 'mod news: L''article "Intallation de jardinière de toît" est bien en bdd, il porte l''id : 81'),
(300, 1, '2017-05-18 09:43:58', '192.168.10.254', 'mod news: L''article "test contrib" est bien en bdd, il porte l''id : 80'),
(301, 1, '2017-05-18 09:44:56', '192.168.10.254', 'mod news: L''article "Réparation de serre" est bien en bdd, il porte l''id : 79'),
(302, 1, '2017-05-18 09:45:25', '192.168.10.254', 'list news: '),
(303, 1, '2017-05-18 09:47:50', '192.168.10.254', 'mod news: L''article "pillage des noisetiers" est bien en bdd, il porte l''id : 69'),
(304, 1, '2017-05-18 09:48:06', '192.168.10.254', 'mod news: L''article "test contrib" est bien en bdd, il porte l''id : 80'),
(305, 1, '2017-05-18 09:48:25', '192.168.10.254', 'mod news: L''article "plantage de capucines,  soucis et bourrache" est bien en bdd, il porte l''id : 70'),
(306, 1, '2017-05-18 09:49:02', '192.168.10.254', 'mod news: L''article "tableau végétal" est bien en bdd, il porte l''id : 71'),
(307, 1, '2017-05-18 09:49:24', '192.168.10.254', 'mod news: L''article "Sucrine du berry" est bien en bdd, il porte l''id : 72'),
(308, 1, '2017-05-18 09:49:41', '192.168.10.254', 'mod news: L''article "Pour canards" est bien en bdd, il porte l''id : 73'),
(309, 1, '2017-05-18 09:49:41', '192.168.10.254', 'mod news: L''article "Pavot" est bien en bdd, il porte l''id : 74'),
(310, 1, '2017-05-18 09:50:01', '192.168.10.254', 'mod news: L''article "Pavot" est bien en bdd, il porte l''id : 74'),
(311, 1, '2017-05-18 09:50:16', '192.168.10.254', 'mod news: L''article "Puzzle" est bien en bdd, il porte l''id : 75'),
(312, 1, '2017-05-18 09:50:38', '192.168.10.254', 'mod news: L''article "Essai de puzzle" est bien en bdd, il porte l''id : 76'),
(313, 1, '2017-05-18 09:51:13', '192.168.10.254', 'mod news: L''article "oh la belle terrasse !" est bien en bdd, il porte l''id : 77'),
(314, 1, '2017-05-18 09:51:26', '192.168.10.254', 'list news: '),
(315, 1, '2017-05-18 11:36:45', '192.168.10.254', 'Authentification'),
(316, 1, '2017-05-18 12:09:33', '192.168.10.254', 'list news: '),
(317, 1, '2017-05-18 12:09:42', '192.168.10.254', 'mod news: '),
(318, 1, '2017-05-18 12:10:19', '192.168.10.254', 'mod news: '),
(319, 1, '2017-05-18 12:10:53', '192.168.10.254', 'mod news: '),
(320, 1, '2017-05-18 12:13:41', '192.168.10.254', 'mod news: '),
(321, 1, '2017-05-18 12:14:40', '192.168.10.254', 'mod sections: La section "Les Pergolas" est bien en bdd, elle porte l''id : 9'),
(322, 1, '2017-05-18 12:16:21', '192.168.10.254', 'mod news: L''article "tout casser!" est bien en bdd, il porte l''id : 84'),
(323, 1, '2017-05-18 12:17:22', '192.168.10.254', 'add news: '),
(324, 1, '2017-05-18 12:17:40', '192.168.10.254', 'add news: L''article "test autre" est bien en bdd, il porte l''id : 88'),
(325, 1, '2017-05-18 12:17:54', '192.168.10.254', 'mod news: L''article "test autre" est bien en bdd, il porte l''id : 88'),
(326, 1, '2017-05-18 12:29:03', '192.168.10.254', 'mod news: L''article "test autre" est bien en bdd, il porte l''id : 88'),
(327, 1, '2017-05-18 12:29:20', '192.168.10.254', 'del news: L''article &laquo;test autre &raquo a correctement été supprimé ( id: 88)'),
(328, 1, '2017-05-18 12:29:43', '192.168.10.254', 'mod news: L''article "tout casser!" est bien en bdd, il porte l''id : 84'),
(329, 1, '2017-05-18 12:41:14', '192.168.10.254', 'list news: '),
(330, 1, '2017-05-18 12:54:24', '192.168.10.254', 'add configs: L''option couleur_lien a bien été créée, elle porte l''id : 26'),
(331, 1, '2017-05-18 12:54:58', '192.168.10.254', 'add configs: L''option couleur_lien_actif a bien été créée, elle porte l''id : 27'),
(332, 1, '2017-05-18 12:59:49', '192.168.10.254', 'mod configs: L''option couleur_lien a bien été créée, elle porte l''id : 26'),
(333, 1, '2017-05-18 13:00:16', '192.168.10.254', 'mod configs: L''option couleur_lien a bien été créée, elle porte l''id : 26'),
(334, 1, '2017-05-18 13:01:36', '192.168.10.254', 'mod configs: L''option couleur_lien a bien été créée, elle porte l''id : 26'),
(335, 1, '2017-05-18 13:20:37', '192.168.10.254', 'modules configs: Mise à jour effectuée'),
(336, 1, '2017-05-18 13:24:07', '192.168.10.254', 'modules configs: Mise à jour effectuée : tarifs, livreor, contacts'),
(337, 1, '2017-05-18 13:24:34', '192.168.10.254', 'modules configs: Mise à jour effectuée : tarifs, livreor'),
(338, 1, '2017-05-18 14:54:33', '192.168.10.254', 'Authentification'),
(339, 1, '2017-05-18 15:23:52', '192.168.10.254', 'add tarifs: '),
(340, 1, '2017-05-18 15:23:57', '192.168.10.254', 'add tarifs: Le tarif wwww a bien été créée, il porte l''id : 16'),
(341, 1, '2017-05-18 15:24:20', '192.168.10.254', 'mod tarifs: Le tarif wwww a bien été créée, il porte l''id : 16'),
(342, 1, '2017-05-18 15:30:30', '192.168.10.254', 'mod tarifs: Le tarif wwww a bien été créée, il porte l''id : 16'),
(343, 1, '2017-05-18 15:30:57', '192.168.10.254', 'mod tarifs: Le tarif wwww a bien été créée, il porte l''id : 16'),
(344, 1, '2017-05-18 15:33:57', '192.168.10.254', 'mod tarifs: Le tarif arroser les canards a bien été créée, il porte l''id : 16'),
(345, 1, '2017-05-18 15:48:54', '192.168.10.254', 'add configs: L''option titre_home a bien été créée, elle porte l''id : 28'),
(346, 1, '2017-05-18 16:02:27', '192.168.10.254', 'mod configs: L''option color a bien été créée, elle porte l''id : 24'),
(347, 1, '2017-05-18 16:07:38', '192.168.10.254', 'mod configs: L''option titre_home a bien été créée, elle porte l''id : 3'),
(348, 1, '2017-05-18 16:42:04', '192.168.10.254', 'add configs: '),
(349, 1, '2017-05-18 16:46:58', '192.168.10.254', 'mod configs: L''option slogan a bien été créée, elle porte l''id : 2'),
(350, 1, '2017-05-18 16:47:11', '192.168.10.254', 'mod configs: L''option titre_home a bien été créée, elle porte l''id : 3'),
(351, 1, '2017-05-18 16:47:22', '192.168.10.254', 'mod configs: L''option cp a bien été créée, elle porte l''id : 4'),
(352, 1, '2017-05-18 16:47:34', '192.168.10.254', 'mod configs: L''option ville a bien été créée, elle porte l''id : 5'),
(353, 1, '2017-05-18 16:47:47', '192.168.10.254', 'mod configs: L''option tel a bien été créée, elle porte l''id : 6'),
(354, 1, '2017-05-18 16:48:52', '192.168.10.254', 'mod configs: L''option mail a bien été créée, elle porte l''id : 7'),
(355, 1, '2017-05-18 16:49:04', '192.168.10.254', 'mod configs: L''option adresse a bien été créée, elle porte l''id : 8'),
(356, 1, '2017-05-18 16:49:14', '192.168.10.254', 'mod configs: '),
(357, 1, '2017-05-18 16:49:24', '192.168.10.254', 'mod configs: L''option open_hours a bien été créée, elle porte l''id : 9'),
(358, 1, '2017-05-18 16:49:35', '192.168.10.254', 'mod configs: L''option separateur_menu a bien été créée, elle porte l''id : 13'),
(359, 1, '2017-05-18 16:52:46', '192.168.10.254', 'mod configs: L''option txt_inter1 a bien été enregistrée, valeur : Aménagez votre jardin ...'),
(360, 1, '2017-05-18 16:53:05', '192.168.10.254', 'mod configs: L''option txt_inter2 a bien été enregistrée, valeur : Et bien plus...'),
(361, 1, '2017-05-18 16:53:10', '192.168.10.254', 'mod configs: L''option txt_screen2 a bien été enregistrée, valeur : Terrasses, Pergolas, Treillages…'),
(362, 1, '2017-05-18 16:53:17', '192.168.10.254', 'mod configs: L''option txt_screen1 a bien été enregistrée, valeur : L''Art de la Nature.'),
(363, 1, '2017-05-18 16:53:27', '192.168.10.254', 'mod configs: L''option color a bien été enregistrée, valeur : 0c3d01'),
(364, 1, '2017-05-18 16:53:31', '192.168.10.254', 'mod configs: L''option background-color a bien été enregistrée, valeur : DCEED8'),
(365, 1, '2017-05-18 16:53:39', '192.168.10.254', 'mod configs: L''option couleur_lien a bien été enregistrée, valeur : 262125'),
(366, 1, '2017-05-18 16:53:45', '192.168.10.254', 'mod configs: L''option couleur_lien_actif a bien été enregistrée, valeur : e31051'),
(367, 1, '2017-05-18 16:53:56', '192.168.10.254', 'mod configs: L''option url_google_map a bien été enregistrée, valeur : https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d2612.954028693254!2d0.7825544156824915!3d49.08751387931062!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x47e10c79b143362d%3A0'),
(368, 1, '2017-05-18 17:14:10', '192.168.10.254', 'mod configs: L''option news_par_page a bien été enregistrée, valeur : 6'),
(369, 2, '2017-05-18 17:15:10', '192.168.10.254', 'Authentification'),
(370, 1, '2017-05-18 17:15:21', '192.168.10.254', 'modules configs: Mise à jour effectuée : tarifs, livreor, configs'),
(371, 2, '2017-05-18 17:15:50', '192.168.10.254', 'mod configs: L''option slogan a bien été enregistrée, valeur : 27 années au service de vos jardins!!'),
(372, 1, '2017-05-18 17:25:23', '192.168.10.254', 'mod configs: L''option txt_inter2 a bien été enregistrée, valeur : Et bien plus...'),
(373, 1, '2017-05-18 17:29:23', '192.168.10.254', 'modules configs: Mise à jour effectuée : tarifs, livreor, form_contact, configs<br>Array, Mettre à jour'),
(374, 1, '2017-05-18 17:30:25', '192.168.10.254', 'modules configs: Mise à jour effectuée : tarifs, livreor, form_contact, configs'),
(375, 1, '2017-05-18 17:30:32', '192.168.10.254', 'modules configs: Mise à jour effectuée : tarifs, livreor, configs'),
(376, 1, '2017-05-18 17:30:48', '192.168.10.254', 'mod configs: L''option txt_inter2 a bien été enregistrée, valeur : Et bien plus...'),
(377, 1, '2017-05-18 17:36:22', '192.168.10.254', 'mod configs: L''option txt_inter2 a bien été enregistrée, valeur : Et bien plus...'),
(378, 1, '2017-05-18 17:37:33', '192.168.10.254', 'mod configs: L''option slogan a bien été enregistrée, valeur : 27 années au service de vos jardins!!');

-- --------------------------------------------------------

--
-- Structure de la table `messages`
--

CREATE TABLE IF NOT EXISTS `messages` (
`id` int(10) unsigned NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `text` text NOT NULL,
  `contact` int(10) unsigned NOT NULL COMMENT 'reférence à la table contacts',
  `type_message` enum('livreor','form_contact','','') NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;

--
-- Contenu de la table `messages`
--

INSERT INTO `messages` (`id`, `date`, `text`, `contact`, `type_message`) VALUES
(12, '2017-05-11 09:57:18', '\r\nLorem ipsum dolor sit amet, consectetur adipiscing elit. In interdum felis fermentum ipsum molestie sed porttitor ligula rutrum.', 8, 'livreor'),
(13, '2017-05-11 10:01:04', '\r\nLorem ipsum dolor sit amet, consectetur adipiscing elit. In interdum felis fermentum ipsum molestie sed porttitor ligula rutrum.', 9, 'livreor'),
(14, '2017-05-11 10:06:43', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. In interdum felis fermentum ipsum molestie sed porttitor ligula rutrum.', 10, 'livreor'),
(15, '2017-05-11 10:16:43', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. In interdum felis fermentum ipsum molestie sed porttitor ligula rutrum.', 11, 'livreor'),
(16, '2017-05-11 13:01:12', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. In interdum felis fermentum ipsum molestie sed porttitor ligula rutrum.', 12, 'form_contact'),
(17, '2017-05-11 13:06:55', 'Proin massa neque, sodales et urna sit amet, convallis convallis purus. Curabitur eu fringilla enim. Proin ornare efficitur tortor sed tincidunt. Mauris eleifend tincidunt leo, ac tempor velit eleifend eget. In bibendum, felis vitae condimentum ullamcorpe', 13, 'form_contact');

-- --------------------------------------------------------

--
-- Structure de la table `modules`
--

CREATE TABLE IF NOT EXISTS `modules` (
`id` int(10) unsigned NOT NULL,
  `nom` varchar(50) NOT NULL,
  `slug` varchar(50) NOT NULL,
  `actif` tinyint(1) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Contenu de la table `modules`
--

INSERT INTO `modules` (`id`, `nom`, `slug`, `actif`, `date`) VALUES
(1, 'Gestion des Utilisateurs', 'users', 0, '2017-05-18 17:30:32'),
(2, 'Gestion des Sections', 'sections', 0, '2017-05-18 17:30:32'),
(3, 'Gestion des Tarifs', 'tarifs', 1, '2017-05-18 17:30:32'),
(4, 'Gestion du Livre d''Or', 'livreor', 1, '2017-05-18 17:30:32'),
(5, 'Gestion des Contacts', 'contacts', 0, '2017-05-18 17:30:32'),
(6, 'Formulaire de contact', 'form_contact', 0, '2017-05-18 17:30:32'),
(7, 'Gestion des paramètres', 'configs', 1, '2017-05-18 17:30:32');

-- --------------------------------------------------------

--
-- Structure de la table `news`
--

CREATE TABLE IF NOT EXISTS `news` (
`id` smallint(5) unsigned NOT NULL,
  `titre` varchar(50) NOT NULL,
  `texte` text NOT NULL,
  `auteur` int(10) unsigned NOT NULL,
  `date` datetime NOT NULL,
  `image` varchar(100) NOT NULL,
  `section` smallint(5) unsigned NOT NULL,
  `visible` tinyint(1) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=89 DEFAULT CHARSET=utf8;

--
-- Contenu de la table `news`
--

INSERT INTO `news` (`id`, `titre`, `texte`, `auteur`, `date`, `image`, `section`, `visible`) VALUES
(67, 'test', 'fsddddddddddddddddddddddddddsssss', 1, '2017-05-10 00:35:16', 'allee.jpg', 11, 1),
(68, 'Merci la tempête :(', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. In interdum felis fermentum ipsum molestie sed porttitor ligula rutrum.', 1, '2017-05-18 11:42:17', 'serre.jpg', 9, 1),
(69, 'pillage des noisetiers', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. In interdum felis fermentum ipsum molestie sed porttitor ligula rutrum.', 1, '2017-05-18 11:47:49', '20170416_185127.jpg', 10, 1),
(70, 'plantage de capucines,  soucis et bourrache', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. In interdum felis fermentum ipsum molestie sed porttitor ligula rutrum.', 1, '2017-05-18 11:48:24', '20170416_185007.jpg', 7, 1),
(71, 'tableau végétal', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. In interdum felis fermentum ipsum molestie sed porttitor ligula rutrum.', 1, '2017-05-18 11:49:02', '20170416_193724.jpg', 7, 1),
(72, 'Sucrine du berry', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. In interdum felis fermentum ipsum molestie sed porttitor ligula rutrum.', 1, '2017-05-18 11:49:24', '20170416_194052.jpg', 7, 1),
(73, 'Pour canards', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. In interdum felis fermentum ipsum molestie sed porttitor ligula rutrum.', 1, '2017-05-18 11:49:41', '20170409_114957.jpg', 9, 1),
(74, 'Pavot', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. In interdum felis fermentum ipsum molestie sed porttitor ligula rutrum.', 1, '2017-05-18 11:50:01', '20170419_181043.jpg', 7, 1),
(75, 'Puzzle', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. In interdum felis fermentum ipsum molestie sed porttitor ligula rutrum.', 1, '2017-05-18 11:50:16', '20170413_181908.jpg', 6, 1),
(76, 'Essai de puzzle', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. In interdum felis fermentum ipsum molestie sed porttitor ligula rutrum.', 1, '2017-05-18 11:50:38', '20170405_155330.jpg', 6, 1),
(77, 'oh la belle terrasse !', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. In interdum felis fermentum ipsum molestie sed porttitor ligula rutrum.', 1, '2017-05-18 11:51:13', 'terrasse2.jpg', 6, 1),
(78, 'Allée', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. In interdum felis fermentum ipsum molestie sed porttitor ligula rutrum.', 2, '2017-05-18 11:41:01', 'allee.jpg', 11, 1),
(79, 'Réparation de serre', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. In interdum felis fermentum ipsum molestie sed porttitor ligula rutrum.', 1, '2017-05-18 11:44:56', 'serre2.jpg', 8, 1),
(80, 'test contrib', 'blabla bla blablablablablabla', 21, '2017-05-18 11:48:05', '20170420_185929.jpg', 5, 1),
(81, 'Intallation de jardinière de toît', 'il fallait installer et planter des jardinières bois au 3ème étage à Rouen route de Darnétal', 21, '2017-05-18 11:43:53', '20161017_114440.jpg', 7, 1),
(82, 'Ginkgo biloba à l''école', 'Chantier dans une école primaire de Vincennes qui consistait à arracher 2 souches de Platane, de replanter 2 Ginkgo biloba et de refaire un revêtement à la place du bitume de la cour abîmé lors de l''arrachage des souches.', 21, '2017-05-18 11:43:31', '20170215_153227.jpg', 7, 1),
(83, 'Merci la tempête (bis)', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed et commodo orci. Vivamus eu diam tristique, luctus diam volutpat, blandit ex. Sed in diam volutpat, faucibus ligula nec, placerat erat. Mauris a risus lacinia, elementum elit id, venenatis dolor. Vestibulum quis odio rutrum, condimentum nisl non, porta velit. Quisque lacinia commodo mollis. Quisque eu bibendum arcu, non varius nisl. Pellentesque sed massa dignissim, finibus dolor id, tincidunt diam. Nunc laoreet quam quis sapien placerat, nec pulvinar velit efficitur. Proin ac augue ante. Nunc in vestibulum urna. Pellentesque congue vestibulum lectus vel dignissim. Praesent ut facilisis nibh, vel tristique lorem. Cras in mauris nulla. Proin mattis, magna nec elementum eleifend, erat lectus pellentesque tortor, luctus posuere augue enim id massa. Suspendisse sed euismod metus, sed commodo nisl. ', 1, '2017-05-18 11:41:58', 'pergola.jpg', 9, 1),
(84, 'tout casser!', 'On a le matos pour tout péter!!!\r\n\r\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Sed et commodo orci. Vivamus eu diam tristique, luctus diam volutpat, blandit ex. Sed in diam volutpat, faucibus ligula nec, placerat erat. Mauris a risus lacinia, elementum elit id, venenatis dolor. Vestibulum quis odio rutrum, condimentum nisl non, porta velit. Quisque lacinia commodo mollis. Quisque eu bibendum arcu, non varius nisl. Pellentesque sed massa dignissim, finibus dolor id, tincidunt diam. Nunc laoreet quam quis sapien placerat, nec pulvinar velit efficitur. Proin ac augue ante. Nunc in vestibulum urna. Pellentesque congue vestibulum lectus vel dignissim. Praesent ut facilisis nibh, vel tristique lorem. Cras in mauris nulla. Proin mattis, magna nec elementum eleifend, erat lectus pellentesque tortor, luctus posuere augue enim id massa. Suspendisse sed euismod metus, sed commodo nisl. ', 23, '2017-05-18 14:29:43', '20170213_125041.jpg', 8, 0),
(85, 'Mini golf 2', 'Mise en place de la pelouse de votre mini golf privé mhé !', 22, '2017-05-14 15:28:38', '021.jpg', 12, 1),
(86, 'Ohoho le ciel', 'Bleu etc etc', 23, '2017-05-14 16:01:54', '7167759c254625a9616f9ad790e52f5b.jpg', 16, 1);

-- --------------------------------------------------------

--
-- Structure de la table `sections`
--

CREATE TABLE IF NOT EXISTS `sections` (
`id` smallint(5) unsigned NOT NULL,
  `nom` varchar(50) NOT NULL,
  `tag` varchar(50) NOT NULL,
  `meta-description` varchar(255) NOT NULL DEFAULT '',
  `meta-keywords` varchar(255) NOT NULL DEFAULT '',
  `texte` text NOT NULL,
  `auteur` int(10) unsigned NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `image` varchar(100) NOT NULL DEFAULT '',
  `menu` tinyint(1) DEFAULT '0',
  `position` tinyint(4) NOT NULL COMMENT 'position dans le menu',
  `delete` tinyint(1) NOT NULL COMMENT 'la section peut elle etre supprimée?',
  `modify` tinyint(1) NOT NULL COMMENT 'la section peut elle etre modifiée?',
  `hasItem` tinyint(1) NOT NULL COMMENT 'la section peut elle avoir des items?',
  `inScreen2` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'section présente dans le slide de la home',
  `inScreen3` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

--
-- Contenu de la table `sections`
--

INSERT INTO `sections` (`id`, `nom`, `tag`, `meta-description`, `meta-keywords`, `texte`, `auteur`, `date`, `image`, `menu`, `position`, `delete`, `modify`, `hasItem`, `inScreen2`, `inScreen3`) VALUES
(1, 'Accueil', 'home', '', '', 'accueil', 1, '2017-04-28 13:33:31', '', 1, 1, 1, 1, 1, 0, 0),
(3, 'Contact', 'contact', '', '', '', 1, '2017-04-27 12:36:07', '', 1, 10, 0, 1, 0, 0, 0),
(4, 'Tarifs', 'tarifs', '', '', 'Devis gratuit* sur simple demande  (* hors plans)', 1, '2017-04-27 12:36:07', '', 1, 9, 0, 0, 0, 0, 1),
(5, 'Blog', 'blog', '', '', '', 1, '2017-05-10 20:14:20', '', 1, 2, 1, 1, 1, 0, 0),
(6, 'Les Terrasses', 'terrasses', '', '', '', 1, '2017-05-04 15:14:59', '', 0, 4, 1, 1, 1, 0, 0),
(7, 'Les Plantations', 'plantations', '', '', 'Quelques exemples de plantations...', 1, '2017-05-09 08:17:55', '', 1, 5, 1, 1, 1, 0, 0),
(8, 'Autres Prestations', 'autre', '', '', '', 1, '2017-04-28 08:28:04', '', 1, 5, 1, 1, 1, 0, 0),
(9, 'Les Pergolas', 'pergola', '', '', 'Nos belles pergolas!!', 1, '2017-05-18 12:14:40', '', 0, 0, 1, 1, 1, 0, 0),
(10, 'Les Treillages', 'treillage', '', '', 'oh les supers treillages!!', 1, '2017-04-28 20:27:08', '', 0, 0, 1, 1, 1, 1, 0),
(11, 'les Allées', 'allee', '', '', '', 1, '2017-04-28 22:05:40', '', 0, 0, 1, 1, 1, 0, 1),
(12, 'L''Engazonnement', 'engazonnement', '', '', '', 1, '2017-04-28 22:16:57', '', 0, 0, 1, 1, 1, 0, 0),
(13, 'Boiserie d’extérieur', 'boiserie', '', '', '', 1, '2017-04-28 22:48:15', '', 0, 0, 1, 1, 1, 0, 0),
(14, 'Entretien ponctuel', 'entretien', '', '', '', 1, '2017-04-28 22:48:41', '', 0, 0, 1, 1, 1, 0, 0),
(15, 'Clôture et Portail', 'cloture_et_portail', '', '', '', 1, '2017-05-09 08:19:49', '', 0, 0, 1, 1, 1, 0, 0),
(16, 'Le Ciel', 'nuage', '', '', 'Texteee', 22, '2017-05-03 13:52:25', '', 1, 3, 1, 1, 1, 1, 0),
(20, 'Livre d''Or', 'livreor', '', '', 'Ceci n''est pas un formulaire de contact. Il s''agit d''un espace publique où chacun(e) peut donner son avis sur son expérience avec nous. ', 1, '2017-05-11 10:00:16', '', 0, 127, 1, 1, 0, 0, 0),
(22, 'Fleurs', 'fleurs', '', '', '', 22, '2017-05-15 12:43:23', '', 1, 127, 1, 1, 1, 0, 1);

-- --------------------------------------------------------

--
-- Structure de la table `tarifs`
--

CREATE TABLE IF NOT EXISTS `tarifs` (
`id` int(10) unsigned NOT NULL,
  `prestation` varchar(100) NOT NULL,
  `prix` float NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `type` int(10) unsigned NOT NULL COMMENT 'référence à type_tarifs'
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

--
-- Contenu de la table `tarifs`
--

INSERT INTO `tarifs` (`id`, `prestation`, `prix`, `date`, `type`) VALUES
(1, 'Couper la pelouse', 66, '0000-00-00 00:00:00', 1),
(2, 'Couper un arbre', 165, '0000-00-00 00:00:00', 1),
(3, 'planter du gazon', 59, '0000-00-00 00:00:00', 1),
(4, 'tailler une haie', 147.5, '0000-00-00 00:00:00', 1),
(6, 'faire une terrasse', 147.5, '0000-00-00 00:00:00', 1),
(13, 'test', 55555, '2017-05-09 11:35:07', 1),
(14, 'trytry', 333.3, '2017-05-10 16:13:20', 3),
(15, 'Planter des navets', 20000, '2017-05-14 13:48:42', 4),
(16, 'arroser les canards', 5.32, '2017-05-18 15:33:57', 4);

-- --------------------------------------------------------

--
-- Structure de la table `type_tarifs`
--

CREATE TABLE IF NOT EXISTS `type_tarifs` (
`id` int(10) unsigned NOT NULL,
  `nom` varchar(100) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Contenu de la table `type_tarifs`
--

INSERT INTO `type_tarifs` (`id`, `nom`, `date`) VALUES
(1, 'Tarifs Généraux', '0000-00-00 00:00:00'),
(3, 'tests', '2017-05-09 14:00:19'),
(4, 'Jardin', '2017-05-14 13:48:00');

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
`id` int(10) unsigned NOT NULL,
  `nom` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `droit` int(5) unsigned NOT NULL COMMENT 'référence à la table droits'
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=latin1;

--
-- Contenu de la table `users`
--

INSERT INTO `users` (`id`, `nom`, `password`, `droit`) VALUES
(1, 'rv', '$2y$10$GNWyxvmFq9kZe2Ve8f4SEe8TG.bzErom36jh/RYOBXRIi0Av3VBNS', 1),
(2, 'test0', '$2y$10$WykSA4soxnLo2.EV2g5eteh0m24pWB4qHLKbQj0uqLun2M0qylXqS', 2),
(4, 'test1', '$2y$10$LXl5qM6U./XTCulKGEhYEepvZ8TWF/ZMGZpGI4PP450aVFY8HtsLO', 3),
(21, 'contrib', '$2y$10$TytNa0gN4mgvqNc/Kj7oXOZ2090NrO5GLYxelW0GHI/5uGVfidUV6', 3),
(22, 'moe', '$2y$10$kMNeyazYhVU7u8kGwIYE5u2PEsQV6eTbP2AhTNXnJiE/QcurRdKiG', 1),
(23, 'nadine_la_secretaire', '$2y$10$o7BZ8Lp3us6wS3.KPO9s4u6WUUB/zUsP.jmu9iAie4wlkpPrHZZzG', 3);

--
-- Index pour les tables exportées
--

--
-- Index pour la table `configs`
--
ALTER TABLE `configs`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `tag` (`tag`);

--
-- Index pour la table `contacts`
--
ALTER TABLE `contacts`
 ADD PRIMARY KEY (`id`);

--
-- Index pour la table `droits`
--
ALTER TABLE `droits`
 ADD PRIMARY KEY (`id`);

--
-- Index pour la table `logs`
--
ALTER TABLE `logs`
 ADD PRIMARY KEY (`id`), ADD KEY `user` (`user`);

--
-- Index pour la table `messages`
--
ALTER TABLE `messages`
 ADD PRIMARY KEY (`id`), ADD KEY `contact` (`contact`);

--
-- Index pour la table `modules`
--
ALTER TABLE `modules`
 ADD PRIMARY KEY (`id`);

--
-- Index pour la table `news`
--
ALTER TABLE `news`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `titre` (`titre`), ADD KEY `auteur` (`auteur`), ADD KEY `section` (`section`);

--
-- Index pour la table `sections`
--
ALTER TABLE `sections`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `nom` (`nom`), ADD UNIQUE KEY `tag` (`tag`), ADD KEY `auteur` (`auteur`);

--
-- Index pour la table `tarifs`
--
ALTER TABLE `tarifs`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `id` (`id`), ADD KEY `type` (`type`);

--
-- Index pour la table `type_tarifs`
--
ALTER TABLE `type_tarifs`
 ADD PRIMARY KEY (`id`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `nom` (`nom`), ADD KEY `droit` (`droit`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `configs`
--
ALTER TABLE `configs`
MODIFY `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=29;
--
-- AUTO_INCREMENT pour la table `contacts`
--
ALTER TABLE `contacts`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT pour la table `droits`
--
ALTER TABLE `droits`
MODIFY `id` int(5) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT pour la table `logs`
--
ALTER TABLE `logs`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=379;
--
-- AUTO_INCREMENT pour la table `messages`
--
ALTER TABLE `messages`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=18;
--
-- AUTO_INCREMENT pour la table `modules`
--
ALTER TABLE `modules`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT pour la table `news`
--
ALTER TABLE `news`
MODIFY `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=89;
--
-- AUTO_INCREMENT pour la table `sections`
--
ALTER TABLE `sections`
MODIFY `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=23;
--
-- AUTO_INCREMENT pour la table `tarifs`
--
ALTER TABLE `tarifs`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT pour la table `type_tarifs`
--
ALTER TABLE `type_tarifs`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=24;
--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `logs`
--
ALTER TABLE `logs`
ADD CONSTRAINT `clef étrangère` FOREIGN KEY (`user`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `messages`
--
ALTER TABLE `messages`
ADD CONSTRAINT `messages` FOREIGN KEY (`contact`) REFERENCES `contacts` (`id`);

--
-- Contraintes pour la table `news`
--
ALTER TABLE `news`
ADD CONSTRAINT `foreign key` FOREIGN KEY (`auteur`) REFERENCES `users` (`id`) ON UPDATE NO ACTION,
ADD CONSTRAINT `foreign key2` FOREIGN KEY (`section`) REFERENCES `sections` (`id`);

--
-- Contraintes pour la table `sections`
--
ALTER TABLE `sections`
ADD CONSTRAINT `clef users` FOREIGN KEY (`auteur`) REFERENCES `users` (`id`);

--
-- Contraintes pour la table `tarifs`
--
ALTER TABLE `tarifs`
ADD CONSTRAINT `tarifs_ibfk_1` FOREIGN KEY (`type`) REFERENCES `type_tarifs` (`id`);

--
-- Contraintes pour la table `users`
--
ALTER TABLE `users`
ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`droit`) REFERENCES `droits` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
