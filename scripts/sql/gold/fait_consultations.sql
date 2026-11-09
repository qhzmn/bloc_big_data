-- 3.7 FAIT_CONSULTATIONS
DROP TABLE IF EXISTS fait_consultations;
CREATE TABLE fait_consultations
STORED AS PARQUET AS
SELECT 
    CAST(c.num_consultation AS BIGINT) AS id_fait_consultation,
    CAST(regexp_replace(substr(trim(c.date_consultation), 1, 10), '-', '') AS INT) AS id_temps,
    nvl(e.id_etablissement, -1) AS id_etablissement,
    nvl(l.id_localisation, -1) AS id_localisation,
    CAST(c.id_patient AS INT) AS id_patient,
    nvl(d.id_diagnostic, -1) AS id_diagnostic,
    nvl(pr.id_professionnel, -1) AS id_professionnel,
    1 AS nb_consultations,
    CAST(30.00 AS DECIMAL(6,2)) AS duree_consultation_min
FROM chu_bronze.brz_pg_consultation c
LEFT JOIN dim_diagnostic d ON trim(c.code_diag) = d.code_diagnostic
LEFT JOIN chu_silver.slv_professionnel sp ON trim(c.id_prof_sante) = sp.code_pro_source
LEFT JOIN dim_professionnel pr ON sp.hash_id_pro = pr.hash_id_pro
LEFT JOIN dim_etablissement e ON sp.code_finess = e.code_finess
LEFT JOIN dim_localisation_insee l ON e.code_insee_commune = l.code_insee_commune;