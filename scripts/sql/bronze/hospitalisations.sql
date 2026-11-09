-- 1.5 Hospitalisations (Séparateur POINT-VIRGULE '\073')
DROP TABLE IF EXISTS brz_hospitalisations;
CREATE EXTERNAL TABLE brz_hospitalisations (
    num_hospitalisation BIGINT, id_patient INT, identifiant_organisation STRING,
    code_diagnostic STRING, suite_diagnostic_consultation STRING,
    date_entree STRING, jour_hospitalisation INT
) ROW FORMAT DELIMITED FIELDS TERMINATED BY '\073' STORED AS TEXTFILE
LOCATION '/user/cloudera/chu/bronze/dir_BRZ_CSV_Hospitalisations'
TBLPROPERTIES ("skip.header.line.count"="1");