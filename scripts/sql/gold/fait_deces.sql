-- 3.10 FAIT_DECES
DROP TABLE IF EXISTS fait_deces;
CREATE TABLE fait_deces
STORED AS PARQUET AS
SELECT 
    CAST(ROW_NUMBER() OVER (ORDER BY dc.id_temps_deces) AS BIGINT) AS id_fait_deces,
    CAST(dc.id_temps_deces AS INT) AS id_temps_deces,
    nvl(l.id_localisation, -1) AS id_localisation,
    -1 AS id_patient,
    1 AS nb_deces,
    CAST(dc.age_deces AS SMALLINT) AS age_deces
FROM chu_silver.slv_deces dc
LEFT JOIN dim_localisation_insee l ON dc.code_insee_commune = l.code_insee_commune;