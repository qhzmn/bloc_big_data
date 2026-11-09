-- 3.5 DIM_DIAGNOSTIC
DROP TABLE IF EXISTS dim_diagnostic;
CREATE TABLE dim_diagnostic
STORED AS PARQUET AS
SELECT 
    CAST(ROW_NUMBER() OVER (ORDER BY code_diag) AS INT) AS id_diagnostic,
    CAST(code_diag AS VARCHAR(20)) AS code_diagnostic,
    CAST(diagnostic AS VARCHAR(255)) AS libelle_diagnostic,
    CAST(substr(code_diag, 1, 3) AS VARCHAR(100)) AS categorie_pathologie
FROM (
    SELECT DISTINCT code_diag, diagnostic FROM chu_bronze.brz_pg_diagnostic WHERE code_diag IS NOT NULL
) d;