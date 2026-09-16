-- Chiffre d'affaires par catégorie
SELECT categorie, SUM(revenu) AS chiffre_affaires
FROM ventes
GROUP BY categorie
ORDER BY chiffre_affaires DESC;

-- Chiffre d'affaires par région
SELECT region, SUM(revenu) AS chiffre_affaires
FROM ventes
GROUP BY region
ORDER BY chiffre_affaires DESC;

-- Chiffre d'affaires mensuel
SELECT
  substr(date_commande, 1, 7) AS mois,
  SUM(revenu) AS chiffre_affaires
FROM ventes
GROUP BY substr(date_commande, 1, 7)
ORDER BY mois;

-- Panier moyen
SELECT
  SUM(revenu) / COUNT(DISTINCT commande_id) AS panier_moyen
FROM ventes;

-- Taux d'annulation
SELECT
  100.0 * SUM(CASE WHEN statut = 'ANNULEE' THEN 1 ELSE 0 END) / COUNT(*) AS taux_annulation_pct
FROM ventes;

-- Qualité des données : valeurs manquantes
SELECT
  SUM(CASE WHEN commande_id IS NULL THEN 1 ELSE 0 END) AS commande_id_manquant,
  SUM(CASE WHEN revenu IS NULL THEN 1 ELSE 0 END) AS revenu_manquant,
  SUM(CASE WHEN region IS NULL THEN 1 ELSE 0 END) AS region_manquante
FROM ventes;
