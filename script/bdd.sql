-- phpMyAdmin SQL Dump
-- version 4.2.12deb2+deb8u2
-- http://www.phpmyadmin.net
--
-- Client :  localhost
-- Généré le :  Lun 05 Février 2018 à 19:09
-- Version du serveur :  5.5.59-0+deb8u1
-- Version de PHP :  5.6.33-0+deb8u1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données :  `ludh2o`
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
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;

--
-- Contenu de la table `configs`
--

INSERT INTO `configs` (`id`, `tag`, `valeur`, `description`, `date`, `acces_client`, `type`) VALUES
(1, 'nom_site', 'Lud''H2O', 'Nom du site', '2018-01-21 19:02:56', 0, 'general'),
(2, 'slogan', '25 ans d''expérience, Médaillé du Fédération Patronnale du Batiment', 'phrase affichée dans le premier écran de la page d''accueil', '2018-01-24 19:07:44', 1, 'general'),
(3, 'titre_home', 'Lud''H²O, La source du savoir faire!', 'titre affiché dans le 1er écran de la homepage', '2018-01-22 00:29:47', 1, 'general'),
(4, 'cp', '27230', 'votre code postal', '2018-01-22 00:06:27', 1, 'general'),
(5, 'ville', 'Piencourt', 'la ville de vos locaux', '2018-01-22 00:06:35', 1, 'general'),
(6, 'tel', '06.10.66.39.47', 'votre numéro de téléphone', '2018-01-22 00:06:50', 1, 'general'),
(7, 'mail', 'ludh2o@outlook.fr', 'votre adresse mail', '2018-01-22 00:07:23', 1, 'general'),
(8, 'adresse', 'chez Dédé', 'adresse de vos locaux', '2018-01-22 00:09:00', 1, 'general'),
(9, 'open_hours', '                          ', '', '2017-05-18 16:49:24', 0, 'general'),
(11, 'news_par_page', '5', 'nombre d''lémént listés par pagination dans les pages de section et le slider sur le front', '2018-01-21 19:19:21', 0, 'general'),
(12, 'taille_miniatures', '[370, 220]', '', '0000-00-00 00:00:00', 0, 'core'),
(13, 'separateur_menu', '@', 'sépare les éléments du menu', '2018-01-24 18:56:11', 1, 'general'),
(18, 'txt_inter1', 'Nous travaillons avec des professionnels', 'message entre les deux 1er écrans de la home', '2018-01-23 22:08:49', 1, 'general'),
(19, 'txt_inter2', 'Pour vous garantir des travaux de qualité ...', 'message entre le 2eme et 3eme écran de la homepage', '2018-01-24 01:31:24', 1, 'general'),
(20, 'txt_screen2', 'notre réseau...', 'message affiché dans l''écran 2', '2018-01-24 00:26:53', 0, 'general'),
(24, 'color', '202356', 'code hexa de la couleur du texte', '2018-01-23 22:19:52', 0, 'css'),
(25, 'background-color', 'e1ecff', 'couleur de fond du site', '2018-01-23 22:18:48', 0, 'css'),
(26, 'couleur_lien', '262125', 'couleur des liens', '2017-05-18 16:53:38', 0, 'css'),
(27, 'couleur_lien_actif', 'e31051', 'couleur des liens actifs ou survolés', '2017-05-18 16:53:45', 0, 'css'),
(28, 'url_google_map', 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3216.8608686622097!2d0.3969191158773839!3d49.166091286945374!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x47e1b9a8c4be2775%3A0x5d06db734e92d479!2s3+Piencourt%2C+27230+Piencourt!5e1!3m2!1sfr!2sfr!4v1516748665930', 'url embed google maps', '2018-01-23 23:06:02', 0, 'general'),
(29, 'font-family', '''The Girl Next Door'', cursive', 'règle css pour la police      font-family: ''Parisienne'', cursive;      font-family: ''Calligraffitti'', cursive;      font-family: ''Great Vibes'', cursive;      font-family: ''Marck Script'', cursive;      font-family: ''Mr Dafoe'', cursive;', '2017-05-31 09:49:16', 0, 'font'),
(30, 'import_url', 'https://fonts.googleapis.com/css?family=Calligraffitti|Great%20Vibes|Marck%20Script|Mr%20Dafoe|Parisienne|Josefin+Sans|The+Girl+Next+Door', 'url de la font', '2017-05-31 09:49:00', 0, 'font'),
(31, 'font-size_body', '1.7', 'taille du texte dans les pages', '2018-01-24 15:17:24', 1, 'font'),
(32, 'font-size_h2', '5', 'taille du texte dans les titres', '2018-01-24 15:17:53', 1, 'font'),
(33, 'flexslider_background-color', '3a97d4', 'couleur de fond du carrousel', '2018-01-24 15:21:16', 0, 'css'),
(34, 'form_background-color', '3a97d4', 'couleur de fond du formulaire de contact', '2018-01-24 02:45:18', 0, 'general');

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
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

--
-- Contenu de la table `contacts`
--

INSERT INTO `contacts` (`id`, `nom`, `prenom`, `tel`, `adresse`, `cp`, `ville`, `note`, `mail`, `type_contact`, `date`) VALUES
(1, 'test', 'test', '00.00.00.00.00', '5 rue des tests', '50000', 'VilleTest', 'c''est un boulet celui là', 'test@test.fr', 'livreor', '2017-05-11 12:24:04'),
(8, 'nom', 'prenom', '', '', '', '', 'les gamins lui jettent des pierres', 'ttt@test.com', 'livreor', '2017-05-11 12:22:56'),
(9, 'bla', 'blabla', '', '', '', '', '', 'blabla@bla.fr', 'livreor', '2017-05-11 10:01:04'),
(10, 'bidule', 'machin', '', '', '', '', 'on l''aime bien au village...', 'machinbidule@truc.com', 'livreor', '2017-05-11 12:19:31'),
(11, 'test', 'dernier', '', '', '', '', 'message du livre d''or supprimé, c''est un con', 'derniertest@test.fr', 'livreor', '2018-01-22 18:09:39'),
(12, 'Gonzola', 'Igor', '', '', '', '', 'miam', 'igorgonzola@truc.com', 'form_contact', '2018-01-21 22:50:56'),
(13, 'Tarsèche', 'Guy', '', '', '', '', 'à lire à haute voix', 'guytarseche@bidule.fr', 'form_contact', '2018-01-21 22:51:15'),
(14, 'hgfhgfh', 'gfhgfhf', '', '', '', '', '', 'hfghgf@truc.fr', 'livreor', '2018-01-21 22:46:27'),
(15, 'test', 'prénom', '', '', '', '', '', 'pouet@pouet.fr', 'form_contact', '2018-01-24 18:40:15'),
(16, 'bidulre', 'machine', '', '', '', '', '', 'bidule@machine.fr', 'livreor', '2018-01-24 18:41:39');

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
-- Structure de la table `logs`
--

CREATE TABLE IF NOT EXISTS `logs` (
`id` int(10) unsigned NOT NULL,
  `user` int(10) unsigned NOT NULL,
  `date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ip` varchar(100) NOT NULL DEFAULT '',
  `action` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB AUTO_INCREMENT=768 DEFAULT CHARSET=utf8;

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
(19, 1, '2017-05-09 09:56:39', '192.168.10.254', 'Authentification'),
(20, 1, '2017-05-09 10:11:40', '192.168.10.254', 'add configs: L''option test a bien été créée, elle porte l''id : 23'),
(21, 1, '2017-05-09 10:14:21', '192.168.10.254', 'mod configs: L''option test a bien été créée, elle porte l''id : 23'),
(22, 1, '2017-05-09 10:19:44', '192.168.10.254', 'mod users: Le compte 2 a bien été mis à jour.'),
(23, 1, '2017-05-09 10:23:25', '192.168.10.254', 'logout'),
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
(111, 1, '2017-05-10 16:22:05', '192.168.10.254', 'Authentification'),
(112, 1, '2017-05-10 16:22:20', '192.168.10.254', 'mod configs: L''option slogan a bien été créée, elle porte l''id : 2'),
(116, 1, '2017-05-10 16:25:01', '192.168.10.254', 'list news: '),
(117, 1, '2017-05-10 16:25:11', '192.168.10.254', 'del news: L''article &laquo;Exemple de news 50 &raquo a correctement été supprimé ( id: 50)'),
(120, 1, '2017-05-10 20:13:55', '192.168.10.254', 'Authentification'),
(121, 1, '2017-05-10 20:14:20', '192.168.10.254', 'mod sections: La section "Blog" est bien en bdd, elle porte l''id : 5'),
(122, 1, '2017-05-10 20:15:01', '192.168.10.254', 'logout'),
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
(180, 1, '2017-05-11 15:36:31', '192.168.10.254', 'modules configs: Mise à jour effectuée'),
(181, 1, '2017-05-11 16:13:42', '192.168.10.254', 'modules configs: Mise à jour effectuée'),
(182, 1, '2017-05-11 16:17:44', '192.168.10.254', 'modules configs: Mise à jour effectuée'),
(183, 1, '2017-05-11 16:24:45', '192.168.10.254', 'modules configs: Mise à jour effectuée'),
(184, 1, '2017-05-11 16:54:43', '192.168.10.254', 'modules configs: Mise à jour effectuée'),
(187, 1, '2017-05-11 16:59:27', '192.168.10.254', 'modules configs: Mise à jour effectuée'),
(190, 1, '2017-05-11 16:59:58', '192.168.10.254', 'modules configs: Mise à jour effectuée'),
(191, 1, '2017-05-11 17:06:02', '192.168.10.254', 'modules configs: Mise à jour effectuée'),
(192, 1, '2017-05-11 17:06:16', '192.168.10.254', 'modules configs: Mise à jour effectuée'),
(193, 1, '2017-05-11 17:09:57', '192.168.10.254', 'modules configs: Mise à jour effectuée'),
(194, 1, '2017-05-11 17:10:53', '192.168.10.254', 'modules configs: Mise à jour effectuée'),
(195, 1, '2017-05-11 17:56:15', '192.168.10.254', 'Authentification'),
(196, 1, '2017-05-11 17:56:23', '192.168.10.254', 'modules configs: Mise à jour effectuée'),
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
(252, 22, '2017-05-14 14:08:12', '92.148.204.65', 'Authentification'),
(253, 22, '2017-05-14 14:10:20', '92.148.204.65', 'logout'),
(256, 22, '2017-05-14 14:20:21', '92.148.204.65', 'Authentification'),
(257, 1, '2017-05-15 07:35:02', '192.168.10.254', 'Authentification'),
(258, 1, '2017-05-15 12:27:44', '192.168.10.254', 'Authentification'),
(259, 1, '2017-05-15 12:31:05', '192.168.10.254', 'mod configs: L''option news_par_page a bien été créée, elle porte l''id : 11'),
(260, 22, '2017-05-15 12:31:06', '92.148.204.65', 'Authentification'),
(261, 1, '2017-05-15 12:32:23', '192.168.10.254', 'mod news: L''article "tout casser!" est bien en bdd, il porte l''id : 84'),
(262, 1, '2017-05-15 12:35:56', '192.168.10.254', 'logout'),
(264, 22, '2017-05-15 12:36:23', '92.148.204.65', 'logout'),
(265, 22, '2017-05-15 12:37:35', '92.148.204.65', 'Authentification'),
(266, 22, '2017-05-15 12:37:55', '92.148.204.65', 'list news: '),
(268, 1, '2017-05-15 12:38:25', '192.168.10.254', 'Authentification'),
(269, 22, '2017-05-15 12:43:23', '92.148.204.65', 'mod sections: La section "Fleurs" est bien en bdd, elle porte l''id : 22'),
(270, 22, '2017-05-15 12:49:52', '92.148.204.65', 'modules configs: Mise à jour effectuée'),
(271, 22, '2017-05-15 12:50:18', '92.148.204.65', 'modules configs: Mise à jour effectuée'),
(272, 22, '2017-05-15 12:50:46', '92.148.204.65', 'logout'),
(273, 22, '2017-05-15 12:50:56', '92.148.204.65', 'Authentification'),
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
(370, 1, '2017-05-18 17:15:21', '192.168.10.254', 'modules configs: Mise à jour effectuée : tarifs, livreor, configs'),
(372, 1, '2017-05-18 17:25:23', '192.168.10.254', 'mod configs: L''option txt_inter2 a bien été enregistrée, valeur : Et bien plus...'),
(373, 1, '2017-05-18 17:29:23', '192.168.10.254', 'modules configs: Mise à jour effectuée : tarifs, livreor, form_contact, configs<br>Array, Mettre à jour'),
(374, 1, '2017-05-18 17:30:25', '192.168.10.254', 'modules configs: Mise à jour effectuée : tarifs, livreor, form_contact, configs'),
(375, 1, '2017-05-18 17:30:32', '192.168.10.254', 'modules configs: Mise à jour effectuée : tarifs, livreor, configs'),
(376, 1, '2017-05-18 17:30:48', '192.168.10.254', 'mod configs: L''option txt_inter2 a bien été enregistrée, valeur : Et bien plus...'),
(377, 1, '2017-05-18 17:36:22', '192.168.10.254', 'mod configs: L''option txt_inter2 a bien été enregistrée, valeur : Et bien plus...'),
(378, 1, '2017-05-18 17:37:33', '192.168.10.254', 'mod configs: L''option slogan a bien été enregistrée, valeur : 27 années au service de vos jardins!!'),
(379, 1, '2017-05-18 18:38:51', '192.168.10.254', 'Authentification'),
(380, 1, '2017-05-18 19:17:58', '192.168.10.254', 'mod configs: L''option news_par_page a bien été enregistrée, valeur : 6'),
(381, 1, '2017-05-18 19:18:22', '192.168.10.254', 'mod configs: L''option url_google_map a bien été enregistrée, valeur : https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d2612.954028693254!2d0.7825544156824915!3d49.08751387931062!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x47e10c79b143362d%3A0'),
(382, 1, '2017-05-18 19:18:36', '192.168.10.254', 'mod configs: L''option nom_site a bien été enregistrée, valeur : Arbre &amp; Nature'),
(383, 1, '2017-05-18 21:17:47', '192.168.10.254', 'Authentification'),
(384, 1, '2017-05-18 21:40:25', '192.168.10.254', 'add configs: L''option font-family a bien été enregistrée, valeur : ''Parisienne'', cursive'),
(385, 1, '2017-05-18 21:41:59', '192.168.10.254', 'add configs: L''option import_url a bien été enregistrée, valeur : https://fonts.googleapis.com/css?family=Parisienne'),
(386, 1, '2017-05-18 22:08:52', '192.168.10.254', 'mod configs: L''option import_url a bien été enregistrée, valeur : https://fonts.googleapis.com/css?family=Calligraffitti|Great+Vibes|Marck+Script|Mr+Dafoe|Parisienne'),
(387, 1, '2017-05-18 22:09:57', '192.168.10.254', 'mod configs: L''option font-family a bien été enregistrée, valeur : ''Parisienne'', cursive'),
(388, 1, '2017-05-18 22:11:00', '192.168.10.254', 'mod configs: L''option font-family a bien été enregistrée, valeur : ''Mr Dafoe'', cursive'),
(389, 1, '2017-05-18 22:55:26', '192.168.10.254', 'mod users: Le compte 2 a bien été mis à jour.'),
(390, 1, '2017-05-18 22:55:43', '192.168.10.254', 'del users: L''utilisateur &laquo;test1 &raquo a correctement été supprimée ( id: 4)'),
(393, 1, '2017-05-18 23:00:25', '192.168.10.254', 'mod configs: L''option nom_site a bien été enregistrée, valeur : Arbre &amp; Nature'),
(394, 1, '2017-05-18 23:00:40', '192.168.10.254', 'mod configs: L''option nom_site a bien été enregistrée, valeur : Arbre &amp; Nature'),
(395, 1, '2017-05-18 23:00:46', '192.168.10.254', 'mod configs: L''option titre_home a bien été enregistrée, valeur : Arbre &amp; Nature*'),
(396, 1, '2017-05-18 23:03:29', '192.168.10.254', 'mod configs: L''option import_url a bien été enregistrée, valeur : https://fonts.googleapis.com/css?family=Calligraffitti|Great+Vibes|Marck+Script|Mr+Dafoe|Parisienne'),
(398, 1, '2017-05-19 00:07:02', '192.168.10.254', 'modules configs: Mise à jour effectuée : sections, tarifs, livreor, configs'),
(402, 1, '2017-05-19 15:17:51', '192.168.10.254', 'Authentification'),
(403, 1, '2017-05-19 21:54:27', '192.168.10.254', 'Authentification'),
(404, 1, '2017-05-19 22:10:56', '192.168.10.254', 'modules configs: Mise à jour effectuée : sections, tarifs, livreor, form_contact, configs'),
(405, 1, '2017-05-19 22:23:18', '192.168.10.254', 'logout'),
(406, 1, '2017-05-19 22:23:31', '192.168.10.254', 'Authentification'),
(407, 1, '2017-05-19 22:36:13', '192.168.10.254', 'modules configs: Mise à jour effectuée : sections, tarifs, form_contact, configs'),
(408, 1, '2017-05-19 22:43:45', '192.168.10.254', 'mod configs: L''option news_par_page a bien été enregistrée, valeur : 3'),
(409, 1, '2017-05-19 22:43:56', '192.168.10.254', 'mod configs: L''option separateur_menu a bien été enregistrée, valeur : ๑'),
(410, 1, '2017-05-22 11:48:14', '192.168.10.254', 'Authentification'),
(411, 1, '2017-05-22 11:51:37', '192.168.10.254', 'mod configs: L''option import_url a bien été enregistrée, valeur : https://fonts.googleapis.com/css?family=Calligraffitti|Great+Vibes|Marck+Script|Mr+Dafoe|Parisienne'),
(412, 1, '2017-05-22 11:57:51', '192.168.10.254', 'modules configs: Mise à jour effectuée : sections, tarifs, livreor, form_contact, configs'),
(413, 1, '2017-05-22 12:04:22', '192.168.10.254', 'modules configs: Mise à jour effectuée : sections, tarifs, form_contact, configs'),
(414, 1, '2017-05-22 12:04:35', '192.168.10.254', 'modules configs: Mise à jour effectuée : sections, tarifs, form_contact, configs'),
(415, 1, '2017-05-22 12:04:37', '192.168.10.254', 'modules configs: Mise à jour effectuée : sections, tarifs, form_contact, configs'),
(416, 1, '2017-05-22 12:04:42', '192.168.10.254', 'modules configs: Mise à jour effectuée : sections, tarifs, livreor, form_contact, configs'),
(417, 1, '2017-05-23 20:50:13', '192.168.10.254', 'Authentification'),
(418, 22, '2017-05-23 21:09:46', '90.40.0.56', 'Authentification'),
(419, 1, '2017-05-23 21:56:46', '192.168.10.254', 'Authentification'),
(420, 22, '2017-05-23 22:25:20', '90.40.0.56', 'Authentification'),
(421, 22, '2017-05-23 22:26:24', '90.40.0.56', 'Authentification'),
(422, 22, '2017-05-23 22:26:35', '90.40.0.56', 'logout'),
(423, 22, '2017-05-23 22:26:53', '90.40.0.56', 'Authentification'),
(424, 1, '2017-05-23 22:27:30', '192.168.10.254', 'Authentification'),
(425, 1, '2017-05-23 22:29:33', '192.168.10.254', 'logout'),
(426, 1, '2017-05-24 10:39:03', '192.168.10.254', 'Authentification'),
(427, 1, '2017-05-31 07:54:47', '192.168.10.254', 'Authentification'),
(428, 1, '2017-05-31 07:55:23', '192.168.10.254', 'mod sections: La section "Les Terrasses" est bien en bdd, elle porte l''id : 6'),
(429, 1, '2017-05-31 07:55:52', '192.168.10.254', 'mod sections: La section "Les Pergolas" est bien en bdd, elle porte l''id : 9'),
(430, 1, '2017-05-31 07:56:09', '192.168.10.254', 'mod sections: La section "L''Engazonnement" est bien en bdd, elle porte l''id : 12'),
(431, 22, '2017-05-31 08:25:54', '90.6.172.82', 'Authentification'),
(432, 22, '2017-05-31 09:09:15', '90.6.172.82', 'mod configs: L''option import_url a bien été enregistrée, valeur : https://fonts.googleapis.com/css?family=Josefin+Sans'),
(433, 22, '2017-05-31 09:13:52', '90.6.172.82', 'mod configs: L''option font-family a bien été enregistrée, valeur : ''Josephin Sans'', Sans Serif'),
(434, 1, '2017-05-31 09:29:15', '192.168.10.254', 'Authentification'),
(435, 1, '2017-05-31 09:36:42', '192.168.10.254', 'mod configs: L''option import_url a bien été enregistrée, valeur : https://fonts.googleapis.com/css?family=Calligraffitti|Great%20Vibes|Marck%20Script|Mr%20Dafoe|Parisienne|Josefin+Sans'),
(436, 22, '2017-05-31 09:49:00', '90.6.172.82', 'mod configs: L''option import_url a bien été enregistrée, valeur : https://fonts.googleapis.com/css?family=Calligraffitti|Great%20Vibes|Marck%20Script|Mr%20Dafoe|Parisienne|Josefin+Sans|The+Girl+Next+Door'),
(437, 22, '2017-05-31 09:49:16', '90.6.172.82', 'mod configs: L''option font-family a bien été enregistrée, valeur : ''The Girl Next Door'', cursive'),
(438, 1, '2017-05-31 11:10:17', '192.168.10.254', 'Authentification'),
(439, 22, '2017-05-31 12:04:36', '90.6.172.82', 'Authentification'),
(440, 1, '2017-05-31 20:42:43', '192.168.10.254', 'Authentification'),
(441, 1, '2017-06-02 23:27:02', '192.168.10.254', 'Authentification'),
(442, 1, '2017-06-02 23:27:38', '192.168.10.254', 'mod sections: La section "Fleurs" est bien en bdd, elle porte l''id : 22'),
(443, 1, '2018-01-13 06:41:11', '192.168.10.55', 'Authentification'),
(444, 1, '2018-01-14 04:48:35', '192.168.10.55', 'Authentification'),
(445, 1, '2018-01-21 15:55:08', '192.168.10.55', 'Authentification'),
(446, 1, '2018-01-21 16:41:22', '192.168.10.55', 'Authentification'),
(447, 1, '2018-01-21 16:45:46', '192.168.10.55', 'logout'),
(448, 1, '2018-01-21 19:02:19', '192.168.10.55', 'Authentification'),
(449, 1, '2018-01-21 19:02:56', '192.168.10.55', 'mod configs: L''option nom_site a bien été enregistrée, valeur : Lud''H2O'),
(450, 1, '2018-01-21 19:12:02', '192.168.10.55', 'mod users: Le compte 1 a bien été mis à jour.'),
(451, 1, '2018-01-21 19:12:06', '192.168.10.55', 'logout'),
(452, 1, '2018-01-21 19:12:18', '192.168.10.55', 'Authentification'),
(453, 1, '2018-01-21 19:13:11', '192.168.10.55', 'del sections: La section &laquo;engazonnement &raquo a correctement été supprimée ( id: 12)'),
(454, 1, '2018-01-21 19:18:52', '192.168.10.55', 'del sections: La section &laquo;pergola &raquo a correctement été supprimée ( id: 9)'),
(455, 1, '2018-01-21 19:19:21', '192.168.10.55', 'mod configs: L''option news_par_page a bien été enregistrée, valeur : 5'),
(456, 1, '2018-01-21 19:44:19', '192.168.10.55', 'del users: L''utilisateur &laquo;nadine_la_secretaire &raquo a correctement été supprimée ( id: 23)'),
(457, 1, '2018-01-21 20:18:33', '192.168.10.55', 'del sections: La section &laquo;pergola &raquo a correctement été supprimée ( id: 9)'),
(458, 1, '2018-01-21 20:25:08', '192.168.10.55', 'mod sections: La section "Accueil site" est bien en bdd, elle porte l''id : 1'),
(459, 1, '2018-01-21 20:34:53', '192.168.10.55', 'mod sections: La section "Accueil sitez" est bien en bdd, elle porte l''id : 1'),
(460, 1, '2018-01-21 20:35:41', '192.168.10.55', 'mod sections: '),
(461, 1, '2018-01-21 20:39:23', '192.168.10.55', 'mod sections: '),
(462, 1, '2018-01-21 20:39:59', '192.168.10.55', 'mod sections: '),
(463, 1, '2018-01-21 20:42:22', '192.168.10.55', 'mod sections: '),
(464, 1, '2018-01-21 20:48:46', '192.168.10.55', 'mod sections: '),
(465, 1, '2018-01-21 20:49:34', '192.168.10.55', 'mod sections: '),
(466, 1, '2018-01-21 20:50:55', '192.168.10.55', 'mod sections: '),
(467, 1, '2018-01-21 20:53:20', '192.168.10.55', 'mod sections: La section "Accueil site" est bien en bdd, elle porte l''id : 1'),
(468, 1, '2018-01-21 20:55:22', '192.168.10.55', 'mod sections: '),
(469, 1, '2018-01-21 20:56:23', '192.168.10.55', 'mod sections: '),
(470, 1, '2018-01-21 20:56:32', '192.168.10.55', 'mod sections: La section "Accueil site" est bien en bdd, elle porte l''id : 1'),
(471, 1, '2018-01-21 20:56:42', '192.168.10.55', 'mod sections: La section "Accueil" est bien en bdd, elle porte l''id : 1'),
(472, 1, '2018-01-21 21:02:24', '192.168.10.55', 'del sections: La section &laquo;blog &raquo a correctement été supprimée ( id: 5)'),
(473, 1, '2018-01-21 21:02:31', '192.168.10.55', 'del sections: La section &laquo;nuage &raquo a correctement été supprimée ( id: 16)'),
(474, 1, '2018-01-21 21:02:34', '192.168.10.55', 'del sections: La section &laquo;terrasses &raquo a correctement été supprimée ( id: 6)'),
(475, 1, '2018-01-21 21:02:38', '192.168.10.55', 'del sections: La section &laquo;plantations &raquo a correctement été supprimée ( id: 7)'),
(476, 1, '2018-01-21 21:02:54', '192.168.10.55', 'del sections: La section &laquo;treillage &raquo a correctement été supprimée ( id: 10)'),
(477, 1, '2018-01-21 21:02:59', '192.168.10.55', 'del sections: La section &laquo;cloture_et_portail &raquo a correctement été supprimée ( id: 15)'),
(478, 1, '2018-01-21 21:03:03', '192.168.10.55', 'del sections: La section &laquo;allee &raquo a correctement été supprimée ( id: 11)'),
(479, 1, '2018-01-21 21:03:07', '192.168.10.55', 'del sections: La section &laquo;engazonnement &raquo a correctement été supprimée ( id: 12)'),
(480, 1, '2018-01-21 21:03:10', '192.168.10.55', 'del sections: La section &laquo;boiserie &raquo a correctement été supprimée ( id: 13)'),
(481, 1, '2018-01-21 21:03:14', '192.168.10.55', 'del sections: La section &laquo;entretien &raquo a correctement été supprimée ( id: 14)'),
(482, 1, '2018-01-21 21:03:19', '192.168.10.55', 'del sections: La section &laquo;fleurs &raquo a correctement été supprimée ( id: 22)'),
(483, 1, '2018-01-21 21:08:20', '192.168.10.55', 'modules configs: Mise à jour effectuée : sections, livreor, form_contact, configs'),
(484, 1, '2018-01-21 21:08:40', '192.168.10.55', 'modules configs: Mise à jour effectuée : sections, tarifs, livreor, form_contact, configs'),
(485, 1, '2018-01-21 21:09:33', '192.168.10.55', 'del users: L''utilisateur &laquo;moe &raquo a correctement été supprimée ( id: 22)'),
(486, 1, '2018-01-21 21:15:21', '192.168.10.55', 'mod users: Le compte 2 a bien été mis à jour.'),
(487, 2, '2018-01-21 21:15:57', '192.168.10.55', 'Authentification'),
(488, 1, '2018-01-21 21:17:37', '192.168.10.55', 'modules configs: Mise à jour effectuée : users, sections, tarifs, livreor, form_contact, configs'),
(489, 1, '2018-01-21 21:21:18', '192.168.10.55', 'del users: '),
(490, 1, '2018-01-21 21:22:37', '192.168.10.55', 'modules configs: Mise à jour effectuée : sections'),
(491, 1, '2018-01-21 21:28:02', '192.168.10.55', 'modules configs: Mise à jour effectuée : sections, configs'),
(492, 1, '2018-01-21 21:32:59', '192.168.10.55', 'modules configs: Mise à jour effectuée : users, sections, configs'),
(493, 1, '2018-01-21 21:33:59', '192.168.10.55', 'modules configs: Mise à jour effectuée : sections, configs'),
(494, 1, '2018-01-21 21:35:07', '192.168.10.55', 'modules configs: Mise à jour effectuée : users, sections, configs'),
(495, 1, '2018-01-21 21:37:12', '192.168.10.55', 'modules configs: Mise à jour effectuée : '),
(496, 1, '2018-01-21 21:37:28', '192.168.10.55', 'modules configs: Mise à jour effectuée : configs'),
(497, 1, '2018-01-21 21:37:44', '192.168.10.55', 'modules configs: Mise à jour effectuée : '),
(498, 1, '2018-01-21 21:39:43', '192.168.10.55', 'modules configs: Mise à jour effectuée : '),
(499, 1, '2018-01-21 21:40:01', '192.168.10.55', 'modules configs: Mise à jour effectuée : configs'),
(500, 1, '2018-01-21 21:43:33', '192.168.10.55', 'modules configs: Mise à jour effectuée : configs'),
(501, 1, '2018-01-21 21:43:36', '192.168.10.55', 'modules configs: Mise à jour effectuée : aucun module'),
(502, 1, '2018-01-21 21:46:36', '192.168.10.55', 'modules configs: Mise à jour effectuée : aucun module'),
(503, 1, '2018-01-21 21:48:03', '192.168.10.55', 'modules configs: Mise à jour effectuée : sections'),
(504, 1, '2018-01-21 21:48:50', '192.168.10.55', 'modules configs: Mise à jour effectuée : sections'),
(505, 1, '2018-01-21 21:48:54', '192.168.10.55', 'modules configs: Mise à jour effectuée : sections'),
(506, 1, '2018-01-21 21:49:07', '192.168.10.55', 'modules configs: Mise à jour effectuée : sections'),
(507, 1, '2018-01-21 21:51:50', '192.168.10.55', 'modules configs: Mise à jour effectuée : sections, configs'),
(508, 1, '2018-01-21 21:52:30', '192.168.10.55', 'mod sections: La section "Livre d''Or" est bien en bdd, elle porte l''id : 20'),
(509, 1, '2018-01-21 21:56:28', '192.168.10.55', 'mod sections: La section "Contact" est bien en bdd, elle porte l''id : 3'),
(510, 1, '2018-01-21 22:00:54', '192.168.10.55', 'mod sections: La section "Contact" est bien en bdd, elle porte l''id : 3'),
(511, 1, '2018-01-21 22:43:46', '192.168.10.55', 'modules configs: Mise à jour effectuée : sections, livreor, configs'),
(512, 1, '2018-01-21 22:45:19', '192.168.10.55', 'modules configs: Mise à jour effectuée : sections, livreor, configs'),
(513, 1, '2018-01-21 22:50:56', '192.168.10.55', 'mod contacts: Le contact Igor Gonzola a bien été mis à jour.'),
(514, 1, '2018-01-21 22:51:15', '192.168.10.55', 'mod contacts: Le contact Guy Tarsèche a bien été mis à jour.'),
(515, 1, '2018-01-21 22:55:36', '192.168.10.55', 'modules configs: Mise à jour effectuée : sections, configs'),
(516, 1, '2018-01-21 23:02:29', '192.168.10.55', 'list news: '),
(517, 1, '2018-01-21 23:02:36', '192.168.10.55', 'list news: '),
(518, 1, '2018-01-21 23:02:41', '192.168.10.55', 'list news: '),
(519, 1, '2018-01-21 23:03:13', '192.168.10.55', 'mod news: L''article "oh la belle terrasse !" est bien en bdd, il porte l''id : 77'),
(520, 1, '2018-01-21 23:04:42', '192.168.10.55', 'list news: '),
(521, 1, '2018-01-21 23:05:32', '192.168.10.55', 'list news: '),
(522, 1, '2018-01-21 23:06:00', '192.168.10.55', 'list news: '),
(523, 1, '2018-01-21 23:08:45', '192.168.10.55', 'list news: '),
(524, 1, '2018-01-21 23:10:16', '192.168.10.55', 'list news: '),
(525, 1, '2018-01-21 23:12:21', '192.168.10.55', 'list news: '),
(526, 1, '2018-01-21 23:12:56', '192.168.10.55', 'list news: '),
(527, 1, '2018-01-21 23:13:09', '192.168.10.55', 'list news: '),
(528, 1, '2018-01-21 23:14:42', '192.168.10.55', 'list news: '),
(529, 1, '2018-01-21 23:20:14', '192.168.10.55', 'del news: L''article &laquo;oh la belle terrasse ! &raquo a correctement été supprimé ( id: 77)'),
(530, 1, '2018-01-21 23:21:51', '192.168.10.55', 'del news: L''article &laquo;Essai de puzzle &raquo a correctement été supprimé ( id: 76)'),
(531, 1, '2018-01-21 23:21:54', '192.168.10.55', 'del news: L''article &laquo;Puzzle &raquo a correctement été supprimé ( id: 75)'),
(532, 1, '2018-01-21 23:21:56', '192.168.10.55', 'del news: L''article &laquo;Pavot &raquo a correctement été supprimé ( id: 74)'),
(533, 1, '2018-01-21 23:40:40', '192.168.10.55', 'del news: L''article &laquo;Sucrine du berry &raquo a correctement été supprimé ( id: 72)'),
(534, 1, '2018-01-21 23:40:45', '192.168.10.55', 'del news: L''article &laquo;tableau végétal &raquo a correctement été supprimé ( id: 71)'),
(535, 1, '2018-01-21 23:40:57', '192.168.10.55', 'del news: L''article &laquo;test contrib &raquo a correctement été supprimé ( id: 80)'),
(536, 1, '2018-01-21 23:41:11', '192.168.10.55', 'del news: L''article &laquo;Intallation de jardinière de toît &raquo a correctement été supprimé ( id: 81)');
INSERT INTO `logs` (`id`, `user`, `date`, `ip`, `action`) VALUES
(537, 1, '2018-01-21 23:41:14', '192.168.10.55', 'del news: L''article &laquo;Merci la tempête :( &raquo a correctement été supprimé ( id: 68)'),
(538, 1, '2018-01-21 23:42:12', '192.168.10.55', 'del news: L''article &laquo;Merci la tempête (bis) &raquo a correctement été supprimé ( id: 83)'),
(539, 1, '2018-01-21 23:42:16', '192.168.10.55', 'del news: L''article &laquo;Ginkgo biloba à l''école &raquo a correctement été supprimé ( id: 82)'),
(540, 1, '2018-01-21 23:42:28', '192.168.10.55', 'mod news: L''article "Pour canards" est bien en bdd, il porte l''id : 73'),
(541, 1, '2018-01-21 23:42:42', '192.168.10.55', 'del news: L''article &laquo;Allée &raquo a correctement été supprimé ( id: 78)'),
(542, 1, '2018-01-21 23:42:48', '192.168.10.55', 'del news: L''article &laquo;Ohoho le ciel &raquo a correctement été supprimé ( id: 86)'),
(543, 1, '2018-01-21 23:42:51', '192.168.10.55', 'del news: L''article &laquo;test &raquo a correctement été supprimé ( id: 67)'),
(544, 1, '2018-01-21 23:43:00', '192.168.10.55', 'del news: L''article &laquo;Mini golf 2 &raquo a correctement été supprimé ( id: 85)'),
(545, 1, '2018-01-21 23:43:07', '192.168.10.55', 'list news: '),
(546, 1, '2018-01-21 23:43:20', '192.168.10.55', 'del news: L''article &laquo;Réparation de serre &raquo a correctement été supprimé ( id: 79)'),
(547, 1, '2018-01-21 23:46:02', '192.168.10.55', 'del news: L''article &laquo;tout casser! &raquo a correctement été supprimé ( id: 84)'),
(548, 1, '2018-01-21 23:51:09', '192.168.10.55', 'add sections: La section "Fournisseurs" est bien en bdd, elle porte l''id : 23'),
(549, 1, '2018-01-21 23:51:38', '192.168.10.55', 'add sections: La section "Partenaires" est bien en bdd, elle porte l''id : 24'),
(550, 1, '2018-01-21 23:52:01', '192.168.10.55', 'mod sections: La section "Fournisseurs" est bien en bdd, elle porte l''id : 23'),
(551, 1, '2018-01-21 23:52:11', '192.168.10.55', 'mod sections: La section "Partenaires" est bien en bdd, elle porte l''id : 24'),
(552, 1, '2018-01-21 23:53:11', '192.168.10.55', 'add sections: La section "Réalisation" est bien en bdd, elle porte l''id : 25'),
(553, 1, '2018-01-21 23:54:20', '192.168.10.55', 'mod sections: La section "Réalisation" est bien en bdd, elle porte l''id : 25'),
(554, 1, '2018-01-21 23:54:51', '192.168.10.55', 'mod news: L''article "Pour canards" est bien en bdd, il porte l''id : 73'),
(555, 1, '2018-01-21 23:54:57', '192.168.10.55', 'list news: '),
(556, 1, '2018-01-21 23:56:17', '192.168.10.55', 'mod sections: La section "Accueil" est bien en bdd, elle porte l''id : 1'),
(557, 1, '2018-01-21 23:57:35', '192.168.10.55', 'mod sections: La section "Autres Prestations" est bien en bdd, elle porte l''id : 8'),
(558, 1, '2018-01-21 23:57:43', '192.168.10.55', 'mod sections: La section "Réalisation" est bien en bdd, elle porte l''id : 25'),
(559, 1, '2018-01-21 23:58:17', '192.168.10.55', 'mod sections: La section "Réalisations" est bien en bdd, elle porte l''id : 25'),
(560, 2, '2018-01-22 00:03:05', '192.168.10.55', 'Authentification'),
(561, 2, '2018-01-22 00:05:58', '192.168.10.55', 'mod configs: L''option slogan a bien été enregistrée, valeur : La source du savoir faire'),
(562, 2, '2018-01-22 00:06:17', '192.168.10.55', 'mod configs: L''option titre_home a bien été enregistrée, valeur : Lud''H2O'),
(563, 2, '2018-01-22 00:06:27', '192.168.10.55', 'mod configs: L''option cp a bien été enregistrée, valeur : 27230'),
(564, 2, '2018-01-22 00:06:35', '192.168.10.55', 'mod configs: L''option ville a bien été enregistrée, valeur : Piencourt'),
(565, 2, '2018-01-22 00:06:51', '192.168.10.55', 'mod configs: L''option tel a bien été enregistrée, valeur : 06.10.66.39.47'),
(566, 2, '2018-01-22 00:07:23', '192.168.10.55', 'mod configs: L''option mail a bien été enregistrée, valeur : ludh2o@outlook.fr'),
(567, 2, '2018-01-22 00:08:31', '192.168.10.55', 'mod configs: '),
(568, 2, '2018-01-22 00:08:52', '192.168.10.55', 'mod configs: L''option adresse a bien été enregistrée, valeur : chez dédé'),
(569, 2, '2018-01-22 00:09:00', '192.168.10.55', 'mod configs: L''option adresse a bien été enregistrée, valeur : chez Dédé'),
(570, 1, '2018-01-22 00:13:52', '192.168.10.55', 'mod configs: L''option separateur_menu a bien été enregistrée, valeur : ๑'),
(571, 2, '2018-01-22 00:15:51', '192.168.10.55', 'mod configs: L''option titre_home a bien été enregistrée, valeur : Lud''H²O'),
(572, 1, '2018-01-22 00:21:05', '192.168.10.55', 'mod sections: La section "Réalisations" est bien en bdd, elle porte l''id : 25'),
(573, 2, '2018-01-22 00:29:11', '192.168.10.55', 'mod configs: L''option slogan a bien été enregistrée, valeur : 25 ans d''expérience'),
(574, 2, '2018-01-22 00:29:47', '192.168.10.55', 'mod configs: L''option titre_home a bien été enregistrée, valeur : Lud''H²O, La source du savoir faire!'),
(575, 1, '2018-01-22 00:36:21', '192.168.10.55', 'list news: '),
(576, 2, '2018-01-22 00:38:27', '192.168.10.55', 'add news: L''article "Plein de cuivre cintré!" est bien en bdd, il porte l''id : 87'),
(577, 1, '2018-01-22 09:09:08', '192.168.10.55', 'Authentification'),
(578, 1, '2018-01-22 09:13:08', '192.168.10.55', 'modtype tarifs: Le groupe de tarifs Plomberie a bien été créée, il porte l''id : 3'),
(579, 1, '2018-01-22 09:14:23', '192.168.10.55', 'modtype tarifs: Le groupe de tarifs Chauffage a bien été créée, il porte l''id : 4'),
(580, 1, '2018-01-22 09:15:15', '192.168.10.55', 'mod tarifs: Le tarif Réparer une fuite a bien été créée, il porte l''id : 14'),
(581, 1, '2018-01-22 09:15:49', '192.168.10.55', 'mod tarifs: Le tarif Installation chaudière à pellet a bien été créée, il porte l''id : 15'),
(582, 1, '2018-01-22 09:16:12', '192.168.10.55', 'mod tarifs: Le tarif Installation chaudière à bois a bien été créée, il porte l''id : 16'),
(583, 1, '2018-01-22 09:16:44', '192.168.10.55', 'mod tarifs: Le tarif Poser une ventillation a bien été créée, il porte l''id : 1'),
(584, 1, '2018-01-22 09:17:12', '192.168.10.55', 'mod tarifs: Le tarif Dépannage a bien été créée, il porte l''id : 2'),
(585, 1, '2018-01-22 09:17:54', '192.168.10.55', 'mod tarifs: Le tarif Désambouage a bien été créée, il porte l''id : 3'),
(586, 1, '2018-01-22 09:18:46', '192.168.10.55', 'mod tarifs: Le tarif Faire un serpentin en cuivre a bien été créée, il porte l''id : 4'),
(587, 1, '2018-01-22 09:19:29', '192.168.10.55', 'mod tarifs: Le tarif Ramonage de cheminée a bien été créée, il porte l''id : 6'),
(588, 1, '2018-01-22 09:19:36', '192.168.10.55', 'mod tarifs: Le tarif Ramonage de cheminée a bien été créée, il porte l''id : 6'),
(589, 1, '2018-01-22 09:21:44', '192.168.10.55', 'mod tarifs: Le tarif Installation d''un adoucisseur d''eau a bien été créée, il porte l''id : 13'),
(590, 1, '2018-01-22 09:25:16', '192.168.10.55', 'mod news: L''article "plantage de capucines,  soucis et bourrache" est bien en bdd, il porte l''id : 70'),
(591, 1, '2018-01-22 09:25:28', '192.168.10.55', 'mod news: L''article "pillage des noisetiers" est bien en bdd, il porte l''id : 69'),
(592, 1, '2018-01-22 09:25:41', '192.168.10.55', 'list news: '),
(593, 1, '2018-01-22 09:25:50', '192.168.10.55', 'list news: '),
(594, 1, '2018-01-22 09:29:13', '192.168.10.55', 'modules configs: Mise à jour effectuée : sections, tarifs, configs'),
(595, 2, '2018-01-22 09:29:34', '192.168.10.55', 'Authentification'),
(596, 1, '2018-01-22 09:32:23', '192.168.10.55', 'mod users: Le compte 21 a bien été mis à jour.'),
(597, 2, '2018-01-22 09:32:31', '192.168.10.55', 'logout'),
(598, 21, '2018-01-22 09:32:38', '192.168.10.55', 'Authentification'),
(599, 1, '2018-01-22 15:39:51', '192.168.10.55', 'Authentification'),
(600, 1, '2018-01-22 15:40:37', '192.168.10.55', 'del livreor: Le message &laquo;Lorem ipsum dolor sit amet, consectetur adipiscing elit. In interdum felis fermentum ipsum molestie sed porttitor ligula rutrum. &raquo a correctement été supprimé ( id: 15)'),
(601, 1, '2018-01-22 15:59:05', '192.168.10.55', 'modules configs: Mise à jour effectuée : sections, tarifs, livreor, configs'),
(602, 21, '2018-01-22 16:44:23', '192.168.10.55', 'Authentification'),
(603, 1, '2018-01-22 17:19:07', '192.168.10.55', 'mod livreor: '),
(604, 1, '2018-01-22 17:40:00', '192.168.10.55', 'mod livreor: '),
(605, 1, '2018-01-22 18:00:44', '192.168.10.55', 'mod livreor: Message mis à jour!'),
(606, 1, '2018-01-22 18:02:37', '192.168.10.55', 'mod livreor: '),
(607, 1, '2018-01-22 18:04:05', '192.168.10.55', 'mod livreor: '),
(608, 1, '2018-01-22 18:04:55', '192.168.10.55', 'del livreor: Le message &laquo;\r\nLorem ipsum dolor sit amet, consectetur adipiscing elit. In interdum felis fermentum ipsum molestie sed porttitor ligula rutrum. &raquo a correctement été supprimé ( id: 12)'),
(609, 1, '2018-01-22 18:05:06', '192.168.10.55', 'mod livreor: Message mis à jour!'),
(610, 1, '2018-01-22 18:05:30', '192.168.10.55', 'del livreor: Le message &laquo;Lorem ipsum dolor sit amet, consectetur adipiscing elit. In interdum felis fermentum ipsum molestie sed porttitor ligula rutrum. &raquo a correctement été supprimé ( id: 13)'),
(611, 1, '2018-01-22 18:05:34', '192.168.10.55', 'del livreor: Le message &laquo;Lorem ipsum dolor sit amet, consectetur adipiscing elit. In interdum felis fermentum ipsum molestie sed porttitor ligula rutrum. &raquo a correctement été supprimé ( id: 14)'),
(612, 1, '2018-01-22 18:05:50', '192.168.10.55', 'mod livreor: Message mis à jour!'),
(613, 1, '2018-01-22 18:09:30', '192.168.10.55', 'mod contacts: Le contact dernier test a bien été mis à jour.'),
(614, 1, '2018-01-22 18:09:39', '192.168.10.55', 'mod contacts: Le contact dernier test a bien été mis à jour.'),
(615, 1, '2018-01-22 18:37:42', '192.168.10.55', 'mod livreor: Message mis à jour!'),
(616, 1, '2018-01-22 18:55:54', '192.168.10.55', 'mod livreor: '),
(617, 1, '2018-01-22 19:03:39', '192.168.10.55', 'mod livreor: '),
(618, 1, '2018-01-22 19:04:33', '192.168.10.55', 'mod livreor: '),
(619, 1, '2018-01-22 19:04:51', '192.168.10.55', 'mod livreor: Message mis à jour!'),
(620, 1, '2018-01-22 19:05:09', '192.168.10.55', 'mod livreor: Message mis à jour!'),
(621, 1, '2018-01-22 19:05:28', '192.168.10.55', 'mod livreor: '),
(622, 1, '2018-01-22 19:05:41', '192.168.10.55', 'mod livreor: Message mis à jour!'),
(623, 1, '2018-01-22 19:06:02', '192.168.10.55', 'mod livreor: '),
(624, 1, '2018-01-22 19:10:20', '192.168.10.55', 'mod livreor: '),
(625, 1, '2018-01-22 19:12:27', '192.168.10.55', 'mod livreor: '),
(626, 1, '2018-01-22 19:14:28', '192.168.10.55', 'mod news: L''article "pillage des noisetiers" est bien en bdd, il porte l''id : 69'),
(627, 1, '2018-01-22 19:34:42', '192.168.10.55', 'mod sections: La section "Contact" est bien en bdd, elle porte l''id : 3'),
(628, 1, '2018-01-22 19:34:55', '192.168.10.55', 'mod news: L''article "pillage des noisetiers" est bien en bdd, il porte l''id : 69'),
(629, 1, '2018-01-22 19:36:05', '192.168.10.55', 'mod news: L''article "pillage des noisetiers" est bien en bdd, il porte l''id : 69'),
(630, 1, '2018-01-22 19:36:14', '192.168.10.55', 'list news: '),
(631, 1, '2018-01-22 19:36:24', '192.168.10.55', 'mod news: L''article "Pour canards" est bien en bdd, il porte l''id : 73'),
(632, 1, '2018-01-22 19:36:55', '192.168.10.55', 'mod news: L''article "Pour canards" est bien en bdd, il porte l''id : 73'),
(633, 1, '2018-01-22 19:36:59', '192.168.10.55', 'list news: '),
(634, 1, '2018-01-22 19:38:04', '192.168.10.55', 'mod sections: La section "Contact" est bien en bdd, elle porte l''id : 3'),
(635, 1, '2018-01-22 19:41:44', '192.168.10.55', 'mod livreor: Message mis à jour!'),
(636, 1, '2018-01-22 19:41:49', '192.168.10.55', 'mod livreor: Message mis à jour!'),
(637, 1, '2018-01-22 19:41:54', '192.168.10.55', 'mod livreor: Message mis à jour!'),
(638, 1, '2018-01-23 08:40:24', '192.168.10.55', 'Authentification'),
(639, 1, '2018-01-23 08:40:37', '192.168.10.55', 'mod livreor: '),
(640, 1, '2018-01-23 08:48:11', '192.168.10.55', 'mod livreor: Aucune mise à jour effectuée.'),
(641, 1, '2018-01-23 08:48:22', '192.168.10.55', 'mod livreor: Aucune mise à jour effectuée.'),
(642, 1, '2018-01-23 08:48:28', '192.168.10.55', 'mod livreor: Message mis à jour!'),
(643, 1, '2018-01-23 11:02:05', '192.168.10.55', 'Authentification'),
(644, 2, '2018-01-23 11:02:54', '192.168.10.55', 'Authentification'),
(645, 1, '2018-01-23 11:03:12', '192.168.10.55', 'modules configs: Mise à jour effectuée : users, sections, tarifs, livreor, configs'),
(646, 1, '2018-01-23 11:08:26', '192.168.10.55', 'modules configs: Mise à jour effectuée : sections, tarifs, livreor, configs'),
(647, 1, '2018-01-23 11:12:56', '192.168.10.55', 'mod livreor: Aucune mise à jour effectuée. - id :18'),
(648, 1, '2018-01-23 11:13:01', '192.168.10.55', 'mod livreor: Message publié! - id :18'),
(649, 1, '2018-01-23 11:13:07', '192.168.10.55', 'mod livreor: Message masqué! - id :18'),
(650, 2, '2018-01-23 11:49:02', '192.168.10.55', 'Authentification'),
(651, 2, '2018-01-23 11:51:52', '192.168.10.55', 'add news: L''article "Pose d''un chauffe eau" est bien en bdd, il porte l''id : 88'),
(652, 2, '2018-01-23 11:52:24', '192.168.10.55', 'add sections: '),
(653, 2, '2018-01-23 11:52:41', '192.168.10.55', 'add sections: La section "Plomberie" est bien en bdd, elle porte l''id : 26'),
(654, 2, '2018-01-23 11:53:01', '192.168.10.55', 'add sections: La section "Chauffage" est bien en bdd, elle porte l''id : 27'),
(655, 2, '2018-01-23 11:53:52', '192.168.10.55', 'add news: L''article "des tuyaux" est bien en bdd, il porte l''id : 89'),
(656, 2, '2018-01-23 11:54:00', '192.168.10.55', 'list news: '),
(657, 2, '2018-01-23 11:54:04', '192.168.10.55', 'list news: '),
(658, 2, '2018-01-23 11:54:14', '192.168.10.55', 'mod news: L''article "Pose d''un chauffe eau" est bien en bdd, il porte l''id : 88'),
(659, 2, '2018-01-23 11:55:29', '192.168.10.55', 'add news: L''article "installation d''un lavabo" est bien en bdd, il porte l''id : 90'),
(660, 2, '2018-01-23 11:56:25', '192.168.10.55', 'add news: L''article "L''art d''esquiver une prise" est bien en bdd, il porte l''id : 91'),
(661, 2, '2018-01-23 11:57:33', '192.168.10.55', 'add news: L''article "Mise en place de plein de vannes" est bien en bdd, il porte l''id : 92'),
(662, 2, '2018-01-23 11:57:49', '192.168.10.55', 'list news: '),
(663, 2, '2018-01-23 12:05:49', '192.168.10.55', 'mod sections: La section "Autres Prestations" est bien en bdd, elle porte l''id : 8'),
(664, 1, '2018-01-23 12:10:10', '192.168.10.55', 'mod configs: L''option txt_inter1 a bien été enregistrée, valeur : Nous travaillons avec des professionels'),
(665, 1, '2018-01-23 12:10:27', '192.168.10.55', 'mod sections: La section "Fournisseurs" est bien en bdd, elle porte l''id : 23'),
(666, 1, '2018-01-23 12:10:46', '192.168.10.55', 'mod sections: La section "Partenaires" est bien en bdd, elle porte l''id : 24'),
(667, 1, '2018-01-23 12:11:12', '192.168.10.55', 'mod sections: La section "Réalisations" est bien en bdd, elle porte l''id : 25'),
(668, 1, '2018-01-23 12:11:19', '192.168.10.55', 'mod sections: La section "Plomberie" est bien en bdd, elle porte l''id : 26'),
(669, 1, '2018-01-23 12:11:24', '192.168.10.55', 'mod sections: La section "Chauffage" est bien en bdd, elle porte l''id : 27'),
(670, 1, '2018-01-23 12:11:35', '192.168.10.55', 'mod sections: La section "Livre d''Or" est bien en bdd, elle porte l''id : 20'),
(671, 1, '2018-01-23 12:15:53', '192.168.10.55', 'modules configs: Mise à jour effectuée : sections, tarifs, livreor, contacts, configs'),
(672, 1, '2018-01-23 12:33:45', '192.168.10.55', 'modules configs: Mise à jour effectuée : sections, tarifs, livreor, contacts, form_contact, configs'),
(673, 1, '2018-01-23 12:43:22', '192.168.10.55', 'mod configs: L''option txt_screen1 a bien été enregistrée, valeur : La source du savoir faire! '),
(674, 1, '2018-01-23 12:47:18', '192.168.10.55', 'modules configs: Mise à jour effectuée : sections, tarifs, livreor, form_contact, configs'),
(675, 1, '2018-01-23 12:47:46', '192.168.10.55', 'modules configs: Mise à jour effectuée : sections, tarifs, livreor, contacts, form_contact, configs'),
(676, 1, '2018-01-23 12:48:10', '192.168.10.55', 'modules configs: Mise à jour effectuée : sections, tarifs, livreor, form_contact, configs'),
(677, 2, '2018-01-23 19:35:17', '192.168.10.50', 'Authentification'),
(678, 1, '2018-01-23 22:07:45', '192.168.10.50', 'Authentification'),
(679, 1, '2018-01-23 22:08:49', '192.168.10.50', 'mod configs: L''option txt_inter1 a bien été enregistrée, valeur : Nous travaillons avec des professionnels'),
(680, 1, '2018-01-23 22:09:46', '192.168.10.50', 'mod configs: L''option slogan a bien été enregistrée, valeur : 25 ans d''expérience au service du travail bien fait'),
(681, 1, '2018-01-23 22:10:19', '192.168.10.50', 'del configs: L''option &laquo;txt_screen1 &raquo a correctement été supprimée ( id: 21)'),
(682, 1, '2018-01-23 22:15:35', '192.168.10.50', 'mod configs: L''option background-color a bien été enregistrée, valeur : a6c3f3'),
(683, 1, '2018-01-23 22:17:54', '192.168.10.50', 'mod configs: L''option background-color a bien été enregistrée, valeur : 5e99fb'),
(684, 1, '2018-01-23 22:18:48', '192.168.10.50', 'mod configs: L''option background-color a bien été enregistrée, valeur : e1ecff'),
(685, 1, '2018-01-23 22:19:52', '192.168.10.50', 'mod configs: L''option color a bien été enregistrée, valeur : 202356'),
(686, 1, '2018-01-23 22:32:32', '192.168.10.50', 'add news: L''article "Adouci''Eure" est bien en bdd, il porte l''id : 93'),
(687, 1, '2018-01-23 22:33:04', '192.168.10.50', 'mod news: L''article "Adouci''Eure" est bien en bdd, il porte l''id : 93'),
(688, 1, '2018-01-23 22:37:05', '192.168.10.50', 'mod news: L''article "Adouci''Eure" est bien en bdd, il porte l''id : 93'),
(689, 1, '2018-01-23 22:47:21', '192.168.10.50', 'mod news: L''article "Adouci''Eure" est bien en bdd, il porte l''id : 93'),
(690, 1, '2018-01-23 22:49:46', '192.168.10.50', 'mod news: L''article "Adouci''Eure" est bien en bdd, il porte l''id : 93'),
(691, 1, '2018-01-23 22:51:02', '192.168.10.50', 'mod news: L''article "Adouci''Eure" est bien en bdd, il porte l''id : 93'),
(692, 1, '2018-01-23 22:53:36', '192.168.10.50', 'mod configs: L''option flexslider_background-color a bien été enregistrée, valeur : 253068'),
(693, 1, '2018-01-23 22:55:31', '192.168.10.50', 'mod configs: L''option flexslider_background-color a bien été enregistrée, valeur : 3a97d4'),
(694, 1, '2018-01-23 23:02:56', '192.168.10.50', 'mod configs: L''option url_google_map a bien été enregistrée, valeur : https://www.google.com/maps/embed?pb=!1m14!1m12!1m3!1d3208.5163844211115!2d0.3983214035707139!3d49.16789018350737!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!5e1!3m2!1sfr!2sfr!4v15167484969'),
(695, 1, '2018-01-23 23:05:03', '192.168.10.50', 'mod configs: L''option url_google_map a bien été enregistrée, valeur : https://www.google.com/maps/place/3+Piencourt,+27230+Piencourt/@49.1660913,0.3969191,739m/data=!3m2!1e3!4b1!4m5!3m4!1s0x47e1b9a8c4be2775:0x5d06db734e92d479!8m2!3d49.1660878!4d0.3991078?'),
(696, 1, '2018-01-23 23:06:02', '192.168.10.50', 'mod configs: L''option url_google_map a bien été enregistrée, valeur : https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3216.8608686622097!2d0.3969191158773839!3d49.166091286945374!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x47e1b9a8c4be2775%3'),
(697, 1, '2018-01-23 23:19:41', '192.168.10.50', 'mod news: L''article "Adouci''Eure" est bien en bdd, il porte l''id : 93'),
(698, 1, '2018-01-23 23:20:31', '192.168.10.50', 'add news: L''article "Mabille" est bien en bdd, il porte l''id : 94'),
(699, 1, '2018-01-23 23:27:49', '192.168.10.50', 'list news: '),
(700, 1, '2018-01-23 23:28:00', '192.168.10.50', 'mod news: L''article "installation d''un lavabo" est bien en bdd, il porte l''id : 90'),
(701, 1, '2018-01-23 23:28:15', '192.168.10.50', 'mod news: L''article "des tuyaux" est bien en bdd, il porte l''id : 89'),
(702, 1, '2018-01-23 23:28:22', '192.168.10.50', 'list news: '),
(703, 1, '2018-01-23 23:30:00', '192.168.10.50', 'list news: '),
(704, 1, '2018-01-23 23:53:39', '192.168.10.50', 'add news: L''article "Innover" est bien en bdd, il porte l''id : 95'),
(705, 1, '2018-01-24 00:08:42', '192.168.10.50', 'mod news: L''article "Innover" est bien en bdd, il porte l''id : 95'),
(706, 1, '2018-01-24 00:10:26', '192.168.10.50', 'mod news: L''article "Innover" est bien en bdd, il porte l''id : 95'),
(707, 1, '2018-01-24 00:12:15', '192.168.10.50', 'mod news: L''article "Innover" est bien en bdd, il porte l''id : 95'),
(708, 1, '2018-01-24 00:13:32', '192.168.10.50', 'mod news: L''article "Innover" est bien en bdd, il porte l''id : 95'),
(709, 1, '2018-01-24 00:24:10', '192.168.10.50', 'mod configs: L''option txt_screen2 a bien été enregistrée, valeur : un réseau de professionnels...'),
(710, 1, '2018-01-24 00:26:53', '192.168.10.50', 'mod configs: L''option txt_screen2 a bien été enregistrée, valeur : notre réseau...'),
(711, 2, '2018-01-24 00:44:28', '192.168.10.50', 'Authentification'),
(712, 2, '2018-01-24 01:30:46', '192.168.10.50', 'Authentification'),
(713, 2, '2018-01-24 01:31:24', '192.168.10.50', 'mod configs: L''option txt_inter2 a bien été enregistrée, valeur : Pour vous garantir des travaux de qualité ...'),
(714, 1, '2018-01-24 02:45:18', '192.168.10.50', 'mod configs: L''option form_background-color a bien été enregistrée, valeur : 3a97d4'),
(715, 1, '2018-01-24 03:12:30', '192.168.10.50', 'mod sections: La section "Tarifs" est bien en bdd, elle porte l''id : 4'),
(716, 1, '2018-01-24 12:27:13', '192.168.10.50', 'Authentification'),
(717, 1, '2018-01-24 12:45:36', '192.168.10.50', 'logout'),
(718, 1, '2018-01-24 12:54:31', '192.168.10.50', 'Authentification, ip:192.168.10.50'),
(719, 2, '2018-01-24 12:54:45', '192.168.10.50', 'Authentification, ip:192.168.10.50'),
(720, 1, '2018-01-24 15:15:09', '192.168.10.50', 'Authentification, ip:192.168.10.50'),
(721, 2, '2018-01-24 15:16:10', '192.168.10.50', 'Authentification, ip:192.168.10.50'),
(722, 1, '2018-01-24 15:17:25', '192.168.10.50', 'mod configs: L''option font-size_body a bien été enregistrée, valeur : 1.7'),
(723, 1, '2018-01-24 15:17:53', '192.168.10.50', 'mod configs: L''option font-size_h2 a bien été enregistrée, valeur : 5'),
(724, 1, '2018-01-24 15:21:16', '192.168.10.50', 'mod configs: L''option flexslider_background-color a bien été enregistrée, valeur : 3a97d4'),
(725, 1, '2018-01-24 17:31:53', '192.168.10.50', 'Authentification, ip:192.168.10.50'),
(726, 1, '2018-01-24 17:32:31', '192.168.10.50', 'add users: Le compte "moe" a bien été créé, il porte l''id : 24'),
(727, 24, '2018-01-24 17:35:22', '83.196.233.124', 'Authentification, ip:83.196.233.124'),
(728, 1, '2018-01-24 18:43:48', '192.168.10.50', 'Authentification, ip:192.168.10.50'),
(729, 2, '2018-01-24 18:44:13', '192.168.10.50', 'Authentification, ip:192.168.10.50'),
(730, 2, '2018-01-24 18:46:09', '192.168.10.50', 'mod news: L''article "Innover" est bien en bdd, il porte l''id : 95'),
(731, 2, '2018-01-24 18:46:23', '192.168.10.50', 'mod news: L''article "Innover" est bien en bdd, il porte l''id : 95'),
(732, 2, '2018-01-24 18:46:50', '192.168.10.50', 'mod news: L''article "Innover" est bien en bdd, il porte l''id : 95'),
(733, 2, '2018-01-24 18:47:07', '192.168.10.50', 'list news: '),
(734, 2, '2018-01-24 18:47:12', '192.168.10.50', 'list news: '),
(735, 2, '2018-01-24 18:55:19', '192.168.10.50', 'mod livreor: Message publié! - id :18'),
(736, 2, '2018-01-24 18:55:58', '192.168.10.50', 'mod configs: L''option separateur_menu a bien été enregistrée, valeur : |'),
(737, 2, '2018-01-24 18:56:11', '192.168.10.50', 'mod configs: L''option separateur_menu a bien été enregistrée, valeur : @'),
(738, 1, '2018-01-24 18:57:51', '192.168.10.50', 'modules configs: Mise à jour effectuée : sections, tarifs, livreor, contacts, form_contact, configs'),
(739, 1, '2018-01-24 18:59:07', '192.168.10.50', 'modules configs: Mise à jour effectuée : sections, tarifs, livreor, form_contact, configs'),
(740, 2, '2018-01-24 19:07:44', '192.168.10.50', 'mod configs: L''option slogan a bien été enregistrée, valeur : 25 ans d''expérience, Médaillé du Fédération Patronnale du Batiment'),
(741, 1, '2018-01-24 20:30:10', '192.168.10.50', 'Authentification, ip:192.168.10.50'),
(742, 1, '2018-01-24 21:33:26', '192.168.10.50', 'add news: L''article "Twido" est bien en bdd, il porte l''id : 96'),
(743, 1, '2018-01-24 21:34:17', '192.168.10.50', 'mod news: L''article "Twido" est bien en bdd, il porte l''id : 96'),
(744, 1, '2018-01-24 21:34:57', '192.168.10.50', 'mod news: L''article "Twido" est bien en bdd, il porte l''id : 96'),
(745, 1, '2018-01-24 21:35:21', '192.168.10.50', 'mod news: L''article "Twido" est bien en bdd, il porte l''id : 96'),
(746, 1, '2018-01-24 21:38:02', '192.168.10.50', 'list news: '),
(747, 1, '2018-01-24 21:39:19', '192.168.10.50', 'list news: '),
(748, 1, '2018-01-24 21:40:21', '192.168.10.50', 'list news: '),
(749, 1, '2018-01-24 21:40:28', '192.168.10.50', 'list news: '),
(750, 1, '2018-01-25 18:37:40', '192.168.10.50', 'Authentification, ip:192.168.10.50'),
(751, 1, '2018-01-26 09:33:39', '192.168.10.50', 'Authentification, ip:192.168.10.50'),
(752, 1, '2018-02-01 09:38:01', '192.168.10.50', 'Authentification, ip:192.168.10.50'),
(753, 1, '2018-02-05 13:54:23', '192.168.10.50', 'Authentification, ip:192.168.10.50'),
(754, 24, '2018-02-05 14:30:56', '83.194.125.248', 'Authentification, ip:83.194.125.248'),
(755, 1, '2018-02-05 15:48:03', '192.168.10.50', 'Authentification, ip:192.168.10.50'),
(756, 2, '2018-02-05 16:06:04', '192.168.10.50', 'Authentification, ip:192.168.10.50'),
(757, 1, '2018-02-05 17:04:05', '192.168.10.50', 'mod news: L''article "Twido" est bien en bdd, il porte l''id : 96'),
(758, 1, '2018-02-05 17:04:47', '192.168.10.50', 'mod news: L''article "Innover" est bien en bdd, il porte l''id : 95'),
(759, 1, '2018-02-05 17:05:03', '192.168.10.50', 'mod news: L''article "Innover" est bien en bdd, il porte l''id : 95'),
(760, 1, '2018-02-05 17:48:04', '192.168.10.50', 'mod news: L''article "Twido" est bien en bdd, il porte l''id : 96'),
(761, 1, '2018-02-05 17:52:08', '192.168.10.50', 'mod news: L''article "Twido" est bien en bdd, il porte l''id : 96'),
(762, 1, '2018-02-05 17:53:13', '192.168.10.50', 'mod news: '),
(763, 1, '2018-02-05 17:54:58', '192.168.10.50', 'mod news: L''article "Innover" est bien en bdd, il porte l''id : 95'),
(764, 1, '2018-02-05 17:55:22', '192.168.10.50', 'mod news: L''article "Innover" est bien en bdd, il porte l''id : 95'),
(765, 1, '2018-02-05 17:55:47', '192.168.10.50', 'mod news: L''article "Adouci''Eure" est bien en bdd, il porte l''id : 93'),
(766, 1, '2018-02-05 17:57:14', '192.168.10.50', 'list news: '),
(767, 1, '2018-02-05 17:57:35', '192.168.10.50', 'mod news: L''article "Mabille" est bien en bdd, il porte l''id : 94');

-- --------------------------------------------------------

--
-- Structure de la table `messages`
--

CREATE TABLE IF NOT EXISTS `messages` (
`id` int(10) unsigned NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `text` text NOT NULL,
  `contact` int(10) unsigned NOT NULL COMMENT 'reférence à la table contacts',
  `type_message` enum('livreor','form_contact','','') NOT NULL,
  `visible_livreor` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=latin1;

--
-- Contenu de la table `messages`
--

INSERT INTO `messages` (`id`, `date`, `text`, `contact`, `type_message`, `visible_livreor`) VALUES
(16, '2017-05-11 13:01:12', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. In interdum felis fermentum ipsum molestie sed porttitor ligula rutrum.', 12, 'form_contact', 0),
(17, '2017-05-11 13:06:55', 'Proin massa neque, sodales et urna sit amet, convallis convallis purus. Curabitur eu fringilla enim. Proin ornare efficitur tortor sed tincidunt. Mauris eleifend tincidunt leo, ac tempor velit eleifend eget. In bibendum, felis vitae condimentum ullamcorpe', 13, 'form_contact', 0),
(18, '2018-01-21 22:46:27', 'htestgfdfgfgfgfgfdgfdgfdg\r\njhkjhkjhklkjlkjl', 14, 'livreor', 1),
(19, '2018-01-22 16:24:41', 'Pas visible\r\n\r\nLorem ipsum dolor sit amet, consectetur adipiscing elit. In interdum felis fermentum ipsum molestie sed porttitor ligula rutrum. test\r\n\r\n', 14, 'livreor', 0),
(20, '2018-01-22 16:28:17', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. In interdum felis fermentum ipsum molestie sed porttitor ligula rutrum.\r\n', 14, 'livreor', 1),
(21, '2018-01-22 18:10:31', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. In interdum felis fermentum ipsum molestie sed porttitor ligula rutrum.\r\n', 10, 'livreor', 1),
(22, '2018-01-24 18:40:15', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. In interdum felis fermentum ipsum molestie sed porttitor ligula rutrum.\r\n', 15, 'form_contact', 0),
(23, '2018-01-24 18:41:39', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. In interdum felis fermentum ipsum molestie sed porttitor ligula rutrum.\r\n', 16, 'livreor', 0);

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
(1, 'Gestion des Utilisateurs', 'users', 0, '2018-01-24 18:59:07'),
(2, 'Gestion des Sections', 'sections', 1, '2018-01-24 18:59:07'),
(3, 'Gestion des Tarifs', 'tarifs', 1, '2018-01-24 18:59:07'),
(4, 'Gestion du Livre d''Or', 'livreor', 1, '2018-01-24 18:59:07'),
(5, 'Gestion des Contacts', 'contacts', 0, '2018-01-24 18:59:07'),
(6, 'Formulaire de contact', 'form_contact', 1, '2018-01-24 18:59:07'),
(7, 'Gestion des paramètres', 'configs', 1, '2018-01-24 18:59:07');

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
  `visible` tinyint(1) NOT NULL,
  `url_externe` text NOT NULL,
  `code_video_youtube` text NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=97 DEFAULT CHARSET=utf8;

--
-- Contenu de la table `news`
--

INSERT INTO `news` (`id`, `titre`, `texte`, `auteur`, `date`, `image`, `section`, `visible`, `url_externe`, `code_video_youtube`) VALUES
(69, 'pillage des noisetiers', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. In interdum felis fermentum ipsum molestie sed porttitor ligula rutrum.', 1, '2018-01-22 20:36:05', '20170416_185127.jpg', 1, 0, '', ''),
(70, 'plantage de capucines,  soucis et bourrache', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. In interdum felis fermentum ipsum molestie sed porttitor ligula rutrum.', 1, '2018-01-22 10:25:16', '20170416_185007.jpg', 1, 0, '', ''),
(73, 'Pour canards', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed et commodo orci. Vivamus eu diam tristique, luctus diam volutpat, blandit ex. Sed in diam volutpat, faucibus ligula nec, placerat erat. Mauris a risus lacinia, elementum elit id, venenatis dolor. Vestibulum quis odio rutrum, condimentum nisl non, porta velit. Quisque lacinia commodo mollis. Quisque eu bibendum arcu, non varius nisl. Pellentesque sed massa dignissim, finibus dolor id, tincidunt diam. Nunc laoreet quam quis sapien placerat, nec pulvinar velit efficitur. Proin ac augue ante. Nunc in vestibulum urna. Pellentesque congue vestibulum lectus vel dignissim. Praesent ut facilisis nibh, vel tristique lorem. Cras in mauris nulla. Proin mattis, magna nec elementum eleifend, erat lectus pellentesque tortor, luctus posuere augue enim id massa. Suspendisse sed euismod metus, sed commodo nisl', 1, '2018-01-22 20:36:55', '20170409_114957.jpg', 8, 1, '', ''),
(87, 'Plein de cuivre cintré!', 'c''est beau mais c''est du boulot!!', 2, '2018-01-22 01:38:27', 'WP_20170615_003.jpg', 25, 1, '', ''),
(88, 'Pose d''un chauffe eau', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. In interdum felis fermentum ipsum molestie sed porttitor ligula rutrum.\r\n', 2, '2018-01-23 12:54:14', 'WP_20170510_002.jpg', 27, 1, '', ''),
(89, 'des tuyaux', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. In interdum felis fermentum ipsum molestie sed porttitor ligula rutrum.\r\n', 2, '2018-01-24 00:28:15', 'WP_20170510_003.jpg', 26, 1, '', ''),
(90, 'installation d''un lavabo', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. In interdum felis fermentum ipsum molestie sed porttitor ligula rutrum.\r\n', 2, '2018-01-24 00:28:00', 'WP_20170609_004.jpg', 26, 1, '', ''),
(91, 'L''art d''esquiver une prise', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. In interdum felis fermentum ipsum molestie sed porttitor ligula rutrum.\r\n', 2, '2018-01-23 12:56:25', 'WP_20170622_005.jpg', 26, 1, '', ''),
(92, 'Mise en place de plein de vannes', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. In interdum felis fermentum ipsum molestie sed porttitor ligula rutrum.\r\n', 2, '2018-01-23 12:57:33', 'WP_20170704_002.jpg', 8, 1, '', ''),
(93, 'Adouci''Eure', 'Spécialistes de la purification et du traitement de l''eau au travers de systèmes de filtration : adoucisseurs, osmoseurs, déferrisseurs ,cartouches de filtrations,dosage de produit chimique etc...\r\n&lt;br/&gt;\r\nSitué dans l''Eure en Normandie, ils fournissent une expertise, un service et du matériel de qualité aux meilleurs prix pour les professionnels comme pour les particuliers.\r\n', 2, '2018-02-05 18:55:47', 'adouci-eure.png', 24, 1, 'http://www.adouci-eure.fr', ''),
(94, 'Mabille', 'MABILLE est une société de négoce, dont le métier est de rendre possible et facile la distribution de produits entre les fabricants, les professionnels et les particuliers.\r\n', 2, '2018-02-05 18:57:35', 'mabille.jpg', 23, 1, 'http://www.mabille.fr', ''),
(95, 'Innover', ' Entreprise reconnue\r\n&quot;Grenelle de l’environnement&quot; et &quot;QUALIBOIS&quot;\r\n&lt;br/&gt;', 2, '2018-02-05 18:55:22', 'innover.png', 24, 1, 'http://www.innover.eu/', ''),
(96, 'Twido', 'Une solution innovante et bien pensée pour votre chauffe eau.\r\n', 2, '2018-02-05 18:52:08', 'twido.png', 24, 1, 'https://www.twido.fr/', 'qo8Seg0D28k');

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
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

--
-- Contenu de la table `sections`
--

INSERT INTO `sections` (`id`, `nom`, `tag`, `meta-description`, `meta-keywords`, `texte`, `auteur`, `date`, `image`, `menu`, `position`, `delete`, `modify`, `hasItem`, `inScreen2`, `inScreen3`) VALUES
(1, 'Accueil', 'home', '', 'Plomberie adoucisseur chauffage ventillation chaudière pelet / bois désembouage dépannage', 'accueil', 1, '2018-01-21 23:56:17', '', 1, 1, 0, 1, 1, 0, 0),
(3, 'Contact', 'contact', '', '', 'Nous situer dans le monde', 1, '2018-01-22 19:38:04', '', 1, 127, 0, 1, 0, 0, 0),
(4, 'Tarifs', 'tarifs', '', '', 'Devis gratuit sur simple demande', 1, '2018-01-24 03:12:30', '', 1, 9, 0, 1, 0, 0, 1),
(8, 'Autres Prestations', 'prestations', '', '', '', 2, '2018-01-23 12:05:49', '', 0, 5, 1, 1, 1, 0, 0),
(20, 'Livre d''Or', 'livreor', '', '', 'Ceci n''est pas un formulaire de contact. Il s''agit d''un espace publique où chacun(e) peut donner son avis sur son expérience avec nous. ', 1, '2018-01-23 12:11:34', '', 0, 120, 1, 1, 0, 0, 1),
(23, 'Fournisseurs', 'fournisseurs', '', '', '', 1, '2018-01-23 12:10:27', '', 1, 20, 1, 1, 1, 1, 0),
(24, 'Partenaires', 'partenaires', '', '', '', 1, '2018-01-23 12:10:46', '', 1, 20, 1, 1, 1, 1, 0),
(25, 'Réalisations', 'realisations', '', '', '', 1, '2018-01-23 12:11:12', '', 1, 20, 1, 1, 1, 0, 1),
(26, 'Plomberie', 'plomberie', '', '', '', 1, '2018-01-23 12:11:18', '', 0, 20, 1, 1, 1, 0, 1),
(27, 'Chauffage', 'chauffage', '', '', '', 1, '2018-01-23 12:11:24', '', 0, 20, 1, 1, 1, 0, 1);

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
(1, 'Poser une ventillation', 66, '2018-01-22 09:16:44', 1),
(2, 'Dépannage', 50, '2018-01-22 09:17:12', 1),
(3, 'Désambouage', 59, '2018-01-22 09:17:54', 4),
(4, 'Faire un serpentin en cuivre', 147.5, '2018-01-22 09:18:46', 3),
(6, 'Ramonage de cheminée', 35, '2018-01-22 09:19:36', 1),
(13, 'Installation d''un adoucisseur d''eau', 335.5, '2018-01-22 09:21:44', 1),
(14, 'Réparer une fuite', 80, '2018-01-22 09:15:15', 3),
(15, 'Installation chaudière à pellet', 450, '2018-01-22 09:15:49', 4),
(16, 'Installation chaudière à bois', 350, '2018-01-22 09:16:12', 4);

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
(3, 'Plomberie', '2018-01-22 09:13:08'),
(4, 'Chauffage', '2018-01-22 09:14:23');

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
`id` int(10) unsigned NOT NULL,
  `nom` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `droit` int(5) unsigned NOT NULL COMMENT 'référence à la table droits'
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;

--
-- Contenu de la table `users`
--

INSERT INTO `users` (`id`, `nom`, `password`, `droit`) VALUES
(1, 'rv', '$2y$10$YvBbjX.sgRiOUs.Tm.IRoeLILmFuO.cu05Frlh3UCjxanzuY8/5Py', 1),
(2, 'ludo', '$2y$10$bHHERL4/tTLpom8qG44wbONIZvyq7SeTJ/eYyeA9CVDeFzKMpny2S', 2),
(21, 'rédacteur', '$2y$10$Lpb8t/gpWj7j6Y0pUOBZW.920be/iZQkCDfXpKXqmiJh2KPSx3BZG', 3),
(24, 'moe', '$2y$10$GH.Z0/vZppArwYqhnyKe2ey6SDecBiL1uh51x5GDkZ2rA3TaKhXRO', 1);

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
MODIFY `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=35;
--
-- AUTO_INCREMENT pour la table `contacts`
--
ALTER TABLE `contacts`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT pour la table `droits`
--
ALTER TABLE `droits`
MODIFY `id` int(5) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT pour la table `logs`
--
ALTER TABLE `logs`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=768;
--
-- AUTO_INCREMENT pour la table `messages`
--
ALTER TABLE `messages`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=24;
--
-- AUTO_INCREMENT pour la table `modules`
--
ALTER TABLE `modules`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT pour la table `news`
--
ALTER TABLE `news`
MODIFY `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=97;
--
-- AUTO_INCREMENT pour la table `sections`
--
ALTER TABLE `sections`
MODIFY `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=28;
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
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=25;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
