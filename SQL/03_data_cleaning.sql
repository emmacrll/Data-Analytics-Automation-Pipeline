-- =====================================================
-- 03 - Nettoyage des données
-- Objectif : créer une table propre pour l'analyse
-- =====================================================


-- Création de la table nettoyée

CREATE TABLE superstore_clean AS

SELECT DISTINCT *

FROM superstore_raw

WHERE "Sales" > 0
AND "Quantity" > 0
AND "Customer ID" IS NOT NULL
AND "Product ID" IS NOT NULL;



-- Vérification du nombre de lignes après nettoyage

SELECT COUNT(*) 
FROM superstore_clean;



-- Vérification des transactions en perte

SELECT 
  COUNT(*) FILTER (WHERE "Profit" < 0) AS loss_orders,
  COUNT(*) AS total_rows

FROM superstore_clean;
