: 1. Création de l'arborescence complète Bronze / Silver / Gold dans HDFS

hdfs dfs -mkdir -p /user/cloudera/chu/bronze
hdfs dfs -mkdir -p /user/cloudera/chu/silver
hdfs dfs -mkdir -p /user/cloudera/chu/gold/dim_temps
hdfs dfs -mkdir -p /user/cloudera/chu/gold/dim_localisation_insee
hdfs dfs -mkdir -p /user/cloudera/chu/gold/dim_etablissement
hdfs dfs -mkdir -p /user/cloudera/chu/gold/dim_patient
hdfs dfs -mkdir -p /user/cloudera/chu/gold/dim_diagnostic
hdfs dfs -mkdir -p /user/cloudera/chu/gold/dim_professionnel
hdfs dfs -mkdir -p /user/cloudera/chu/gold/fait_consultations
hdfs dfs -mkdir -p /user/cloudera/chu/gold/fait_hospitalisations
hdfs dfs -mkdir -p /user/cloudera/chu/gold/fait_satisfaction
hdfs dfs -mkdir -p /user/cloudera/chu/gold/fait_deces
hdfs dfs -chmod -R 777 /user/cloudera/chu
hdfs dfs -chmod -R 777 /user/hive/warehouse
 

: 2. Envoi de la couche BRONZE dans HDFS

hdfs dfs -moveFromLocal /home/cloudera/LAKEHOUSE_CHU/1_BRONZE_BRUT/* /user/cloudera/chu/bronze/
 
: 3. Envoi de la couche SILVER dans HDFS

hdfs dfs -moveFromLocal /home/cloudera/LAKEHOUSE_CHU/2_SILVER_PROPRE/* /user/cloudera/chu/silver/
 

: 4. Envoi de la couche GOLD dans chaque dossier de table HDFS

hdfs dfs -moveFromLocal /home/cloudera/LAKEHOUSE_CHU/3_GOLD_ETOILE/DIM_TEMPS.csv /user/cloudera/chu/gold/dim_temps/
hdfs dfs -moveFromLocal /home/cloudera/LAKEHOUSE_CHU/3_GOLD_ETOILE/DIM_LOCALISATION_INSEE.csv /user/cloudera/chu/gold/dim_localisation_insee/
hdfs dfs -moveFromLocal /home/cloudera/LAKEHOUSE_CHU/3_GOLD_ETOILE/DIM_ETABLISSEMENT.csv /user/cloudera/chu/gold/dim_etablissement/
hdfs dfs -moveFromLocal /home/cloudera/LAKEHOUSE_CHU/3_GOLD_ETOILE/DIM_PATIENT.csv /user/cloudera/chu/gold/dim_patient/
hdfs dfs -moveFromLocal /home/cloudera/LAKEHOUSE_CHU/3_GOLD_ETOILE/DIM_DIAGNOSTIC.csv /user/cloudera/chu/gold/dim_diagnostic/
hdfs dfs -moveFromLocal /home/cloudera/LAKEHOUSE_CHU/3_GOLD_ETOILE/DIM_PROFESSIONNEL.csv /user/cloudera/chu/gold/dim_professionnel/
hdfs dfs -moveFromLocal /home/cloudera/LAKEHOUSE_CHU/3_GOLD_ETOILE/FAIT_CONSULTATIONS.csv /user/cloudera/chu/gold/fait_consultations/
hdfs dfs -moveFromLocal /home/cloudera/LAKEHOUSE_CHU/3_GOLD_ETOILE/FAIT_HOSPITALISATIONS.csv /user/cloudera/chu/gold/fait_hospitalisations/
hdfs dfs -moveFromLocal /home/cloudera/LAKEHOUSE_CHU/3_GOLD_ETOILE/FAIT_SATISFACTION.csv /user/cloudera/chu/gold/fait_satisfaction/
hdfs dfs -moveFromLocal /home/cloudera/LAKEHOUSE_CHU/3_GOLD_ETOILE/FAIT_DECES.csv /user/cloudera/chu/gold/fait_deces/
 

: 5. Vérification que tout est bien dans HDFS
hdfs dfs -ls /user/cloudera/chu/bronze
hdfs dfs -ls /user/cloudera/chu/silver
hdfs dfs -ls /user/cloudera/chu/gold