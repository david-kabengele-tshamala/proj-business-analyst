# Analyse métier — Gestion des commandes e-commerce

> **Type de mission :** Analyse métier / Business Analysis IT  
> **Domaine :** E-commerce  
> **Rôle simulé :** Business Analyst  
> **Statut :** Étude de cas — données et contexte synthétiques

## 1. Contexte

Une entreprise de commerce en ligne souhaite améliorer son parcours de commande et réduire les sollicitations du service client liées au suivi des commandes.

L'analyse initiale met en évidence deux difficultés :

- le client ne dispose pas toujours d'une estimation claire de la livraison avant le paiement ;
- les agents du support disposent d'une visibilité limitée sur l'historique d'une commande.

Le projet consiste à formaliser le besoin métier et à produire une base exploitable par une équipe Produit/IT.

## 2. Problématique métier

Le parcours actuel présente un manque de visibilité à deux moments critiques : avant la confirmation du paiement et après la création de la commande.

Cela peut entraîner :

- des demandes supplémentaires auprès du support ;
- de l'incertitude au moment de finaliser un achat ;
- une difficulté à reconstituer le parcours d'une commande ;
- des besoins d'information traités manuellement.

L'objectif de l'analyse n'est pas de choisir une technologie, mais de **définir précisément le problème, les besoins et les comportements attendus du futur système**.

## 3. Objectifs

Le futur processus doit permettre de :

1. afficher une estimation de livraison avant le paiement ;
2. standardiser le cycle de vie d'une commande ;
3. rendre l'historique des statuts consultable par les utilisateurs autorisés ;
4. tracer les changements de statut ;
5. fournir des exigences testables à l'équipe IT.

## 4. Parties prenantes

| Partie prenante | Besoin principal | Niveau d'implication |
|---|---|---|
| Client | connaître le coût et le délai de livraison | Élevé |
| Support client | retrouver rapidement une commande | Élevé |
| Logistique | disposer d'un statut cohérent | Élevé |
| Équipe commerciale | fluidifier le parcours d'achat | Moyen |
| Produit / IT | disposer d'exigences précises | Élevé |

## 5. Périmètre

### Inclus

- panier et passage en caisse ;
- adresse de livraison ;
- estimation de livraison ;
- paiement ;
- création de commande ;
- statuts de commande ;
- historique des statuts ;
- consultation par le support.

### Hors périmètre

- optimisation des stocks ;
- routage des livreurs ;
- développement du prestataire de paiement ;
- optimisation des entrepôts.

## 6. Analyse du processus

### AS-IS

Le processus actuel repose principalement sur le parcours :

**Panier → Adresse → Paiement → Création de commande → Suivi**

La livraison est insuffisamment explicitée avant la confirmation et le support ne dispose pas d'une vue suffisamment structurée de l'historique.

### TO-BE

Le processus cible introduit :

**Panier → Adresse → Calcul livraison → Estimation affichée → Confirmation → Paiement → Commande → Suivi**

Le support dispose également d'une chronologie des changements de statut.

Voir [`diagrams/process.md`](diagrams/process.md).

## 7. Exigences clés

### Exigences métier

- **EB-001 :** le client doit connaître l'estimation de livraison avant de payer.
- **EB-002 :** le support doit pouvoir retrouver une commande.
- **EB-003 :** les statuts doivent suivre un cycle standardisé.
- **EB-004 :** les changements de statut doivent être traçables.

### Exigences fonctionnelles

- **EF-001 :** calculer une estimation de livraison à partir de l'adresse et du mode de livraison.
- **EF-002 :** afficher cette estimation avant confirmation du paiement.
- **EF-003 :** rechercher une commande par numéro.
- **EF-004 :** afficher le statut courant.
- **EF-005 :** afficher l'historique des statuts.
- **EF-006 :** enregistrer la date, l'acteur et les anciennes/nouvelles valeurs lors d'un changement.

## 8. Règles métier

- Une commande ne peut passer à `EXPÉDIÉE` que si le paiement est confirmé.
- Une commande `ANNULÉE` ne peut pas être expédiée.
- Une commande `LIVRÉE` ne revient pas à `EN PRÉPARATION`.
- Chaque changement de statut doit être horodaté.
- Les informations de paiement sensibles ne sont pas accessibles aux agents non autorisés.

## 9. User Stories

### US-001 — Estimation de livraison

**En tant que** client,  
**je veux** connaître la date estimée de livraison avant le paiement,  
**afin de** décider si je finalise ma commande.

**Critères d'acceptation :**

- étant donné une adresse valide et un mode de livraison disponible, l'estimation est affichée ;
- si aucune estimation n'est disponible, un message explicite est présenté ;
- l'estimation est visible avant la confirmation du paiement.

### US-002 — Recherche d'une commande

**En tant que** agent du support,  
**je veux** rechercher une commande par son numéro,  
**afin de** répondre rapidement au client.

### US-003 — Historique

**En tant que** agent du support,  
**je veux** consulter l'historique des statuts,  
**afin de** comprendre les événements ayant affecté la commande.

## 10. Analyse des données

Les requêtes SQL du dossier [`sql/business-queries.sql`](sql/business-queries.sql) servent à illustrer quelques indicateurs :

- volume de commandes par statut ;
- valeur moyenne des commandes ;
- couverture des estimations de livraison ;
- commandes récemment mises à jour.

Les données fournies sont **entièrement synthétiques**.

## 11. Tests d'acceptation

Les scénarios UAT vérifient notamment :

- l'affichage de l'estimation ;
- le blocage d'une adresse invalide ;
- la confirmation d'un paiement ;
- le traitement d'un paiement refusé ;
- l'accès du support à l'historique.

Voir [`uat/test-cases.md`](uat/test-cases.md).

## 12. Livrables

| Livrable | Finalité |
|---|---|
| Exigences métier | Formaliser le besoin |
| Exigences fonctionnelles | Décrire le comportement attendu |
| User Stories | Traduire le besoin en fonctionnalités testables |
| Règles métier | Encadrer les décisions du système |
| BPMN / processus | Représenter le fonctionnement actuel et cible |
| UML | Décrire les interactions |
| SQL | Explorer les indicateurs métier |
| UAT | Vérifier l'adéquation avec le besoin |

## 13. Compétences démontrées

**Analyse métier :** recueil et formalisation des besoins, analyse de processus, règles métier, user stories, critères d'acceptation.

**Analyse fonctionnelle :** cas d'utilisation, séquences, exigences fonctionnelles, UAT.

**Technique :** SQL, modélisation, compréhension des interactions entre composants.

## 14. Limites et hypothèses

Cette étude de cas ne représente pas une implémentation réelle. Les règles, données et processus ont été construits pour démontrer une démarche d'analyse métier.

## 15. Conclusion

Le résultat attendu est une **spécification claire et testable**, permettant aux équipes Produit, Développement et QA de partager la même compréhension du besoin avant implémentation.
