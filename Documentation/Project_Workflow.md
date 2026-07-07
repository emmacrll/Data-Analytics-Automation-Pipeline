# 🔄 Superstore Data Analytics & Automation Pipeline

## Présentation du projet

Ce projet présente la création d’un pipeline complet d’analyse de données commerciales basé sur le dataset **Superstore**.

L’objectif est de reproduire un environnement proche d’un contexte professionnel en mettant en place une chaîne complète allant de l’ingestion des données jusqu’à l’automatisation du reporting.

Le projet couvre les différentes étapes d’un processus Data Analytics :

* Déploiement d’un environnement de base de données avec Docker
* Stockage des données dans PostgreSQL
* Ingestion automatisée des données avec Python
* Contrôle qualité et nettoyage avec SQL
* Analyse exploratoire des données
* Création d’un dashboard interactif avec Power BI
* Automatisation de la diffusion des KPI avec Power Automate

---

# 🏗️ Architecture globale du pipeline

Le flux de traitement mis en place est le suivant :

```
Dataset Superstore (CSV)
          ↓
Python + Pandas
          ↓
PostgreSQL (Docker)
          ↓
SQL Data Quality & Cleaning
          ↓
Power BI Dashboard
          ↓
Power Automate Reporting
          ↓
Email automatique KPI
```

Cette architecture permet de transformer des données brutes en informations exploitables pour la prise de décision.

---

#  Étape 1 — Mise en place de l’environnement de base (PostgreSQL via Docker)

## Objectif

Avant toute analyse, un environnement de stockage structuré a été mis en place afin de garantir un traitement fiable, reproductible et proche des pratiques utilisées en entreprise.

La base de données PostgreSQL a été déployée dans un conteneur Docker afin d’isoler l’environnement et faciliter sa réutilisation.

---

## 📦 Conteneurisation avec Docker

Docker a été utilisé afin de créer un environnement PostgreSQL indépendant du système local.

Cette approche permet :

* d’éviter les problèmes de configuration locale ;
* de reproduire facilement l’environnement ;
* de simplifier le déploiement du projet.

Configuration utilisée :

| Élément         | Valeur        |
| --------------- | ------------- |
| Image Docker    | PostgreSQL    |
| Version         | PostgreSQL 16 |
| Base de données | superstore_db |
| Utilisateur     | admin         |
| Port            | 5432          |

---

## 🗄️ Création de la base PostgreSQL

Une base relationnelle PostgreSQL a été initialisée afin de stocker les données commerciales Superstore.

Cette base constitue le point central du pipeline analytique.

Elle permet :

* le stockage structuré des données ;
* l’exécution de requêtes SQL analytiques ;
* la préparation des données avant leur utilisation dans Power BI.

---

## 🔗 Administration avec pgAdmin

L’administration de PostgreSQL a été réalisée avec pgAdmin 4.

Cette interface permet :

* la gestion du serveur PostgreSQL ;
* l’exécution des requêtes SQL ;
* la visualisation des tables ;
* la vérification des résultats.

Configuration de connexion :

| Paramètre | Valeur               |
| --------- | -------------------- |
| Host      | host.docker.internal |
| Port      | 5432                 |
| Database  | superstore_db        |
| Username  | admin                |

📸 Capture :

```
/Documentation/screenshots/docker_pgadmin.png
```

---

## 🎯 Résultat de l’étape

À la fin de cette étape, l’environnement technique nécessaire au projet est opérationnel.

Cette infrastructure permet ensuite :

* l’importation du dataset Superstore ;
* le nettoyage des données ;
* l’analyse SQL ;
* la connexion avec Power BI.

---

#  Étape 2 — Ingestion et structuration des données Superstore (Python + PostgreSQL)

## Objectif

Après la création de l’environnement PostgreSQL, le dataset Superstore a été intégré dans la base afin de permettre son exploitation analytique.

L’objectif était de créer un processus d’import reproductible permettant de charger automatiquement les données.

---

# 📊 Chargement du dataset

Le dataset Superstore, fourni sous format CSV, contient des informations relatives :

* aux commandes ;
* aux clients ;
* aux produits ;
* aux ventes ;
* aux profits ;
* aux régions ;
* aux segments clients.

Avant l’analyse, les données ont été importées dans PostgreSQL afin d’être centralisées.

---

# 🐍 Pipeline Python d’ingestion

Un script Python basé sur la librairie **Pandas** a été utilisé pour automatiser l’intégration des données.

Le pipeline réalise :

* lecture du fichier CSV ;
* contrôle des types de données ;
* gestion de l’encodage ;
* préparation des colonnes ;
* création de la table PostgreSQL ;
* insertion automatique des données.

Cette automatisation permet d’obtenir un processus reproductible et facilement maintenable.

---

# 🧱 Structure des données

Les données ont été chargées dans une table brute :

```
superstore_raw
```

Cette table contient l’ensemble des observations originales du dataset.

Caractéristiques principales :

| Élément           | Valeur |
| ----------------- | ------ |
| Nombre de lignes  | 9 994  |
| Commandes uniques | 5 009  |
| Clients uniques   | 793    |

---

# ⚠️ Gestion des problèmes d’import

Lors des premiers tests d’import, plusieurs problèmes ont été rencontrés :

* erreurs d’encodage CSV ;
* mauvaise interprétation de certains champs ;
* problèmes liés aux séparateurs décimaux.

Ces difficultés ont été résolues grâce à :

* l’utilisation de Python pour contrôler l’import ;
* la gestion explicite de l’encodage ;
* la validation des types avant insertion.

---

# 🎯 Résultat de l’étape

Cette étape permet :

* de rendre les données accessibles dans PostgreSQL ;
* d’automatiser l’ingestion ;
* de préparer les données pour l’analyse SQL ;
* de construire un pipeline de données complet.


#  Étape 3 — Analyse exploratoire & contrôle qualité des données (SQL)

## Objectif

Après l’intégration du dataset dans PostgreSQL, une première phase d’analyse exploratoire a été réalisée afin de vérifier la qualité des données et d’identifier les premières tendances commerciales.

Cette étape permet de s’assurer que les données utilisées pour les analyses BI sont fiables et exploitables.

Les contrôles réalisés concernent :

* la structure des données ;
* les valeurs manquantes ;
* les anomalies métier ;
* les doublons ;
* la cohérence des indicateurs commerciaux.

---

# 📋 Vérification de la structure des données

Une première analyse consiste à vérifier les tables présentes dans la base ainsi que la structure de la table principale.

Table analysée :

```sql
superstore_raw
```

Cette vérification permet de confirmer :

* la présence des données importées ;
* le nombre de colonnes disponibles ;
* les types de données utilisés.

---

# 🔍 Contrôle des valeurs manquantes

Afin de garantir la qualité des analyses futures, plusieurs colonnes essentielles ont été contrôlées :

* Customer Name
* Product Name
* Sales
* Profit

Requête utilisée :

```sql
SELECT 
  COUNT(*) FILTER (WHERE "Customer Name" IS NULL) AS missing_customer,
  COUNT(*) FILTER (WHERE "Product Name" IS NULL) AS missing_product,
  COUNT(*) FILTER (WHERE "Sales" IS NULL) AS missing_sales,
  COUNT(*) FILTER (WHERE "Profit" IS NULL) AS missing_profit
FROM superstore_raw;
```

### Résultat

Aucune valeur manquante critique détectée dans les colonnes principales.

Les données peuvent donc être utilisées pour l’analyse commerciale.

---

# ⚠️ Détection des anomalies métier

Plusieurs contrôles ont été réalisés afin d’identifier les valeurs incohérentes.

## Quantités négatives ou nulles

```sql
SELECT COUNT(*)
FROM superstore_raw
WHERE "Quantity" <= 0;
```

Objectif :

Détecter les transactions avec des quantités impossibles.

---

## Ventes négatives ou nulles

```sql
SELECT COUNT(*)
FROM superstore_raw
WHERE "Sales" <= 0;
```

Objectif :

Identifier les lignes ne représentant pas une transaction commerciale valide.

---

## Transactions en perte

```sql
SELECT COUNT(*)
FROM superstore_raw
WHERE "Profit" < 0;
```

### Résultat :

1871 transactions présentent un profit négatif.

### Interprétation :

Une partie importante des ventes génère des pertes.

Ces pertes peuvent être liées à :

* des remises trop importantes ;
* certains produits peu rentables ;
* certains segments clients ;
* une mauvaise stratégie de prix.

---

# 🔁 Recherche des doublons

Une vérification des doublons métier a été réalisée à partir de plusieurs identifiants :

* Order ID
* Product ID
* Customer ID

```sql
SELECT 
  "Order ID",
  "Product ID",
  "Customer ID",
  COUNT(*)
FROM superstore_raw
GROUP BY 
  "Order ID",
  "Product ID",
  "Customer ID"
HAVING COUNT(*) > 1;
```

Cette étape permet de détecter les éventuelles répétitions pouvant fausser les indicateurs.

---

# 📊 Premiers indicateurs commerciaux

## Nombre de commandes

```sql
SELECT COUNT(DISTINCT "Order ID")
FROM superstore_raw;
```

Résultat :

* **5009 commandes uniques**

---

## Nombre de clients

```sql
SELECT COUNT(DISTINCT "Customer ID")
FROM superstore_raw;
```

Résultat :

* **793 clients uniques**

---

# 💰 Analyse statistique des ventes

Une analyse descriptive a été réalisée sur la colonne Sales.

```sql
SELECT 
MIN("Sales"),
MAX("Sales"),
AVG("Sales")
FROM superstore_raw;
```

Résultats :

| Indicateur     | Valeur   |
| -------------- | -------- |
| Vente minimale | 0.44     |
| Vente maximale | 22638.48 |
| Vente moyenne  | 229.85   |

---

# 📈 Analyse statistique des profits

```sql
SELECT 
MIN("Profit"),
MAX("Profit"),
AVG("Profit")
FROM superstore_raw;
```

Résultats :

| Indicateur     | Valeur   |
| -------------- | -------- |
| Profit minimum | -6599.97 |
| Profit maximum | 8399.97  |
| Profit moyen   | 28.65    |

---

# 🎯 Conclusion de l’étape

Cette phase d’audit permet de conclure que :

* les données sont globalement complètes ;
* les indicateurs principaux sont exploitables ;
* certaines transactions présentent une rentabilité négative ;
* des analyses supplémentaires sont nécessaires afin d’identifier les causes des pertes.

Cette étape garantit une base fiable avant le nettoyage et la modélisation BI.

---

# Étape 4 — Nettoyage et création d’un dataset exploitable (SQL)

## Objectif

Après l’audit qualité, une table nettoyée a été créée afin de conserver uniquement les données pertinentes pour l’analyse.

L’objectif est d’obtenir une version fiable du dataset destinée aux analyses Power BI.

---

# 🧹 Création de la table nettoyée

Une nouvelle table a été créée :

```sql
superstore_clean
```

Cette table est générée depuis :

```sql
superstore_raw
```

Requête utilisée :

```sql
CREATE TABLE superstore_clean AS
SELECT DISTINCT *
FROM superstore_raw
WHERE "Sales" > 0
AND "Quantity" > 0
AND "Customer ID" IS NOT NULL
AND "Product ID" IS NOT NULL;
```

---

# 📌 Règles de nettoyage appliquées

## Suppression des doublons

```sql
SELECT DISTINCT *
```

Permet de conserver uniquement les lignes uniques.

---

## Conservation des ventes valides

```sql
"Sales" > 0
```

Supprime les transactions sans valeur commerciale.

---

## Vérification des quantités

```sql
"Quantity" > 0
```

Élimine les volumes incohérents.

---

## Garantie d’identification

```sql
"Customer ID" IS NOT NULL

"Product ID" IS NOT NULL
```

Permet de conserver uniquement les transactions associées à un client et un produit.

---

# 📊 Validation après nettoyage

Le nombre de lignes restantes est contrôlé :

```sql
SELECT COUNT(*) 
FROM superstore_clean;
```

Cette étape permet de confirmer que le nettoyage n’a pas supprimé une quantité excessive de données.

---

# 📉 Analyse finale des pertes

Une dernière vérification est réalisée :

```sql
SELECT 
COUNT(*) FILTER (WHERE "Profit" < 0) AS loss_orders,
COUNT(*) AS total_rows
FROM superstore_clean;
```

Objectif :

Mesurer la proportion de transactions non rentables après nettoyage.

---

# 🎯 Résultat de l’étape

Le dataset nettoyé constitue désormais une base fiable pour :

* l’analyse exploratoire avancée ;
* la création des mesures Power BI ;
* la construction du dashboard ;
* l’automatisation du reporting.

#  Étape 5 — Analyse exploratoire des données (EDA SQL)

## Objectif

Une analyse exploratoire approfondie a été réalisée sur la table `superstore_clean` afin d’identifier les principaux facteurs influençant la performance commerciale.

Cette étape permet de répondre à plusieurs questions business :

* Quelle est la performance globale de l’entreprise ?
* Quels produits génèrent le plus de valeur ?
* Quels clients sont les plus rentables ?
* Quelles régions performent le mieux ?
* Où se situent les principales pertes ?

---

# 📊 Vue globale du dataset

Après nettoyage, le dataset représente une activité commerciale complète.

Principaux indicateurs :

| KPI                         | Valeur |
| --------------------------- | ------ |
| Nombre total de lignes      | 9 994  |
| Nombre de commandes uniques | 5 009  |
| Nombre de clients uniques   | 793    |

Le dataset contient plusieurs dimensions d’analyse :

* clients ;
* produits ;
* catégories ;
* régions ;
* segments commerciaux ;
* ventes ;
* profits.

---

# 💰 Analyse des ventes et de la rentabilité

Les statistiques principales permettent d’évaluer la distribution des performances commerciales.

## Ventes

| Indicateur     | Valeur    |
| -------------- | --------- |
| Vente minimale | 0.44      |
| Vente maximale | 22 638.48 |
| Vente moyenne  | 229.86    |

## Profit

| Indicateur     | Valeur    |
| -------------- | --------- |
| Profit minimum | -6 599.98 |
| Profit maximum | 8 399.98  |
| Profit moyen   | 28.65     |

---

# 📉 Analyse des transactions déficitaires

L’analyse des profits négatifs montre :

* **1871 transactions avec un profit inférieur à zéro**

Cela représente une proportion importante des ventes.

## Interprétation business

Certaines ventes génèrent du chiffre d’affaires mais diminuent la rentabilité globale.

Les causes possibles peuvent être :

* remises trop importantes ;
* coûts produits élevés ;
* catégories moins rentables ;
* mauvaise stratégie commerciale.

Cette analyse souligne l’importance de suivre le profit et pas uniquement les ventes.

---

# 📦 Analyse des produits

L’analyse produit permet d’identifier les catégories et sous-catégories ayant le plus d’impact.

## Catégories principales

Le dataset contient trois grandes catégories :

* Furniture
* Office Supplies
* Technology

## Sous-catégories analysées

Les produits sont répartis dans 17 sous-catégories :

* Accessories
* Appliances
* Art
* Binders
* Bookcases
* Chairs
* Copiers
* Envelopes
* Fasteners
* Furnishings
* Labels
* Machines
* Paper
* Phones
* Storage
* Supplies
* Tables

---

# 🔝 Produits les plus vendus

Les produits ayant le plus grand volume de commandes sont :

| Produit                    | Nombre de ventes |
| -------------------------- | ---------------- |
| Staples                    | 215              |
| Staple Envelope            | 170              |
| Easy-staple Paper          | 150              |
| Staples in misc. colors    | 86               |
| KI Adjustable-Height Table | 74               |

## Insight

Les produits les plus commandés correspondent principalement à des fournitures de bureau.

Ils représentent un fort volume mais une faible valeur unitaire.

---

# 🌎 Analyse géographique

L’analyse régionale permet d’identifier les zones commerciales les plus actives.

Répartition des transactions :

| Région  | Nombre de transactions |
| ------- | ---------------------- |
| West    | 3203                   |
| East    | 2848                   |
| Central | 2323                   |
| South   | 1620                   |

## Insight

La région **West** représente la zone commerciale la plus dynamique.

Elle constitue une opportunité intéressante pour approfondir l’analyse des ventes et de la rentabilité.

---

# 👥 Analyse clients

L’analyse client permet d’identifier les utilisateurs ayant le plus d’impact sur la performance.

## Clients avec le plus grand nombre de commandes

| Client           | Commandes |
| ---------------- | --------- |
| William Brown    | 37        |
| Paul Prost       | 34        |
| Matt Abelman     | 34        |
| John Lee         | 34        |
| Jonathan Doherty | 32        |

---

## Clients les plus rentables

| Client        | Profit généré |
| ------------- | ------------- |
| Tamara Chand  | 8981.32       |
| Raymond Buch  | 6976.09       |
| Sanjit Chand  | 5757.41       |
| Hunter Lopez  | 5622.42       |
| Adrian Barton | 5444.80       |

---

# 🎯 Conclusion de l’analyse exploratoire

Cette analyse met en évidence plusieurs tendances :

* l’activité commerciale est principalement concentrée aux États-Unis ;
* certaines ventes génèrent du chiffre d’affaires mais restent peu rentables ;
* certains clients représentent une part importante du profit ;
* la performance varie selon les régions ;
* les produits doivent être analysés selon leur rentabilité et non uniquement leur volume de ventes.

Ces résultats servent de base à la création du dashboard Power BI.

---

#  Étape 6 — Création du dashboard analytique Power BI

## Objectif

Les données nettoyées ont ensuite été utilisées dans Power BI afin de créer un tableau de bord interactif permettant de transformer les données commerciales en indicateurs décisionnels.

L’objectif principal est de fournir une vision claire et rapide de la performance globale.

---

# 📥 Import et préparation des données

Le dataset `superstore_clean` a été connecté à Power BI.

Les étapes réalisées :

* import des données depuis PostgreSQL ;
* vérification des types de données ;
* correction des formats numériques ;
* préparation du modèle analytique.

Les colonnes utilisées concernent notamment :

* Sales ;
* Profit ;
* Quantity ;
* Customer ;
* Product ;
* Region ;
* Category ;
* Segment.

📸 Capture :

```text
/PowerBI/Screenshots/data_import.png
```

---

# 🧮 Création des mesures DAX

Plusieurs indicateurs clés ont été créés afin de suivre la performance.

## Total Sales

Mesure permettant de calculer le chiffre d’affaires total :

```DAX
Total Sales = SUM(Superstore[Sales])
```

---

## Total Profit

Calcul du profit généré :

```DAX
Total Profit = SUM(Superstore[Profit])
```

---

## Total Orders

Nombre de commandes uniques :

```DAX
Total Orders = DISTINCTCOUNT(Superstore[Order ID])
```

---

## Total Customers

Nombre de clients uniques :

```DAX
Total Customers = DISTINCTCOUNT(Superstore[Customer ID])
```

---

## Profit Margin

Calcul de la rentabilité :

```DAX
Profit Margin = DIVIDE([Total Profit],[Total Sales])
```

---

# 📊 Page 1 — Vue globale KPI

Cette première page présente une vision générale de la performance.

## Indicateurs affichés :

* Total Sales
* Total Profit
* Profit Margin
* Total Orders
* Total Customers

Valeurs principales :

| KPI             | Valeur         |
| --------------- | -------------- |
| Total Sales     | 2 297 200.86 $ |
| Total Profit    | 286 397.02 $   |
| Total Orders    | 5 009          |
| Total Customers | 793            |

📸 Capture :

```text
/PowerBI/Screenshots/global_dashboard.png
```

---

# 📦 Page 2 — Analyse produits

Cette page permet d’étudier la performance des produits.

Visualisations :

* ventes par catégorie ;
* top produits ;
* produits les moins rentables ;
* analyse profit vs ventes.

Objectifs :

* identifier les produits générant le plus de valeur ;
* détecter les produits non rentables ;
* comprendre la relation entre volume et profit.

📸 Capture :

```text
/PowerBI/Screenshots/product_analysis.png
```

---

# 👥 Page 3 — Analyse clients

Cette page analyse la contribution des différents profils clients.

Visualisations :

* ventes par segment ;
* profit par client ;
* top clients ;
* comparaison des segments.

Segments étudiés :

* Consumer
* Corporate
* Home Office

Objectif :

Identifier les clients et segments les plus intéressants pour l’entreprise.

📸 Capture :

```text
/PowerBI/Screenshots/customer_analysis.png
```

---

#  Étape 7 — Automatisation du reporting avec Power Automate

## Objectif

La dernière étape consiste à automatiser la diffusion des KPI Power BI afin de créer un système de reporting automatique.

L’objectif est d’éviter une extraction manuelle des données et de permettre l’envoi régulier d’un résumé de performance.

---

# 🔗 Connexion Power BI - Power Automate

Un flux Power Automate a été créé afin de :

1. récupérer les KPI depuis Power BI ;
2. analyser les résultats ;
3. générer automatiquement un email de synthèse.

Architecture :

```text
Power BI Dataset
        ↓
Power Automate
        ↓
Requête DAX
        ↓
Analyse JSON
        ↓
Email automatique KPI
```

---

# 📊 Extraction automatique des KPI

Une requête DAX est exécutée depuis Power Automate :

```DAX
EVALUATE
ROW(
"Total Sales", [Total Sales],
"Total Profit", [Total Profit],
"Total Orders", [Total Orders],
"Total Customers", [Total Customers]
)
```

Cette requête permet de récupérer automatiquement :

* chiffre d’affaires ;
* profit ;
* nombre de commandes ;
* nombre de clients.

---

# 📧 Génération automatique du rapport email

Les valeurs récupérées sont ensuite intégrées automatiquement dans un email.

Exemple :

```
Superstore Business Performance Report

Total Sales : 2 297 200.86 $

Total Profit : 286 397.02 $

Total Orders : 5009

Total Customers : 793
```

📸 Capture :

```text
/PowerAutomate/Screenshots/email_report.png
```

---

# ⏱️ Planification automatique

Le flux peut être configuré avec une fréquence automatique :

* quotidienne ;
* hebdomadaire ;
* mensuelle.

Cela permet de transformer le dashboard Power BI en véritable outil de reporting opérationnel.

---

# 🎯 Conclusion générale du projet

Ce projet démontre la mise en place d’un pipeline analytique complet :

* stockage des données avec PostgreSQL ;
* automatisation de l’ingestion avec Python ;
* contrôle qualité avec SQL ;
* visualisation avec Power BI ;
* automatisation du reporting avec Power Automate.

La combinaison de ces outils permet de transformer des données brutes en informations exploitables pour accompagner la prise de décision.

