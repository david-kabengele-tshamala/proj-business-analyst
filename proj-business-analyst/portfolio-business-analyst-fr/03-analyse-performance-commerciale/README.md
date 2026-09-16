# Analyse métier & données — Performance commerciale

> **Type de mission :** Business Analysis + Data Analysis  
> **Domaine :** Performance commerciale  
> **Rôle simulé :** Business Analyst orienté données  
> **Statut :** Étude de cas — données synthétiques

## 1. Contexte

La direction commerciale souhaite disposer d'une lecture structurée de la performance des ventes.

La demande initiale est volontairement large :

> « Nous voulons mieux comprendre nos ventes. »

Le travail du Business Analyst consiste d'abord à transformer cette demande en **questions métier mesurables**, puis à définir les indicateurs nécessaires.

## 2. Problématique

Une donnée brute ne constitue pas automatiquement un indicateur métier.

Avant d'écrire une requête SQL, l'analyse doit préciser :

- ce que l'entreprise cherche à mesurer ;
- la définition exacte de chaque KPI ;
- la population concernée ;
- la période ;
- les règles de calcul ;
- les problèmes éventuels de qualité des données.

## 3. Questions métier

### Q1
Quelles catégories génèrent le plus de chiffre d'affaires ?

### Q2
Quelle est la contribution de chaque région ?

### Q3
Comment le chiffre d'affaires évolue-t-il dans le temps ?

### Q4
Quel est le taux d'annulation ?

### Q5
Les données disponibles sont-elles suffisamment fiables pour produire ces indicateurs ?

## 4. Parties prenantes

| Partie prenante | Besoin |
|---|---|
| Direction commerciale | vision globale |
| Responsables régionaux | performance par région |
| Responsables produits | performance par catégorie |
| Finance | cohérence des montants |
| IT / Data | définition des données nécessaires |

## 5. Dictionnaire des KPI

| KPI | Définition | Formule |
|---|---|---|
| Chiffre d'affaires | somme des revenus | `SUM(revenue)` |
| Commandes | nombre de commandes distinctes | `COUNT(DISTINCT order_id)` |
| Panier moyen | revenu moyen par commande | `SUM(revenue)/COUNT(DISTINCT order_id)` |
| Taux d'annulation | proportion de commandes annulées | `annulées / total × 100` |
| CA par région | revenu regroupé par région | `SUM(revenue) GROUP BY region` |

Le dictionnaire complet se trouve dans [`docs/dictionnaire-kpi.md`](docs/kpi-dictionary.md).

## 6. Exigences de données

Pour répondre aux questions métier, les champs suivants sont nécessaires :

| Champ | Obligatoire | Utilisation |
|---|---|---|
| `order_id` | Oui | identifier une commande |
| `order_date` | Oui | analyse temporelle |
| `region` | Oui | analyse géographique |
| `category` | Oui | analyse produit |
| `revenue` | Oui | calcul du CA |
| `status` | Oui | calcul des annulations |

Voir [`docs/data-requirements.md`](docs/data-requirements.md).

## 7. Analyse SQL

Les requêtes de [`sql/analysis.sql`](sql/analysis.sql) permettent notamment de :

- calculer le CA par catégorie ;
- calculer le CA par région ;
- suivre le CA mensuel ;
- calculer le panier moyen ;
- mesurer le taux d'annulation ;
- identifier les valeurs manquantes.

## 8. Qualité des données

Avant d'interpréter un KPI, les contrôles suivants doivent être effectués :

- identifiants présents et cohérents ;
- montants numériques ;
- dates valides ;
- régions conformes au référentiel ;
- catégories conformes ;
- traitement explicite des commandes annulées ;
- cohérence de la granularité.

La checklist est disponible dans [`uat/data-validation.md`](uat/data-validation.md).

## 9. Exemple de raisonnement Business Analyst

Une mauvaise approche serait :

**Données → graphique → conclusion**

L'approche retenue ici est :

**Question métier → définition du KPI → données nécessaires → contrôle qualité → SQL → résultat → interprétation**

Cette distinction est importante : le rôle du BA/Data Analyst n'est pas uniquement de produire des chiffres, mais de garantir que **le chiffre répond bien à la question métier posée**.

## 10. Livrables

- questions métier ;
- dictionnaire KPI ;
- exigences de données ;
- requêtes SQL ;
- données synthétiques ;
- contrôles qualité ;
- checklist de validation.

## 11. Compétences démontrées

**Business Analysis :** clarification du besoin, définition des KPI, exigences de données, parties prenantes, règles de calcul.

**Data :** SQL, agrégation, segmentation, contrôle qualité et analyse temporelle.

**Communication :** transformation d'une demande métier vague en éléments mesurables et vérifiables.

## 12. Hypothèses et limites

Les données sont fictives et très réduites. Elles servent à démontrer la méthode et non à représenter la performance réelle d'une entreprise.

## 13. Conclusion

Ce projet montre la frontière entre **Business Analysis et Data Analysis** : le BA commence par comprendre la question métier et formalise ce qui doit être mesuré ; l'analyse de données fournit ensuite les moyens de quantifier le phénomène.
