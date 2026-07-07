#  Automatisation Power Automate

## Objectif

Cette partie du projet consiste à automatiser le reporting des performances commerciales à partir des données Power BI.

L’objectif est de créer un processus automatique permettant de récupérer les principaux indicateurs du dashboard et de les envoyer par email sans intervention manuelle.

Cette automatisation transforme le dashboard Power BI en véritable outil de suivi opérationnel.

---

#  Workflow de l’automatisation

Le flux Power Automate suit les étapes suivantes :

```text
Déclencheur automatique (Récurrence)
              ↓
Connexion au dataset Power BI
              ↓
Exécution d'une requête DAX
              ↓
Récupération des indicateurs KPI
              ↓
Création du rapport email automatique
              ↓
Envoi aux utilisateurs
```

---

#  1. Déclenchement automatique

Le flux utilise un déclencheur de type **Récurrence**.

Configuration :

* Exécution automatique selon une fréquence définie
* Possibilité d’adapter la fréquence selon le besoin métier (quotidien, hebdomadaire, mensuel)

Ce déclencheur permet de lancer automatiquement la génération du reporting.

---

#  2. Connexion avec Power BI

Power Automate est connecté au modèle Power BI contenant les données Superstore.

Une requête DAX est exécutée afin de récupérer les principaux indicateurs de performance.

La requête utilisée :

```DAX
EVALUATE
ROW(
"Total Sales", [Total Sales],
"Total Profit", [Total Profit],
"Total Orders", [Total Orders],
"Total Customers", [Total Customers]
)
```

Cette requête permet d’extraire automatiquement les KPI du dashboard.

---

#  3. Indicateurs récupérés

Le rapport automatique contient les indicateurs suivants :

| KPI             | Description              |
| --------------- | ------------------------ |
| Total Sales     | Chiffre d'affaires total |
| Total Profit    | Profit généré            |
| Total Orders    | Nombre de commandes      |
| Total Customers | Nombre de clients        |

---

#  4. Génération du rapport email

Les données récupérées depuis Power BI sont intégrées automatiquement dans un email de synthèse.

Exemple du rapport généré :

```
Superstore Business Performance Report

Total Sales : 2.29M$

Total Profit : 286K$

Total Orders : 5009

Total Customers : 793
```

L’utilisateur reçoit ainsi un résumé des performances sans devoir ouvrir manuellement le dashboard.

---

#  Valeur ajoutée de l'automatisation

Cette automatisation permet de :

* Réduire les tâches manuelles de reporting
* Accélérer le suivi des performances commerciales
* Faciliter la diffusion des informations aux équipes
* Transformer les données Power BI en actions opérationnelles

---

#  Technologies utilisées

* Power Automate
* Power BI
* DAX
* Outlook
* PostgreSQL
* GitHub

---

#  Améliorations possibles

Des automatisations supplémentaires pourraient être ajoutées :

* Création d’alertes en cas de baisse de performance
* Export automatique du dashboard en PDF
* Historisation des KPI dans Excel ou une base de données
* Notifications Teams lors d’événements importants
