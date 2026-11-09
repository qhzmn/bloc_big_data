-- 2.4 Silver Professionnel
DROP TABLE IF EXISTS slv_professionnel;
CREATE TABLE slv_professionnel
STORED AS PARQUET AS
SELECT DISTINCT 
    p.identifiant AS code_pro_source,
    reflect('org.apache.commons.codec.digest.DigestUtils', 'sha256Hex',
            concat(trim(p.identifiant), '_SEL_CHU_2026')) AS hash_id_pro,
    nvl(
        CASE WHEN trim(p.specialite) = '' THEN NULL ELSE trim(p.specialite) END,
        'Medecine Generale'
    ) AS specialite,
    nvl(
        CASE WHEN trim(p.profession) = '' THEN NULL ELSE trim(p.profession) END,
        trim(p.categorie_professionnelle)
    ) AS fonction,
    lpad(trim(a.identifiant_organisation), 9, '0') AS code_finess
FROM chu_bronze.brz_professionnel p
LEFT JOIN chu_bronze.brz_activite_pro a ON trim(p.identifiant) = trim(a.identifiant)
WHERE p.identifiant IS NOT NULL;