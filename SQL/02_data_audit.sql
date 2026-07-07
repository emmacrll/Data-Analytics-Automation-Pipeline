-- =====================================================
-- 02 - Audit de qualité des données
-- Objectif : identifier les valeurs manquantes,
-- anomalies et incohérences
-- =====================================================


-- Vérification des valeurs manquantes
SELECT 
  COUNT(*) FILTER (WHERE "Customer Name" IS NULL) AS missing_customer,
  COUNT(*) FILTER (WHERE "Product Name" IS NULL) AS missing_product,
  COUNT(*) FILTER (WHERE "Sales" IS NULL) AS missing_sales,
  COUNT(*) FILTER (WHERE "Profit" IS NULL) AS missing_profit
FROM superstore_raw;


-- Détection des quantités incorrectes
SELECT COUNT(*)
FROM superstore_raw
WHERE "Quantity" <= 0;


-- Détection des ventes incorrectes
SELECT COUNT(*)
FROM superstore_raw
WHERE "Sales" <= 0;


-- Identification des ventes en perte
SELECT COUNT(*)
FROM superstore_raw
WHERE "Profit" < 0;


-- Recherche de doublons métier
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


-- Nombre de commandes uniques
SELECT COUNT(DISTINCT "Order ID")
FROM superstore_raw;


-- Nombre de clients uniques
SELECT COUNT(DISTINCT "Customer ID")
FROM superstore_raw;


-- Statistiques ventes
SELECT 
  MIN("Sales") AS min_sales,
  MAX("Sales") AS max_sales,
  AVG("Sales") AS avg_sales
FROM superstore_raw;


-- Statistiques profits
SELECT 
  MIN("Profit") AS min_profit,
  MAX("Profit") AS max_profit,
  AVG("Profit") AS avg_profit
FROM superstore_raw;
