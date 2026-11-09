-- 3.9 FAIT_SATISFACTION
DROP TABLE IF EXISTS fait_satisfaction;
CREATE TABLE fait_satisfaction
STORED AS PARQUET AS
SELECT 
    CAST(ROW_NUMBER() OVER (ORDER BY s.code_finess, s.id_temps) AS BIGINT) AS id_fait_satisfaction,
    CAST(s.id_temps AS INT) AS id_temps,
    nvl(e.id_etablissement, -1) AS id_etablissement,
    nvl(l.id_localisation, -1) AS id_localisation,
    CAST(s.note_satisfaction AS DECIMAL(5,2)) AS note_satisfaction,
    CAST(s.nb_repondants AS INT) AS nb_repondants
FROM chu_silver.slv_satisfaction s
LEFT JOIN dim_etablissement e ON s.code_finess = e.code_finess
LEFT JOIN dim_localisation_insee l ON e.code_insee_commune = l.code_insee_commune
WHERE s.note_satisfaction IS NOT NULL;