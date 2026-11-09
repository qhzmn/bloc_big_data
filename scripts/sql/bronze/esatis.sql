-- 1.6 Satisfaction (Séparateur POINT-VIRGULE '\073')
DROP TABLE IF EXISTS brz_esatis_2017;
CREATE EXTERNAL TABLE brz_esatis_2017 (
    finess STRING, rs_finess STRING, finess_geo STRING, rs_finess_geo STRING,
    region STRING, participation STRING, depot STRING,
    nb_rep_score_all_rea_ajust INT, score_all_rea_ajust STRING
) ROW FORMAT DELIMITED FIELDS TERMINATED BY '\073' STORED AS TEXTFILE
LOCATION '/user/cloudera/chu/bronze/dir_BRZ_CSV_ESATIS48H_MCO_recueil2017_donnees'
TBLPROPERTIES ("skip.header.line.count"="1");


DROP TABLE IF EXISTS brz_esatis_2019;
CREATE EXTERNAL TABLE brz_esatis_2019 (
    finess STRING, rs_finess STRING, finess_geo STRING, rs_finess_geo STRING,
    region STRING, participation STRING, depot STRING,
    nb_rep_score_all_rea_ajust INT, score_all_rea_ajust STRING
) ROW FORMAT DELIMITED FIELDS TERMINATED BY '\073' STORED AS TEXTFILE
LOCATION '/user/cloudera/chu/bronze/dir_BRZ_CSV_resultats-esatis48h-mco-open-data-2019'
TBLPROPERTIES ("skip.header.line.count"="1");


DROP TABLE IF EXISTS brz_esatisca_2019;
CREATE EXTERNAL TABLE brz_esatisca_2019 (
    finess STRING, rs_finess STRING, finess_geo STRING, rs_finess_geo STRING,
    region STRING, participation STRING, depot STRING,
    nb_rep_score_all_ajust INT, score_all_ajust STRING
) ROW FORMAT DELIMITED FIELDS TERMINATED BY '\073' STORED AS TEXTFILE
LOCATION '/user/cloudera/chu/bronze/dir_BRZ_CSV_resultats-esatisca-mco-open-data-2019'
TBLPROPERTIES ("skip.header.line.count"="1");

