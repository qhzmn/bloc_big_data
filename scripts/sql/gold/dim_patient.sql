-- 3.4 DIM_PATIENT
DROP TABLE IF EXISTS dim_patient;
CREATE TABLE dim_patient
STORED AS PARQUET AS
SELECT 
    CAST(id_patient AS INT) AS id_patient,
    CAST(hash_patient_rgpd AS VARCHAR(64)) AS hash_patient_rgpd,
    CAST(sexe AS CHAR(1)) AS sexe,
    CAST(annee_naissance AS SMALLINT) AS annee_naissance,
    CAST(age_calcule AS SMALLINT) AS age_calcule,
    CAST(tranche_age AS VARCHAR(20)) AS tranche_age
FROM chu_silver.slv_patient;