# Cas de test UAT

| ID | Scénario | Résultat attendu |
|---|---|---|
| UAT-001 | Adresse valide au checkout | Estimation de livraison affichée |
| UAT-002 | Adresse invalide | Le checkout bloque la progression |
| UAT-003 | Paiement accepté | La commande devient `PAYEE` |
| UAT-004 | Paiement refusé | La commande reste `EN_ATTENTE_PAIEMENT` |
| UAT-005 | Le support recherche une commande | La chronologie de la commande est affichée |
