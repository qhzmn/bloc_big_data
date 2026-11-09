-- 3.8 FAIT_HOSPITALISATIONS
DROP TABLE IF EXISTS fait_hospitalisations;
CREATE TABLE fait_hospitalisations
STORED AS PARQUET AS
SELECT 
    CAST(h.num_hospitalisation AS BIGINT) AS id_fait_hospitalisation,
    CAST(regexp_replace(substr(trim(h.date_entree), 1, 10), '-', '') AS INT) AS id_temps_entree,
    nvl(e.id_etablissement, -1) AS id_etablissement,
    nvl(l.id_localisation, -1) AS id_localisation,
    CAST(h.id_patient AS INT) AS id_patient,
    nvl(d.id_diagnostic, -1) AS id_diagnostic,
    -1 AS id_professionnel,
    1 AS nb_hospitalisations,
    CAST(nvl(h.jour_hospitalisation, 1) AS INT) AS duree_sejour_jours
FROM chu_bronze.brz_hospitalisations h
LEFT JOIN dim_etablissement e ON lpad(trim(h.identifiant_organisation), 9, '0') = e.code_finess
LEFT JOIN dim_localisation_insee l ON e.code_insee_commune = l.code_insee_commune
LEFT JOIN dim_diagnostic d ON trim(h.code_diagnostic) = d.code_diagnostic;