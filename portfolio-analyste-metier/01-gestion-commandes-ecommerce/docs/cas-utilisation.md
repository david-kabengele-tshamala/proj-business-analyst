# Cas d'utilisation

## UC-01 — Passer une commande
**Acteur :** Client  
**Préconditions :** le panier contient au moins un article ; l'adresse de livraison est valide.

1. Le client ouvre le checkout.
2. Le système calcule les frais de port.
3. Le système affiche l'estimation de livraison.
4. Le client confirme la commande.
5. Le paiement est autorisé.
6. Le système crée / met à jour la commande.
7. Le client reçoit une confirmation.

**Exceptions**
- Paiement refusé → la commande reste `EN_ATTENTE_PAIEMENT`.
- Adresse invalide → le checkout ne peut pas continuer.
