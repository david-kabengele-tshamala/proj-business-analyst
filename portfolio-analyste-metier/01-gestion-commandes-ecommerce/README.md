# Analyse de la gestion des commandes e-commerce

## Contexte métier
Une entreprise de e-commerce souhaite réduire les frictions au moment du paiement et améliorer la visibilité des commandes.

## Problème métier
Les clients ne voient pas une estimation de livraison fiable avant le paiement, tandis que les agents du support ont une visibilité limitée sur le statut des commandes.

## Objectifs
- Rendre l'information de livraison visible avant le paiement.
- Standardiser les statuts de commande.
- Améliorer la traçabilité pour le support client.
- Définir des exigences fonctionnelles et non fonctionnelles claires.

## Périmètre
**Dans le périmètre :** checkout (tunnel de commande), confirmation de paiement, statut de commande, estimation de livraison, visibilité pour le support.

**Hors périmètre :** optimisation de l'entrepôt, implémentation du prestataire de paiement, routage des transporteurs.

## Parties prenantes
| Partie prenante | Intérêt |
|---|---|
| Client | Livraison et statut de commande clairs |
| Ventes | Meilleur taux de finalisation du checkout |
| Logistique | Informations de livraison précises |
| Support | Recherche rapide des commandes |
| Produit/IT | Exigences implémentables |

## Livrables clés
- Cahier des charges métier (BRD)
- Exigences fonctionnelles
- Récits utilisateur
- Critères d'acceptation
- Modèles de processus AS-IS / TO-BE
- Diagrammes de cas d'utilisation et de séquence
- Règles métier
- Requêtes SQL d'analyse
- Scénarios UAT

## Plan du dépôt
```text
docs/        exigences, récits, règles métier, cas d'utilisation
diagrams/    diagrammes Mermaid de style BPMN/UML
sql/         requêtes d'analyse métier
data/        données d'exemple synthétiques
uat/         tests d'acceptation utilisateur
```

## Mesures de succès
- Taux d'abandon du checkout
- Temps de recherche du statut d'une commande pour le support
- Pourcentage de commandes avec estimation de livraison
- Taux d'acceptation UAT

> Toutes les données de ce portfolio sont synthétiques et créées à des fins de démonstration.
