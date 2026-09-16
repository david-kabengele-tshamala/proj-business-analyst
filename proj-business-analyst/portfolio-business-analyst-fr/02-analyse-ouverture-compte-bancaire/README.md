# Analyse métier — Ouverture de compte bancaire numérique

> **Type de mission :** Analyse métier / Analyse fonctionnelle  
> **Domaine :** Banque numérique  
> **Rôle simulé :** Business Analyst  
> **Statut :** Étude de cas — environnement synthétique

## 1. Contexte

Une banque souhaite digitaliser l'ouverture de compte afin de permettre à un client de déposer sa demande à distance.

La transformation doit néanmoins conserver les contrôles nécessaires à la connaissance du client (KYC) et prévoir un traitement spécifique lorsque le dossier nécessite une intervention humaine.

## 2. Problématique métier

Le parcours d'ouverture de compte doit répondre simultanément à deux objectifs :

- offrir un parcours numérique simple au client ;
- conserver une décision KYC traçable et contrôlable.

L'enjeu fonctionnel est donc de distinguer clairement les dossiers pouvant suivre un parcours automatisé des dossiers nécessitant une revue.

## 3. Objectifs

- centraliser les informations de candidature ;
- valider les données obligatoires ;
- permettre le dépôt d'un justificatif d'identité ;
- enregistrer le résultat du contrôle KYC ;
- orienter les exceptions vers une file de revue ;
- permettre au client de suivre l'état de sa demande ;
- conserver une trace des décisions.

## 4. Parties prenantes

| Partie prenante | Responsabilité / besoin |
|---|---|
| Client | déposer et suivre sa demande |
| Conformité / KYC | analyser les exceptions |
| Opérations | traiter les dossiers |
| Fraude | contribuer aux contrôles |
| Produit | définir l'expérience cible |
| IT | implémenter le processus |

## 5. Périmètre

### Inclus

- création de candidature ;
- saisie des informations ;
- dépôt de document ;
- validation ;
- contrôle KYC ;
- gestion des exceptions ;
- décision ;
- notification ;
- suivi du statut.

### Hors périmètre

- gestion complète du compte après ouverture ;
- tarification bancaire ;
- gestion des transactions ;
- architecture technique détaillée des fournisseurs externes.

## 6. Processus cible

```text
Candidature
    ↓
Saisie des informations
    ↓
Dépôt du document
    ↓
Validation
    ↓
Contrôle KYC
    ↓
┌──────────────┬───────────────┬──────────────┐
│ Clair        │ Exception     │ Rejet        │
↓              ↓               ↓
Approbation    Revue humaine   Rejet
               ↓
               Décision
```

Le modèle détaillé est disponible dans [`diagrams/process.md`](diagrams/process.md).

## 7. Exigences

### Exigences métier

- **EB-001 :** permettre une demande d'ouverture de compte numérique.
- **EB-002 :** contrôler les informations nécessaires à la décision.
- **EB-003 :** assurer une traçabilité des décisions.
- **EB-004 :** permettre une revue humaine des exceptions.

### Exigences fonctionnelles

- **EF-001 :** contrôler les champs obligatoires.
- **EF-002 :** accepter un document d'identité.
- **EF-003 :** enregistrer le résultat KYC.
- **EF-004 :** créer une tâche de revue lorsqu'une exception est détectée.
- **EF-005 :** notifier le client du changement de statut.
- **EF-006 :** empêcher l'exposition des notes internes au client.

### Exigences non fonctionnelles

- **ENF-001 :** contrôler l'accès aux données sensibles.
- **ENF-002 :** assurer la traçabilité des décisions.
- **ENF-003 :** conserver une cohérence du statut entre les interfaces.

## 8. Règles métier

- Les champs obligatoires doivent être complétés avant le contrôle.
- Un document invalide ne peut pas conduire à une approbation automatique.
- Une exception KYC doit être revue par un opérateur autorisé.
- Toute décision finale doit générer un événement d'audit.
- Les notes internes ne sont jamais exposées au client.

## 9. User Stories

### US-001 — Déposer une demande

**En tant que** client,  
**je veux** remplir ma demande d'ouverture en ligne,  
**afin de** ne pas devoir ressaisir les informations en agence.

### US-002 — Traiter une exception

**En tant que** analyste conformité,  
**je veux** consulter les dossiers présentant une exception,  
**afin de** prendre une décision documentée.

**Critères d'acceptation :**

- le dossier contient le résultat du contrôle ;
- l'exception possède une référence ;
- l'analyste peut enregistrer sa décision ;
- l'événement est horodaté.

### US-003 — Suivre ma demande

**En tant que** client,  
**je veux** connaître le statut de ma demande,  
**afin de** savoir si une action est attendue de ma part.

## 10. Analyse SQL

Les requêtes de [`sql/kpi-queries.sql`](sql/kpi-queries.sql) illustrent :

- la répartition des demandes par statut ;
- le taux d'exceptions ;
- le temps moyen de traitement.

Les données sont synthétiques et ne contiennent aucune donnée bancaire réelle.

## 11. UAT

Les scénarios couvrent :

- champ obligatoire manquant ;
- document valide ;
- exception KYC ;
- rejet ;
- séparation entre informations client et informations internes.

Voir [`uat/test-cases.md`](uat/test-cases.md).

## 12. Livrables

- dossier d'exigences ;
- règles métier ;
- user stories ;
- processus BPMN-style ;
- diagramme de cas d'utilisation ;
- diagramme de séquence ;
- indicateurs SQL ;
- scénarios UAT.

## 13. Compétences démontrées

Analyse de processus, exigences fonctionnelles et non fonctionnelles, gestion des exceptions, règles métier, modélisation UML, SQL, UAT et documentation fonctionnelle.

## 14. Hypothèses et limites

Le cas est volontairement simplifié. Les exigences réglementaires précises dépendent de la juridiction, du produit bancaire et des politiques de l'établissement.

## 15. Conclusion

L'analyse transforme un besoin général de digitalisation en **processus, règles, exigences et critères de validation compréhensibles par le métier et l'équipe IT**.
