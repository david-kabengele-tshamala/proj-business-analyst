-- KPI 1 : commandes par statut
SELECT statut, COUNT(*) AS nombre_commandes
FROM commandes
GROUP BY statut
ORDER BY nombre_commandes DESC;

-- KPI 2 : panier moyen
SELECT AVG(montant_total) AS panier_moyen
FROM commandes
WHERE statut <> 'ANNULEE';

-- KPI 3 : couverture des estimations de livraison
SELECT
  COUNT(*) AS total_commandes,
  SUM(CASE WHEN date_livraison_estimee IS NOT NULL THEN 1 ELSE 0 END) AS avec_estimation
FROM commandes;

-- KPI 4 : candidates pour la recherche support : commandes mises à jour le plus récemment
SELECT commande_id, statut, date_mise_a_jour
FROM commandes
ORDER BY date_mise_a_jour DESC
LIMIT 20;
