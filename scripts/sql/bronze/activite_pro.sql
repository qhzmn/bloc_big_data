-- 1.4 Activité des professionnels (Séparateur POINT-VIRGULE '\073')
DROP TABLE IF EXISTS brz_activite_pro;
CREATE EXTERNAL TABLE brz_activite_pro (
    identifiant STRING, identifiant_organisation STRING, mode_exercice STRING
) ROW FORMAT DELIMITED FIELDS TERMINATED BY '\073' STORED AS TEXTFILE
LOCATION '/user/cloudera/chu/bronze/dir_BRZ_CSV_activite_professionnel_sante'
TBLPROPERTIES ("skip.header.line.count"="1");