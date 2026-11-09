-- 2.2 Silver Patient
DROP TABLE IF EXISTS slv_patient;
CREATE TABLE slv_patient
STORED AS PARQUET AS
SELECT DISTINCT 
    id_patient,
    reflect('org.apache.commons.codec.digest.DigestUtils', 'sha256Hex',
            concat(CAST(id_patient AS STRING), '_SEL_CHU_2026')) AS hash_patient_rgpd,
    CAST(CASE WHEN upper(trim(sexe)) IN ('1', 'H', 'M') THEN 'M'
              WHEN upper(trim(sexe)) IN ('2', 'F') THEN 'F'
              ELSE 'I' END AS CHAR(1)) AS sexe,
    CAST(substr(trim(date_naissance), 1, 4) AS SMALLINT) AS annee_naissance,
    CAST(2026 - CAST(substr(trim(date_naissance), 1, 4) AS INT) AS SMALLINT) AS age_calcule,
    CASE 
        WHEN (2026 - CAST(substr(trim(date_naissance), 1, 4) AS INT)) < 18 THEN '0-17'
        WHEN (2026 - CAST(substr(trim(date_naissance), 1, 4) AS INT)) < 30 THEN '18-29'
        WHEN (2026 - CAST(substr(trim(date_naissance), 1, 4) AS INT)) < 45 THEN '30-44'
        WHEN (2026 - CAST(substr(trim(date_naissance), 1, 4) AS INT)) < 60 THEN '45-59'
        WHEN (2026 - CAST(substr(trim(date_naissance), 1, 4) AS INT)) < 75 THEN '60-74'
        ELSE '75+'
    END AS tranche_age
FROM chu_bronze.brz_pg_patient
WHERE id_patient IS NOT NULL;