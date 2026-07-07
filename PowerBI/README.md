
#  Dashboard Power BI - Superstore

## Objectif

Cette partie du projet présente la création d’un dashboard interactif dans Power BI à partir des données nettoyées et analysées précédemment avec SQL.

L’objectif est de transformer les données commerciales en indicateurs visuels permettant de suivre la performance globale, d’analyser la rentabilité des produits et de comprendre le comportement des clients.

---

#  Processus de création

Les données utilisées dans Power BI proviennent de la table nettoyée créée avec SQL.

Le processus suivi :

```
Données brutes Superstore
        ↓
Nettoyage et contrôle qualité avec SQL
        ↓
Import des données dans Power BI
        ↓
Création des mesures DAX
        ↓
Création du dashboard interactif
```

---

# Mesures DAX créées

Afin de suivre les performances commerciales, plusieurs indicateurs clés ont été créés :

| Mesure          | Description                   |
| --------------- | ----------------------------- |
| Total Sales     | Chiffre d’affaires total      |
| Total Profit    | Profit généré                 |
| Total Orders    | Nombre total de commandes     |
| Total Customers | Nombre de clients uniques     |
| Profit Margin   | Rentabilité globale           |
| Avg Order Value | Valeur moyenne d’une commande |

---

# Structure du dashboard

## Page 1 — Vue globale / KPI

Cette première page présente une synthèse générale de la performance commerciale.

Indicateurs affichés :

* Total Sales
* Total Profit
* Total Orders
* Total Customers
* Profit Margin

Visualisations utilisées :

* Cartes KPI
* Répartition des ventes
* Analyse globale de la performance

Objectif :

Permettre une compréhension rapide de la situation commerciale.

---

## Page 2 — Analyse produits

Cette page analyse la performance des produits afin d’identifier les éléments ayant le plus d’impact sur la rentabilité.

Analyses réalisées :

* Produits générant le plus de profit
* Produits les moins rentables
* Comparaison entre ventes et profit
* Analyse par catégorie et sous-catégorie

Objectif :

Identifier les produits contribuant positivement ou négativement à la performance globale.

---

## Page 3 — Analyse clients

Cette page étudie le comportement et la rentabilité des différents clients.

Analyses réalisées :

* Répartition des clients par segment :

  * Consumer
  * Corporate
  * Home Office

* Clients générant le plus de chiffre d’affaires

* Clients les plus rentables

* Comparaison entre ventes réalisées et profit généré

Objectif :

Comprendre quels types de clients apportent le plus de valeur à l’entreprise.

---

#  Résultats

Le dashboard permet d’obtenir une vision complète de la performance commerciale :

* Suivi des KPI principaux
* Identification des produits rentables et non rentables
* Analyse de la contribution des clients
* Aide à la prise de décision grâce aux insights business

---

#  Outils utilisés

* Power BI
* DAX
* SQL PostgreSQL
* Dataset Superstore
