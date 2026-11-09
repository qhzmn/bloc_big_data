-- 3.6 DIM_PROFESSIONNEL
DROP TABLE IF EXISTS dim_professionnel;
CREATE TABLE dim_professionnel
STORED AS PARQUET AS
SELECT 
    CAST(ROW_NUMBER() OVER (ORDER BY hash_id_pro) AS INT) AS id_professionnel,
    CAST(hash_id_pro AS VARCHAR(64)) AS hash_id_pro,
    CAST(specialite AS VARCHAR(100)) AS specialite,
    CAST(fonction AS VARCHAR(100)) AS fonction
FROM (
    SELECT DISTINCT hash_id_pro, specialite, fonction FROM chu_silver.slv_professionnel
) p;