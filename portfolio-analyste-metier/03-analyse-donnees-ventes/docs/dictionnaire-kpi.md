# Dictionnaire des KPI

## Chiffre d'affaires
**Formule :** `SUM(revenu)`

**Granularité :** ligne de commande / commande selon le modèle source.

**Usage métier :** suivre la performance des ventes.

## Panier moyen
**Formule :** `SUM(revenu) / COUNT(DISTINCT commande_id)`

## Taux d'annulation
**Formule :** `commandes_annulees / total_commandes * 100`

## Hypothèses de qualité des données
- Le revenu est stocké dans la même devise.
- `commande_id` identifie une commande.
- Les commandes annulées restent dans le jeu de données pour le calcul des KPI.
