-- =============================================================================
-- PIPELINE ELT : BRONZE (CSV) -> SILVER (PARQUET) -> GOLD (PARQUET)
-- =============================================================================

CREATE DATABASE IF NOT EXISTS chu_bronze LOCATION '/user/cloudera/chu/bronze_db';
CREATE DATABASE IF NOT EXISTS chu_silver LOCATION '/user/cloudera/chu/silver_db';
CREATE DATABASE IF NOT EXISTS chu_gold   LOCATION '/user/hive/warehouse/chu_gold.db';

-- Paramètres d'Hive et Parquet
SET hive.exec.dynamic.partition = true;
SET hive.exec.dynamic.partition.mode = nonstrict;
SET hive.exec.max.dynamic.partitions = 5000;
SET hive.exec.max.dynamic.partitions.pernode = 5000;
SET hive.optimize.sort.dynamic.partition = true;
SET hive.conf.validation = false;
SET hive.enforce.bucketing = true;


-- =============================================================================
-- 1. COUCHE BRONZE : DÉCLARATION DES TABLES EXTERNES SUR LES FICHIERS BRUTS
-- =============================================================================

USE chu_bronze;

-- Execution des commandes 1.1 à 1.7

-- =============================================================================
-- 2. PASSAGE BRONZE -> SILVER (STOCKAGE EN FORMAT .PARQUET + ANONYMISATION SHA-256)
-- =============================================================================

USE chu_silver;

-- Execution des commandes 2.1 à 2.5

-- =============================================================================
-- 3. PASSAGE SILVER -> GOLD (MODÈLE EN ÉTOILE EXACT DU LIVRABLE 1 EN .PARQUET)
-- =============================================================================

USE chu_gold;

-- Execution des commandes 3.1 à 3.10
