-- Demandes par statut
SELECT statut, COUNT(*) AS demandes
FROM demandes
GROUP BY statut;

-- Taux d'anomalies
SELECT
  100.0 * SUM(CASE WHEN resultat_kyc = 'ANOMALIE' THEN 1 ELSE 0 END) / COUNT(*) AS taux_anomalies_pct
FROM demandes;

-- Délai moyen de traitement des dossiers terminés
SELECT AVG(date_completion - date_creation) AS delai_moyen_traitement
FROM demandes
WHERE statut IN ('APPROUVEE', 'REJETEE');
