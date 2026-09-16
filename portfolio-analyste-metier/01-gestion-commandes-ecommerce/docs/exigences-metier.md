# Exigences métier

## BR-001 — Visibilité de la livraison
Le client doit pouvoir voir une date de livraison estimée avant la confirmation du paiement.

## BR-002 — Traçabilité des commandes
Les agents du support doivent pouvoir retrouver une commande et voir son statut actuel ainsi que l'historique de ses statuts.

## BR-003 — Cycle de vie standardisé
Le cycle de vie de la commande doit utiliser un ensemble contrôlé de statuts :
`EN_ATTENTE_PAIEMENT`, `PAYEE`, `EN_TRAITEMENT`, `EXPEDIEE`, `LIVREE`, `ANNULEE`.

## BR-004 — Auditabilité
Chaque changement de statut doit enregistrer l'horodatage, le statut précédent, le nouveau statut et l'acteur/système.

## Règles métier
- Une commande ne peut passer à `EXPEDIEE` que si le paiement est confirmé.
- Une commande `LIVREE` ne peut pas revenir à `EN_TRAITEMENT`.
- Une commande annulée ne peut pas être expédiée.
- Les estimations de livraison doivent être calculées à partir de l'adresse de livraison et de l'option d'expédition.
