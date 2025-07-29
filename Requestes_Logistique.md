
 1. Jointures (JOIN)
. Liste des commandes avec le nom de l’utilisateur qui a commandé
SELECT c.idCommande, u.nom, u.prenom, c.numero, c.etat
FROM Commande c
JOIN Utilisateur u ON c.idUtilisateur = u.idUtilisateur;
. Produits avec leur catégorie et fournisseur
SELECT p.nom AS produit, c.nom AS categorie, f.nom AS fournisseur
FROM Produit p
JOIN Categorie c ON p.idCategorie = c.idCategorie
JOIN Fournisseur f ON p.idFournisseur = f.idFournisseur;
. Lignes de commande avec le nom du produit
SELECT lc.idLigneCommande, p.nom, lc.quantite
FROM LigneCommande lc
JOIN Produit p ON lc.idProduit = p.idProduit;
. Entrées avec nom du fournisseur
SELECT e.idEntree, f.nom, e.numero
FROM Entree e
JOIN Fournisseur f ON e.idFornisseur = f.idFournisseur;
. Ligne d’entrée avec nom du produit
SELECT le.idLigneEntree, p.nom, le.quantite
FROM LigneEntree le
JOIN Produit p ON le.dProduit = p.idProduit;
2. Mises à jour (Update)
. Activer/désactiver un produit
UPDATE Produit SET estActif = 0 WHERE idProduit = 5;
. Mettre à jour le stock d’un produit
UPDATE Produit SET stock = stock + 10 WHERE idProduit = 1;
. Marquer une commande comme expédiée
UPDATE Commande SET etat = 'EXPEDIEE', dateExpedition = NOW() WHERE idCommande = 2;
. Changer l’adresse d’un point de vente
UPDATE PointDeVente
SET adresse = '20 rue des Lilas'
WHERE idPointDeVente = 1;
 3. Requêtes avec agrégats (COUNT, SUM)
. Nombre total de commandes par état
SELECT etat, COUNT(*) AS nombre_commandes
FROM Commande
GROUP BY etat;
. Total des quantités commandées par produit
SELECT p.nom, SUM(lc.quantite) AS total_commandé
FROM LigneCommande lc
JOIN Produit p ON lc.idProduit = p.idProduit
GROUP BY p.nom;
. Nombre d’utilisateurs par rôle
SELECT role, COUNT(*) AS nb_utilisateurs
FROM Utilisateur
GROUP BY role;
4. Programmation de tâches (événements MySQL)
. Créer un événement qui met à jour le stock expiré chaque jour
CREATE EVENT maj_stock
ON SCHEDULE EVERY 1 DAY
DO
  UPDATE Produit SET estActif = 0 WHERE stock = 0;
 Nécessite event_scheduler activé :
SET GLOBAL event_scheduler = ON;
 5. Création de vues (VIEW)
. Vue pour afficher les commandes en cours avec utilisateur
CREATE VIEW vue_commandes_en_cours AS
SELECT c.idCommande, u.nom, u.prenom, c.numero, c.etat
FROM Commande c
JOIN Utilisateur u ON c.idUtilisateur = u.idUtilisateur
WHERE c.etat != 'EXPEDIEE';
15. Vue des produits avec stock critique (inférieur au quota)
CREATE VIEW vue_stock_critique AS
SELECT nom, stock, quota
FROM Produit
WHERE stock < quota;
6. Enumérations SET (utilisation)
. Chercher les commandes expédiées
SELECT * FROM Commande WHERE FIND_IN_SET('EXPEDIEE', etat);
. Utilisateurs ayant plusieurs rôles (SET)
Si un utilisateur avait ACHETEUR,ADMIN :
SELECT * FROM Utilisateur WHERE FIND_IN_SET('ADMIN', role);
7. Insertion de données dynamiques
18. Ajouter une commande automatiquement
INSERT INTO Commande (idUtilisateur, numero, etat)
VALUES (1, CONCAT(DATE_FORMAT(NOW(), '%Y%m%d-%H%i%s'), '-AUTO'), 'EN_INSTANCE');
8. Recherche avancée
. Recherche produit par mot-clé dans le nom
SELECT * FROM Produit WHERE nom LIKE '%Logitech%';
9. Suppression logique (désactivation au lieu de delete)
. Désactiver un utilisateur au lieu de le supprimer
UPDATE Utilisateur SET estActif = 0 WHERE idUtilisateur = 3;