# Data-Analytics-Automation-Pipeline

# 📊 Data Analytics & Automation Pipeline

## 📌 Présentation du projet

Ce projet présente un pipeline complet d’analyse de données, allant de la préparation des données jusqu’à l’automatisation du reporting.

L’objectif est de transformer des données commerciales brutes en informations exploitables grâce à une combinaison d’outils d’analyse, de visualisation et d’automatisation.

Le projet couvre les différentes étapes d’un processus Data Analyst / Business Intelligence :

**Collecte et préparation des données → Analyse SQL → Création d’un dashboard Power BI → Automatisation du reporting avec Power Automate**

---

# 🛠️ Technologies utilisées

* **SQL** : nettoyage, transformation et analyse des données
* **Power BI** : création du modèle de données, mesures DAX et visualisations
* **DAX** : création des indicateurs clés de performance (KPI)
* **Power Automate** : automatisation de l’envoi de rapports
* **Excel / CSV** : source des données
* **GitHub** : documentation et gestion du projet

---

# 📂 Structure du projet

```
Data-Analytics-Automation-Pipeline/

│
├── Data/
│   └── Données sources utilisées pour l'analyse
│
├── SQL/
│   ├── Nettoyage des données
│   ├── Requêtes d'analyse
│   └── Documentation SQL
│
├── PowerBI/
│   ├── Dashboard Power BI
│   ├── Mesures DAX
│   └── Captures d'écran
│
├── PowerAutomate/
│   ├── Automatisation du reporting
│   └── Documentation du workflow
│
└── Documentation/
    └── Insights et conclusions business
```

---

# 📊 Jeu de données

Le projet utilise le dataset **Superstore Sales** contenant des informations commerciales :

* Commandes
* Clients
* Produits
* Ventes
* Profits
* Segments clients
* Régions

Ces données permettent d’analyser la performance commerciale et d’identifier des opportunités d’amélioration.

---

# 🧹 Analyse SQL

La partie SQL permet de préparer et analyser les données avant la visualisation.

Les principales analyses réalisées sont :

* Nettoyage et vérification des données
* Calcul du chiffre d’affaires total
* Analyse du profit
* Analyse des clients
* Analyse des segments commerciaux
* Identification des produits les plus et moins rentables

Exemples d’indicateurs calculés :

* Total Sales
* Total Profit
* Profit Margin
* Nombre de commandes
* Nombre de clients

---

# 📈 Dashboard Power BI

Un dashboard interactif a été créé afin de suivre les performances commerciales.

Les analyses comprennent notamment :

## Vue globale

* Chiffre d’affaires total
* Profit total
* Nombre de commandes
* Nombre de clients
* Marge bénéficiaire

## Analyse clients

* Répartition des segments clients
* Clients les plus rentables
* Comparaison ventes vs profit

## Analyse produits

* Produits générant le plus de profit
* Produits les moins rentables

---

# ⚙️ Automatisation Power Automate

Une automatisation a été développée afin de générer automatiquement un reporting basé sur les données Power BI.

## Workflow :

```
Déclencheur automatique
        ↓
Connexion au dataset Power BI
        ↓
Exécution d'une requête DAX
        ↓
Extraction des KPI
        ↓
Envoi automatique d'un email de synthèse
```

Le rapport automatique contient :

* Total Sales
* Total Profit
* Total Orders
* Total Customers

Cette automatisation permet de transformer un dashboard analytique en véritable outil de suivi opérationnel.

---

# 💡 Insights business

L’analyse permet notamment d’identifier :

* Les segments clients les plus performants
* Les produits les plus rentables
* Les produits réduisant la rentabilité globale
* Les tendances de ventes et de profits

Ces informations peuvent aider à améliorer la prise de décision commerciale.

---

# 🎯 Objectifs du projet

Ce projet a permis de développer des compétences en :

* Analyse de données
* SQL
* Business Intelligence
* Création de dashboards
* Automatisation de processus
* Communication d’insights

---

# 👩‍💻 Auteur

**Emma Carillo**
