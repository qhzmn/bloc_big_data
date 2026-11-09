-- 1.3 Professionnels de santé (Séparateur POINT-VIRGULE '\073')
DROP TABLE IF EXISTS brz_professionnel;
CREATE EXTERNAL TABLE brz_professionnel (
    identifiant STRING, civilite STRING, categorie_professionnelle STRING,
    nom STRING, prenom STRING, commune STRING, profession STRING,
    specialite STRING, type_identifiant STRING
) ROW FORMAT DELIMITED FIELDS TERMINATED BY '\073' STORED AS TEXTFILE
LOCATION '/user/cloudera/chu/bronze/dir_BRZ_CSV_professionnel_sante'
TBLPROPERTIES ("skip.header.line.count"="1");