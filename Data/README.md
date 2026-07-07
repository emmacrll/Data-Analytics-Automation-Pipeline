#  Data — Superstore Dataset

## Présentation

Ce dossier contient les différentes versions du dataset utilisées dans le projet **Data Analytics & Automation Pipeline**.

Les données proviennent du dataset commercial **Superstore**, contenant des informations relatives aux ventes, aux clients, aux produits et aux performances commerciales.

Les fichiers présents dans ce dossier correspondent aux différentes étapes de préparation des données :

* données brutes utilisées comme source initiale ;
* données nettoyées utilisées pour les analyses SQL et Power BI.

---

#  Dataset brut — `superstore_raw`

## Description

Le fichier brut correspond aux données originales importées dans le pipeline avant transformation.

Cette version conserve l’ensemble des informations disponibles afin de permettre :

* l’audit qualité des données ;
* l’analyse exploratoire ;
* la détection des anomalies ;
* la comparaison avant/après nettoyage.

## Caractéristiques principales

| Élément          | Description                   |
| ---------------- | ----------------------------- |
| Format           | CSV                           |
| Nombre de lignes | 9 994                         |
| Source           | Dataset Superstore            |
| Utilisation      | Ingestion initiale PostgreSQL |

## Informations contenues

Le dataset comprend notamment :

###  Commandes

* Order ID
* Order Date
* Ship Date
* Ship Mode

###  Clients

* Customer ID
* Customer Name
* Segment

###  Produits

* Product ID
* Product Name
* Category
* Sub-Category

###  Performance commerciale

* Sales
* Quantity
* Discount
* Profit

###  Localisation

* Country
* Region
* State
* City

---

#  Dataset nettoyé — `superstore_clean`

## Description

Après l’importation dans PostgreSQL, une phase de contrôle qualité et de nettoyage a été réalisée avec SQL.

Une nouvelle table nettoyée a été créée afin de conserver uniquement les données exploitables pour l’analyse.

Table PostgreSQL :

```sql
superstore_clean
```

---

## Règles de nettoyage appliquées

Les transformations réalisées incluent :

### Suppression des doublons

Les lignes dupliquées ont été supprimées grâce à :

```sql
SELECT DISTINCT *
```

---

### Suppression des transactions invalides

Les lignes ne respectant pas les règles métier ont été exclues :

```sql
Sales > 0
```

Permet de supprimer les ventes nulles ou incohérentes.

```sql
Quantity > 0
```

Permet de conserver uniquement les transactions avec des quantités valides.

---

### Vérification des identifiants

Les transactions sans information client ou produit ont été supprimées :

```sql
Customer ID IS NOT NULL

Product ID IS NOT NULL
```

---

# Utilisation dans le pipeline

Les deux versions du dataset ont des rôles différents :

| Dataset            | Utilisation                                          |
| ------------------ | ---------------------------------------------------- |
| `superstore_raw`   | Audit, contrôle qualité, analyse exploratoire        |
| `superstore_clean` | Analyses SQL finales, Power BI, reporting automatisé |

---

# Intégration avec les autres composants du projet

Le cheminement des données est le suivant :

```
Superstore CSV
      ↓
Python (Pandas)
      ↓
PostgreSQL
      ↓
superstore_raw
      ↓
SQL Cleaning
      ↓
superstore_clean
      ↓
Power BI Dashboard
      ↓
Power Automate Reporting
```

---

#  Objectif du dossier Data

Ce dossier permet de conserver une trace claire des différentes étapes de préparation des données.

La séparation entre données brutes et données nettoyées garantit :

* la traçabilité des transformations ;
* la reproductibilité du pipeline ;
* la fiabilité des analyses réalisées.

