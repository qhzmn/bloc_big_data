-- 1.7 Tables issues de PostgreSQL (Source 1 exportée par Talend dans Bronze)
DROP TABLE IF EXISTS brz_pg_patient;
CREATE EXTERNAL TABLE brz_pg_patient (
    id_patient INT, nom STRING, prenom STRING, date_naissance STRING,
    sexe STRING, adresse STRING, code_postal STRING, ville STRING
) ROW FORMAT DELIMITED FIELDS TERMINATED BY '\073' STORED AS TEXTFILE
LOCATION '/user/cloudera/chu/bronze/dir_BRONZE_PG_Patient'
TBLPROPERTIES ("skip.header.line.count"="1");

DROP TABLE IF EXISTS brz_pg_diagnostic;
CREATE EXTERNAL TABLE brz_pg_diagnostic (
    code_diag STRING, diagnostic STRING
) ROW FORMAT DELIMITED FIELDS TERMINATED BY '\073' STORED AS TEXTFILE
LOCATION '/user/cloudera/chu/bronze/dir_BRONZE_PG_Diagnostic'
TBLPROPERTIES ("skip.header.line.count"="1");

DROP TABLE IF EXISTS brz_pg_consultation;
CREATE EXTERNAL TABLE brz_pg_consultation (
    num_consultation BIGINT, id_mut INT, id_patient INT, id_prof_sante STRING,
    code_diag STRING, motif STRING, date_consultation STRING, heure_debut STRING, heure_fin STRING
) ROW FORMAT DELIMITED FIELDS TERMINATED BY '\073' STORED AS TEXTFILE
LOCATION '/user/cloudera/chu/bronze/dir_BRONZE_PG_Consultation'
TBLPROPERTIES ("skip.header.line.count"="1");