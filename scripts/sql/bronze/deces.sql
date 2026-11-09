-- 1.1 Décès INSEE (Séparateur VIRGULE ',')
DROP TABLE IF EXISTS brz_deces;
CREATE EXTERNAL TABLE brz_deces (
    nom STRING, prenom STRING, sexe STRING, date_naissance STRING,
    code_lieu_naissance STRING, lieu_naissance STRING, pays_naissance STRING,
    date_deces STRING, code_lieu_deces STRING, numero_acte_deces STRING
) ROW FORMAT DELIMITED FIELDS TERMINATED BY ',' STORED AS TEXTFILE
LOCATION '/user/cloudera/chu/bronze/dir_BRZ_CSV_deces'
TBLPROPERTIES ("skip.header.line.count"="1");