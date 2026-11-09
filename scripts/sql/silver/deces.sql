-- 2.3 Silver Décès INSEE
DROP TABLE IF EXISTS slv_deces;
CREATE TABLE slv_deces
STORED AS PARQUET AS
SELECT 
    reflect('org.apache.commons.codec.digest.DigestUtils', 'sha256Hex',
            concat(nvl(nom, ''), '_', nvl(prenom, ''), '_', nvl(date_naissance, ''), '_SEL_CHU_2026')) AS hash_patient_rgpd,
    CAST(CASE WHEN trim(sexe) = '1' THEN 'M' WHEN trim(sexe) = '2' THEN 'F' ELSE 'I' END AS CHAR(1)) AS sexe,
    CAST(substr(trim(date_naissance), 1, 4) AS SMALLINT) AS annee_naissance,
    CAST(regexp_replace(substr(trim(date_deces), 1, 10), '-', '') AS INT) AS id_temps_deces,
    CAST(substr(trim(date_deces), 1, 4) AS SMALLINT) AS annee_deces,
    CAST(CAST(substr(trim(date_deces), 1, 4) AS INT) - CAST(substr(trim(date_naissance), 1, 4) AS INT) AS SMALLINT) AS age_deces,
    lpad(trim(code_lieu_deces), 5, '0') AS code_insee_commune,
    1 AS nb_deces
FROM chu_bronze.brz_deces
WHERE date_deces IS NOT NULL;