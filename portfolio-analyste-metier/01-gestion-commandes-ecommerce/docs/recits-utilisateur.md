# Récits utilisateur

## US-001 — Estimation de livraison
**En tant que** client  
**Je veux** voir ma date de livraison estimée avant le paiement  
**Afin de** décider si je finalise l'achat.

### Critères d'acceptation
- Étant donné une adresse de livraison valide et une option d'expédition, lorsque le checkout se charge, alors une date de livraison estimée est affichée.
- Étant donné l'absence d'estimation de livraison disponible, lorsque le checkout se charge, alors le client reçoit un message de repli clair.

## US-002 — Recherche de commande par le support
**En tant que** agent du support  
**Je veux** rechercher une commande par son numéro  
**Afin de** répondre rapidement aux questions des clients.

### Critères d'acceptation
- La recherche par numéro de commande exact retourne la commande.
- Le statut actuel et la dernière mise à jour sont affichés.
- Les utilisateurs non autorisés ne peuvent pas accéder aux détails de paiement des clients.

## US-003 — Historique des statuts
**En tant que** agent du support  
**Je veux** consulter l'historique des statuts  
**Afin de** comprendre ce qui s'est passé sur une commande.

## US-004 — Confirmation du checkout
**En tant que** client  
**Je veux** vérifier la livraison et le coût total avant le paiement  
**Afin de** confirmer la commande en toute confiance.
