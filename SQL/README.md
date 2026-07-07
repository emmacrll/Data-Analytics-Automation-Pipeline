#  Analyse SQL

## Objectif

Cette partie du projet consiste à préparer, vérifier et analyser les données commerciales du dataset **Superstore** avant leur utilisation dans Power BI.

Après l’importation des données dans PostgreSQL, SQL a été utilisé afin d’explorer la structure du dataset, contrôler sa qualité, identifier les éventuelles anomalies et créer une base propre pour l’analyse.

---

## Étapes réalisées

### 1. Importation et exploration des données

Après l’importation du fichier Superstore dans PostgreSQL, une première analyse exploratoire a été réalisée afin de comprendre la structure des données.

Les vérifications effectuées comprennent :

* Identification des tables disponibles
* Vérification du nombre de lignes
* Aperçu des premières observations
* Analyse des colonnes et des types de données

---

### 2. Audit de la qualité des données

Une étape de contrôle qualité a ensuite été réalisée afin d’identifier les éventuels problèmes dans les données.

Les contrôles effectués :

* Recherche de valeurs manquantes
* Vérification des valeurs incohérentes (ventes ou quantités négatives)
* Identification des transactions en perte
* Recherche de doublons
* Vérification du nombre de commandes et de clients uniques

Cette étape permet de s’assurer que les données utilisées pour l’analyse sont fiables.

---

### 3. Nettoyage des données

Une table nettoyée **superstore_clean** a été créée afin de conserver uniquement les données nécessaires à l’analyse.

Les transformations réalisées :

* Suppression des doublons
* Suppression des lignes avec des valeurs invalides
* Conservation uniquement des ventes et quantités positives
* Vérification finale de la qualité des données

---

### 4. Analyses business réalisées

Les requêtes SQL permettent ensuite d’obtenir différents indicateurs et analyses :

* Chiffre d’affaires total
* Profit total
* Nombre de commandes
* Nombre de clients
* Analyse des segments clients
* Analyse des produits rentables et non rentables
* Analyse des performances commerciales par région

---

## Indicateurs principaux

| KPI             | Description               |
| --------------- | ------------------------- |
| Total Sales     | Chiffre d'affaires généré |
| Total Profit    | Profit réalisé            |
| Total Orders    | Nombre de commandes       |
| Total Customers | Nombre de clients         |
| Profit Margin   | Rentabilité globale       |

---

## Résultats

Les données nettoyées et analysées avec SQL ont ensuite été utilisées dans Power BI afin de construire un dashboard interactif permettant de suivre les performances commerciales et d’identifier des insights business.
