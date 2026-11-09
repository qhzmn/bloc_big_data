-- 3.3 DIM_ETABLISSEMENT
DROP TABLE IF EXISTS dim_etablissement;
CREATE TABLE dim_etablissement
STORED AS PARQUET AS
SELECT 
    CAST(ROW_NUMBER() OVER (ORDER BY code_finess) AS INT) AS id_etablissement,
    CAST(code_finess AS VARCHAR(20)) AS code_finess,
    CAST(nom_etablissement AS VARCHAR(200)) AS nom_etablissement,
    CAST(type_etablissement AS VARCHAR(100)) AS type_etablissement,
    CAST(capacite_lits AS INT) AS capacite_lits,
    CAST(niveau_certification AS VARCHAR(50)) AS niveau_certification,
    CAST(code_insee_commune AS VARCHAR(10)) AS code_insee_commune,
    CAST(nom_region AS VARCHAR(100)) AS nom_region
FROM chu_silver.slv_etablissement;