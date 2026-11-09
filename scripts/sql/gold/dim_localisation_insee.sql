-- 3.2 DIM_LOCALISATION_INSEE
DROP TABLE IF EXISTS dim_localisation_insee;
CREATE TABLE dim_localisation_insee
STORED AS PARQUET AS
SELECT 
    CAST(ROW_NUMBER() OVER (ORDER BY code_insee_commune) AS INT) AS id_localisation,
    CAST(code_insee_commune AS VARCHAR(10)) AS code_insee_commune,
    CAST(code_postal AS VARCHAR(10)) AS code_postal,
    CAST(nom_commune AS VARCHAR(100)) AS nom_commune,
    CAST(code_departement AS VARCHAR(5)) AS code_departement,
    CAST(concat('Departement ', code_departement) AS VARCHAR(100)) AS nom_departement,
    CAST(substr(nom_region, 1, 4) AS VARCHAR(5)) AS code_region,
    CAST(nom_region AS VARCHAR(100)) AS nom_region
FROM (
    SELECT DISTINCT code_insee_commune, code_postal, nom_commune, code_departement, nom_region
    FROM chu_silver.slv_etablissement
) t;