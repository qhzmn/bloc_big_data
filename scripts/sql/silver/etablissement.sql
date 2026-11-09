-- 2.1 Silver Localisation & Établissements
DROP TABLE IF EXISTS slv_etablissement;
CREATE TABLE slv_etablissement
STORED AS PARQUET AS
SELECT DISTINCT 
    lpad(trim(identifiant_organisation), 9, '0') AS code_finess,
    coalesce(
        CASE WHEN trim(raison_sociale_site) = '' THEN NULL ELSE trim(raison_sociale_site) END,
        CASE WHEN trim(enseigne_commerciale_site) = '' THEN NULL ELSE trim(enseigne_commerciale_site) END,
        'Etablissement CHU'
    ) AS nom_etablissement,
    nvl(
        CASE WHEN trim(type_voie) = '' THEN NULL ELSE trim(type_voie) END,
        'Hospitalier'
    ) AS type_etablissement,
    100 AS capacite_lits,
    'Certifie HAS' AS niveau_certification,
    lpad(regexp_replace(trim(code_commune), '\\.0$', ''), 5, '0') AS code_insee_commune,
    lpad(regexp_replace(trim(code_postal), '\\.0$', ''), 5, '0') AS code_postal,
    nvl(trim(commune), 'Inconnue') AS nom_commune,
    substr(lpad(regexp_replace(trim(code_postal), '\\.0$', ''), 5, '0'), 1, 2) AS code_departement,
    CASE 
        WHEN substr(lpad(regexp_replace(trim(code_postal), '\\.0$', ''), 5, '0'), 1, 2) IN ('01','03','07','15','26','38','42','43','63','69','73','74') THEN 'Auvergne-Rhone-Alpes'
        WHEN substr(lpad(regexp_replace(trim(code_postal), '\\.0$', ''), 5, '0'), 1, 2) IN ('21','25','39','58','70','71','89','90') THEN 'Bourgogne-Franche-Comte'
        WHEN substr(lpad(regexp_replace(trim(code_postal), '\\.0$', ''), 5, '0'), 1, 2) IN ('22','29','35','56') THEN 'Bretagne'
        WHEN substr(lpad(regexp_replace(trim(code_postal), '\\.0$', ''), 5, '0'), 1, 2) IN ('18','28','36','37','41','45') THEN 'Centre-Val de Loire'
        WHEN substr(lpad(regexp_replace(trim(code_postal), '\\.0$', ''), 5, '0'), 1, 2) IN ('20','2A','2B') THEN 'Corse'
        WHEN substr(lpad(regexp_replace(trim(code_postal), '\\.0$', ''), 5, '0'), 1, 2) IN ('08','10','51','52','54','55','57','67','68','88') THEN 'Grand Est'
        WHEN substr(lpad(regexp_replace(trim(code_postal), '\\.0$', ''), 5, '0'), 1, 2) IN ('02','59','60','62','80') THEN 'Hauts-de-France'
        WHEN substr(lpad(regexp_replace(trim(code_postal), '\\.0$', ''), 5, '0'), 1, 2) IN ('75','77','78','91','92','93','94','95') THEN 'Ile-de-France'
        WHEN substr(lpad(regexp_replace(trim(code_postal), '\\.0$', ''), 5, '0'), 1, 2) IN ('14','27','50','61','76') THEN 'Normandie'
        WHEN substr(lpad(regexp_replace(trim(code_postal), '\\.0$', ''), 5, '0'), 1, 2) IN ('16','17','19','23','24','33','40','47','64','79','86','87') THEN 'Nouvelle-Aquitaine'
        WHEN substr(lpad(regexp_replace(trim(code_postal), '\\.0$', ''), 5, '0'), 1, 2) IN ('09','11','12','30','31','32','34','46','48','65','66','81','82') THEN 'Occitanie'
        WHEN substr(lpad(regexp_replace(trim(code_postal), '\\.0$', ''), 5, '0'), 1, 2) IN ('44','49','53','72','85') THEN 'Pays de la Loire'
        WHEN substr(lpad(regexp_replace(trim(code_postal), '\\.0$', ''), 5, '0'), 1, 2) IN ('04','05','06','13','83','84') THEN 'Provence-Alpes-Cote d Azur'
        WHEN substr(lpad(regexp_replace(trim(code_postal), '\\.0$', ''), 5, '0'), 1, 2) = '97' THEN 'Outre-Mer'
        ELSE 'Autre / France'
    END AS nom_region
FROM chu_bronze.brz_etablissement
WHERE identifiant_organisation IS NOT NULL;