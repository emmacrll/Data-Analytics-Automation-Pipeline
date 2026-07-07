-- =====================================================
-- 01 - Exploration de la base de données
-- Dataset : Superstore
-- Objectif : comprendre la structure des données
-- =====================================================


-- Liste des tables disponibles
SELECT table_name
FROM information_schema.tables
WHERE table_schema = 'public';


-- Vérification du nombre de lignes
SELECT COUNT(*) 
FROM superstore_raw;


-- Aperçu des premières lignes
SELECT *
FROM superstore_raw
LIMIT 10;


-- Vérification des colonnes et types de données
SELECT column_name, data_type
FROM information_schema.columns
WHERE table_name = 'superstore_raw';
