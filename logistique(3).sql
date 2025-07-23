-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: mysql
-- Generation Time: Jan 29, 2025 at 10:58 AM
-- Server version: 9.1.0
-- PHP Version: 8.2.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `logistique`
--
CREATE Database logistique;
USE logistique;
-- --------------------------------------------------------

--
-- Table structure for table `Categorie`
--

CREATE TABLE `Categorie` (
  `idCategorie` int UNSIGNED NOT NULL,
  `nom` varchar(50) DEFAULT NULL,
  `estActif` tinyint UNSIGNED NOT NULL DEFAULT '1',
  `dateCreation` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `dateMaj` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `Categorie`
--

INSERT INTO `Categorie` (`idCategorie`, `nom`, `estActif`, `dateCreation`, `dateMaj`) VALUES
(1, 'Matériel informatique', 1, '2025-01-28 19:13:20', '2025-01-28 19:13:20'),
(2, 'Réseaux et télécommunications', 1, '2025-01-28 19:13:20', '2025-01-28 19:13:20'),
(3, 'Périphériques et accessoires', 1, '2025-01-28 19:14:49', '2025-01-28 19:14:49'),
(4, 'Stockage', 1, '2025-01-28 19:14:49', '2025-01-28 19:14:49');

-- --------------------------------------------------------

--
-- Table structure for table `Commande`
--

CREATE TABLE `Commande` (
  `idCommande` int UNSIGNED NOT NULL,
  `idUtilisateur` int UNSIGNED NOT NULL,
  `numero` varchar(50) DEFAULT NULL,
  `etat` set('EN_INSTANCE','EN_PREPA','EXPEDIEE') NOT NULL,
  `prix_` decimal(8,2) DEFAULT NULL,
  `dateValidation` datetime DEFAULT NULL,
  `datePreparation` datetime DEFAULT NULL,
  `dateExpedition` datetime DEFAULT NULL,
  `dateCreation` datetime DEFAULT CURRENT_TIMESTAMP,
  `dateMaj` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `Commande`
--

INSERT INTO `Commande` (`idCommande`, `idUtilisateur`, `numero`, `etat`, `prix_`, `dateValidation`, `datePreparation`, `dateExpedition`, `dateCreation`, `dateMaj`) VALUES
(1, 1, '20250120-135841-1', 'EXPEDIEE', NULL, '2025-01-22 11:31:26', '2025-01-23 14:00:00', '2025-01-24 14:00:00', '2025-01-20 10:24:41', '2025-01-25 10:27:52'),
(2, 2, '20250129-135042-2', 'EN_PREPA', NULL, '2025-02-03 11:46:40', '2025-02-04 11:46:40', NULL, '2025-01-29 10:48:18', '2025-01-29 10:50:15'),
(3, 3, '20250101-135843-3', 'EN_INSTANCE', NULL, '2025-01-01 11:51:04', NULL, NULL, '2025-01-29 10:53:37', '2025-01-29 10:53:37');

-- --------------------------------------------------------

--
-- Table structure for table `Entree`
--

CREATE TABLE `Entree` (
  `idEntree` int UNSIGNED NOT NULL,
  `idFornisseur` int UNSIGNED NOT NULL,
  `numero` varchar(50) DEFAULT NULL,
  `dateValidation` datetime DEFAULT NULL,
  `estActif` tinyint UNSIGNED NOT NULL,
  `dateCreation` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `Entree`
--

INSERT INTO `Entree` (`idEntree`, `idFornisseur`, `numero`, `dateValidation`, `estActif`, `dateCreation`) VALUES
(1, 4, '20250129-135844-1', '2025-01-29 22:41:24', 1, '2025-01-29 22:41:24'),
(2, 5, '20250130-135845-2', '2025-01-30 22:41:24', 1, '2025-01-30 22:41:24'),
(3, 6, '20250131-135846-3', '2025-01-31 23:00:55', 1, '2025-02-01 23:00:55');

-- --------------------------------------------------------

--
-- Table structure for table `Fournisseur`
--

CREATE TABLE `Fournisseur` (
  `idFournisseur` int UNSIGNED NOT NULL,
  `nom` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `estActif` tinyint UNSIGNED NOT NULL DEFAULT '1',
  `dateCreation` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `dateMaj` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `Fournisseur`
--

INSERT INTO `Fournisseur` (`idFournisseur`, `nom`, `estActif`, `dateCreation`, `dateMaj`) VALUES
(4, 'Cybertek Paris Concept Store', 1, '2025-01-28 21:40:24', '2025-01-28 21:40:24'),
(5, 'LDLC Lyon', 1, '2025-01-28 21:40:24', '2025-01-28 21:40:24'),
(6, 'Boulanger Bordeaux-Lac', 1, '2025-01-28 21:40:24', '2025-01-28 21:40:24');

-- --------------------------------------------------------

--
-- Table structure for table `LigneCommande`
--

CREATE TABLE `LigneCommande` (
  `idLigneCommande` int UNSIGNED NOT NULL,
  `idCommande` int UNSIGNED NOT NULL,
  `idProduit` int UNSIGNED NOT NULL,
  `quantite` int DEFAULT NULL,
  `prix` decimal(8,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `LigneCommande`
--

INSERT INTO `LigneCommande` (`idLigneCommande`, `idCommande`, `idProduit`, `quantite`, `prix`) VALUES
(1, 1, 1, 8, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `LigneEntree`
--

CREATE TABLE `LigneEntree` (
  `idLigneEntree` int UNSIGNED NOT NULL,
  `idEntree` int UNSIGNED NOT NULL,
  `dProduit` int UNSIGNED NOT NULL,
  `quantite` int UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `LigneEntree`
--

INSERT INTO `LigneEntree` (`idLigneEntree`, `idEntree`, `dProduit`, `quantite`) VALUES
(1, 1, 1, 1),
(2, 1, 2, 1),
(3, 1, 3, 12),
(4, 1, 4, 12),
(5, 2, 5, 1),
(6, 2, 6, 12),
(7, 2, 7, 12),
(8, 2, 12, 1),
(9, 2, 13, 1),
(10, 2, 14, 12),
(11, 2, 15, 12),
(12, 3, 16, 10),
(13, 3, 17, 10),
(14, 3, 18, 24),
(15, 3, 19, 24);

-- --------------------------------------------------------

--
-- Table structure for table `PointDeVente`
--

CREATE TABLE `PointDeVente` (
  `idPointDeVente` int UNSIGNED NOT NULL,
  `ensegne` varchar(30) DEFAULT NULL,
  `nom` varchar(50) DEFAULT NULL,
  `reference` varchar(10) DEFAULT NULL,
  `adresse` varchar(255) DEFAULT NULL,
  `codePostal` varchar(10) DEFAULT NULL,
  `ville` varchar(50) DEFAULT NULL,
  `tel` varchar(20) DEFAULT NULL,
  `estActif` tinyint UNSIGNED NOT NULL DEFAULT '1',
  `dateCreation` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `dateMaj` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `PointDeVente`
--

INSERT INTO `PointDeVente` (`idPointDeVente`, `ensegne`, `nom`, `reference`, `adresse`, `codePostal`, `ville`, `tel`, `estActif`, `dateCreation`, `dateMaj`) VALUES
(1, 'Exertis', 'Exertis Connect', '3265489', '11 rue de Cambrai', '75019', 'Paris', '01 53 35 45 00', 1, '2025-01-28 21:18:31', '2025-01-28 21:18:31'),
(2, '1foTrade', '1foTrade', '8524736', '12 rue de l\'Industrie', '95310', 'Saint-Ouen-l\'Aumône', '01 34 30 54 54', 1, '2025-01-28 21:18:31', '2025-01-28 21:18:31'),
(3, 'MC2IT ', 'MC2IT Grossiste Informatique', '3258745', ' 4 rue de la Croix Faubin\r\n    \r\n\r\n', ' 75011', 'Paris', '01 43 79 59 59', 1, '2025-01-28 21:18:31', '2025-01-29 09:49:48');

-- --------------------------------------------------------

--
-- Table structure for table `Produit`
--

CREATE TABLE `Produit` (
  `idProduit` int UNSIGNED NOT NULL,
  `idCategorie` int UNSIGNED NOT NULL,
  `idFournisseur` int UNSIGNED NOT NULL,
  `nom` varchar(50) DEFAULT NULL,
  `reference` varchar(10) DEFAULT NULL,
  `typeConditionnement` varchar(30) DEFAULT NULL,
  `quantite` int UNSIGNED DEFAULT NULL,
  `emplacement` varchar(30) DEFAULT NULL,
  `prix` decimal(8,2) UNSIGNED DEFAULT NULL,
  `quota` int DEFAULT NULL,
  `stock` int DEFAULT NULL,
  `estActif` tinyint UNSIGNED NOT NULL DEFAULT '1',
  `dateCreation` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `dateMaj` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `Produit`
--

INSERT INTO `Produit` (`idProduit`, `idCategorie`, `idFournisseur`, `nom`, `reference`, `typeConditionnement`, `quantite`, `emplacement`, `prix`, `quota`, `stock`, `estActif`, `dateCreation`, `dateMaj`) VALUES
(1, 1, 4, 'Ordinateur portable MSI Raider', '1425867', 'Carton-individulle', 1, 'MI-Rayon-1', 3500.00, 10, 6, 1, '2025-01-28 19:31:04', '2025-01-29 09:25:49'),
(2, 1, 4, 'PC de bureau Dell OptiPlex 7010 Plus', '1452687', 'Carton-individulle', 1, 'MI-Rayon-2', 1200.00, 10, 5, 1, '2025-01-28 19:45:45', '2025-01-29 09:26:02'),
(3, 1, 4, 'Processeur Intel Core i9-14900HX', '2589735', 'Carton-pack', 12, 'MI-Rayon-3', 7200.00, 3, 1, 1, '2025-01-28 19:45:45', '2025-01-29 09:26:21'),
(4, 1, 4, 'Carte graphique NVIDIA GeForce RTX 4090', '6589254', 'Carton-pack', 12, 'MI-Rayon-4', 2000.00, 4, 2, 1, '2025-01-28 19:49:58', '2025-01-29 09:26:56'),
(5, 2, 5, 'Routeur Cisco Catalyst 8300 Series', '3582674', 'Carton-individulle', 1, 'RT-Rayon-1', 10000.00, 2, 1, 1, '2025-01-28 20:07:44', '2025-01-29 09:26:28'),
(6, 2, 5, 'Point d\'accès Wi-Fi 6E Aruba 630 Series', '2451986', 'Carton-pack', 12, 'RT-Rayon-2', 9600.00, 2, 1, 1, '2025-01-28 20:07:44', '2025-01-29 09:27:00'),
(7, 2, 5, 'Commutateur Huawei CloudEngine S5735-S Series', '2589356', 'Carton-pack', 12, 'RT-Rayon-3', 12000.00, 2, 1, 1, '2025-01-28 20:19:47', '2025-01-29 09:27:03'),
(12, 3, 5, 'Écran LG UltraFine OLED Pro 32EP950', '8546218', 'Carton-individulle', 1, 'PA-Rayon-1', 3000.00, 6, 3, 1, '2025-01-28 20:28:17', '2025-01-29 09:26:34'),
(13, 3, 5, 'Imprimante multifonction HP Color LaserJet ', '1253864', 'Carton-individulle', 1, 'PA-Rayon-2', 4000.00, 6, 2, 1, '2025-01-28 20:29:51', '2025-01-29 09:26:40'),
(14, 3, 5, 'Clavier mécanique Corsair K100 RGB', '2586973', 'Carton-pack', 12, 'PA-Rayon-3', 2400.00, 4, 2, 1, '2025-01-28 20:35:09', '2025-01-29 09:27:07'),
(15, 3, 5, 'Souris sans fil Logitech MX Master', '6719832', 'Carton-pack', 12, 'PA-Rayon-4', 12000.00, 6, 3, 1, '2025-01-28 20:44:34', '2025-01-29 09:59:56'),
(16, 4, 6, 'Disque dur externe Western Digital', '5683244', 'Carton-pack', 10, 'STK-Rayon-1', 5000.00, 4, 2, 1, '2025-01-28 20:53:17', '2025-01-29 09:27:30'),
(17, 4, 6, 'SSD interne Samsung 990 PRO ', '5286374', 'Carton-pack', 10, 'STK-Rayon-2', 4000.00, 4, 2, 1, '2025-01-28 20:53:17', '2025-01-29 09:27:33'),
(18, 4, 6, 'Clé USB SanDisk Extreme PRO', '5642558', 'Carton-pack', 24, 'STK-Rayon-3', 120.00, 12, 8, 1, '2025-01-28 21:11:27', '2025-01-29 09:27:36'),
(19, 4, 6, 'Carte mémoire microSD Lexar Professional', '8523697', 'Carton-pack', 24, 'STK-Rayon-4', 120.00, 12, 8, 1, '2025-01-28 21:11:27', '2025-01-29 09:27:38');

-- --------------------------------------------------------

--
-- Table structure for table `Utilisateur`
--

CREATE TABLE `Utilisateur` (
  `idUtilisateur` int UNSIGNED NOT NULL,
  `idPointDeVente` int UNSIGNED DEFAULT NULL,
  `role` set('ACHETEUR','GESTIONNAIRE','LOGISTICIEN','ADMIN') DEFAULT NULL,
  `nom` varchar(50) DEFAULT NULL,
  `prenom` varchar(10) DEFAULT NULL,
  `mail` varchar(50) DEFAULT NULL,
  `mdp` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `telephone` varchar(20) DEFAULT NULL,
  `estActif` tinyint UNSIGNED NOT NULL DEFAULT '1',
  `dateCreation` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `dateMaj` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `Utilisateur`
--

INSERT INTO `Utilisateur` (`idUtilisateur`, `idPointDeVente`, `role`, `nom`, `prenom`, `mail`, `mdp`, `telephone`, `estActif`, `dateCreation`, `dateMaj`) VALUES
(1, 1, 'ACHETEUR', 'Moreau', 'Julien', ' julien.moreau@exertisconnect.fr', '12345678', '+33 6 12 34 56 78', 1, '2025-01-28 21:32:52', '2025-01-28 21:32:52'),
(2, 2, 'ACHETEUR', 'Lambert', 'Sophie', 'sophie.lambert@1fotrade.fr', '1472583', '+33 6 23 45 67 89', 1, '2025-01-28 21:32:52', '2025-01-28 21:32:52'),
(3, 3, 'ACHETEUR', 'Thomas', 'Dubois', 'thomas.dubois@mc2it.fr', '7893215', '+33 6 34 56 78 90', 1, '2025-01-28 21:36:22', '2025-01-28 21:36:22'),
(4, NULL, 'GESTIONNAIRE', 'belfort', 'tatiana', 'tatiana.belfort@email.fr', '1252347', '06 12 34 56 78', 1, '2025-01-29 08:59:54', '2025-01-29 08:59:54'),
(5, NULL, 'LOGISTICIEN', 'Lefevre', ' Antoine', 'antoine.lefevre@email.fr', NULL, ' 07 23 45 67 89', 1, '2025-01-29 09:01:26', '2025-01-29 09:01:26'),
(6, NULL, 'ADMIN', 'Moreau', 'Céline', 'celine.moreau@email.fr', NULL, '06 98 76 54 32', 1, '2025-01-29 09:06:59', '2025-01-29 09:06:59');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Categorie`
--
ALTER TABLE `Categorie`
  ADD PRIMARY KEY (`idCategorie`);

--
-- Indexes for table `Commande`
--
ALTER TABLE `Commande`
  ADD PRIMARY KEY (`idCommande`),
  ADD KEY `fk_Commande_PointDeVente1_idx` (`idUtilisateur`);

--
-- Indexes for table `Entree`
--
ALTER TABLE `Entree`
  ADD PRIMARY KEY (`idEntree`),
  ADD KEY `fk_Entree_Fornisseur1_idx` (`idFornisseur`);

--
-- Indexes for table `Fournisseur`
--
ALTER TABLE `Fournisseur`
  ADD PRIMARY KEY (`idFournisseur`);

--
-- Indexes for table `LigneCommande`
--
ALTER TABLE `LigneCommande`
  ADD PRIMARY KEY (`idLigneCommande`),
  ADD KEY `fk_LigneCommande_Produit1_idx` (`idProduit`),
  ADD KEY `fk_LigneCommande_Commande1` (`idCommande`);

--
-- Indexes for table `LigneEntree`
--
ALTER TABLE `LigneEntree`
  ADD PRIMARY KEY (`idLigneEntree`),
  ADD KEY `fk_LigneEntree_Entree1_idx` (`idEntree`),
  ADD KEY `fk_LigneEntree_Produit1_idx` (`dProduit`);

--
-- Indexes for table `PointDeVente`
--
ALTER TABLE `PointDeVente`
  ADD PRIMARY KEY (`idPointDeVente`);

--
-- Indexes for table `Produit`
--
ALTER TABLE `Produit`
  ADD PRIMARY KEY (`idProduit`),
  ADD UNIQUE KEY `reference` (`reference`),
  ADD KEY `fk_Produit_Categorie_idx` (`idCategorie`),
  ADD KEY `idFournisseur` (`idFournisseur`);

--
-- Indexes for table `Utilisateur`
--
ALTER TABLE `Utilisateur`
  ADD PRIMARY KEY (`idUtilisateur`),
  ADD KEY `fk_Utilisateur_PointDeVente1_idx` (`idPointDeVente`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Categorie`
--
ALTER TABLE `Categorie`
  MODIFY `idCategorie` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `Commande`
--
ALTER TABLE `Commande`
  MODIFY `idCommande` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `Entree`
--
ALTER TABLE `Entree`
  MODIFY `idEntree` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `Fournisseur`
--
ALTER TABLE `Fournisseur`
  MODIFY `idFournisseur` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `LigneCommande`
--
ALTER TABLE `LigneCommande`
  MODIFY `idLigneCommande` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `LigneEntree`
--
ALTER TABLE `LigneEntree`
  MODIFY `idLigneEntree` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `PointDeVente`
--
ALTER TABLE `PointDeVente`
  MODIFY `idPointDeVente` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `Produit`
--
ALTER TABLE `Produit`
  MODIFY `idProduit` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `Utilisateur`
--
ALTER TABLE `Utilisateur`
  MODIFY `idUtilisateur` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Commande`
--
ALTER TABLE `Commande`
  ADD CONSTRAINT `Commande_ibfk_1` FOREIGN KEY (`idUtilisateur`) REFERENCES `Utilisateur` (`idUtilisateur`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `Entree`
--
ALTER TABLE `Entree`
  ADD CONSTRAINT `fk_Entree_Fornisseur1` FOREIGN KEY (`idFornisseur`) REFERENCES `Fournisseur` (`idFournisseur`);

--
-- Constraints for table `LigneCommande`
--
ALTER TABLE `LigneCommande`
  ADD CONSTRAINT `fk_LigneCommande_Commande1` FOREIGN KEY (`idCommande`) REFERENCES `Commande` (`idCommande`),
  ADD CONSTRAINT `fk_LigneCommande_Produit1` FOREIGN KEY (`idProduit`) REFERENCES `Produit` (`idProduit`);

--
-- Constraints for table `LigneEntree`
--
ALTER TABLE `LigneEntree`
  ADD CONSTRAINT `fk_LigneEntree_Entree1` FOREIGN KEY (`idEntree`) REFERENCES `Entree` (`idEntree`),
  ADD CONSTRAINT `fk_LigneEntree_Produit1` FOREIGN KEY (`dProduit`) REFERENCES `Produit` (`idProduit`);

--
-- Constraints for table `Produit`
--
ALTER TABLE `Produit`
  ADD CONSTRAINT `fk_Produit_Categorie` FOREIGN KEY (`idCategorie`) REFERENCES `Categorie` (`idCategorie`),
  ADD CONSTRAINT `Produit_ibfk_1` FOREIGN KEY (`idFournisseur`) REFERENCES `Fournisseur` (`idFournisseur`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `Utilisateur`
--
ALTER TABLE `Utilisateur`
  ADD CONSTRAINT `fk_Utilisateur_PointDeVente1` FOREIGN KEY (`idPointDeVente`) REFERENCES `PointDeVente` (`idPointDeVente`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
