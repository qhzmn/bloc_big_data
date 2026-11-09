-- 1.2 Établissements de santé (Séparateur POINT-VIRGULE '\073')
DROP TABLE IF EXISTS brz_etablissement;
CREATE EXTERNAL TABLE brz_etablissement (
    adresse STRING, cedex STRING, code_commune STRING, code_postal STRING, commune STRING,
    complement_destinataire STRING, complement_point_geographique STRING, email STRING,
    enseigne_commerciale_site STRING, finess_etablissement_juridique STRING, finess_site STRING,
    identifiant_organisation STRING, indice_repetition_voie STRING, mention_distribution STRING,
    numero_voie STRING, pays STRING, raison_sociale_site STRING, siren_site STRING,
    siret_site STRING, telecopie STRING, telephone STRING, telephone_2 STRING,
    type_voie STRING, voie STRING
) ROW FORMAT DELIMITED FIELDS TERMINATED BY '\073' STORED AS TEXTFILE
LOCATION '/user/cloudera/chu/bronze/dir_BRZ_CSV_etablissement_sante'
TBLPROPERTIES ("skip.header.line.count"="1");