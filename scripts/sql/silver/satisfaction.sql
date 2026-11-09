-- 2.5 Silver Satisfaction
DROP TABLE IF EXISTS slv_satisfaction;
CREATE TABLE slv_satisfaction
STORED AS PARQUET AS
SELECT 
    lpad(trim(finess), 9, '0') AS code_finess,
    trim(region) AS nom_region,
    20170101 AS id_temps,
    CAST(regexp_replace(score_all_rea_ajust, ',', '.') AS DECIMAL(5,2)) AS note_satisfaction,
    nvl(nb_rep_score_all_rea_ajust, 1) AS nb_repondants
FROM chu_bronze.brz_esatis_2017
WHERE score_all_rea_ajust IS NOT NULL
UNION ALL
SELECT 
    lpad(trim(finess), 9, '0') AS code_finess,
    trim(region) AS nom_region,
    20190101 AS id_temps,
    CAST(regexp_replace(score_all_rea_ajust, ',', '.') AS DECIMAL(5,2)) AS note_satisfaction,
    nvl(nb_rep_score_all_rea_ajust, 1) AS nb_repondants
FROM chu_bronze.brz_esatis_2019
WHERE score_all_rea_ajust IS NOT NULL
UNION ALL
SELECT 
    lpad(trim(finess), 9, '0') AS code_finess,
    trim(region) AS nom_region,
    20190101 AS id_temps,
    CAST(regexp_replace(score_all_ajust, ',', '.') AS DECIMAL(5,2)) AS note_satisfaction,
    nvl(nb_rep_score_all_ajust, 1) AS nb_repondants
FROM chu_bronze.brz_esatisca_2019
WHERE score_all_ajust IS NOT NULL;