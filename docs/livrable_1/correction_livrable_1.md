# Correction Livrable 1

## 1. Hiérarchie du datalake

## Commentaires

1. Hiérarchie du datalake
   - Arborescence du Datalake : Il manque l'arborescence physique du datalake (même si une architecture en 3 couches est présente). Il faut donc bien justifier et détailler la hiérarchie des répertoires pour les chargements dans Hive.
   - Fréquence d'alimentation : Pour certains traitements (comme les jobs liés à la table patient), la fréquence d'alimentation aurait dû être mensuelle.
   - Stratégie de chargement : Il manque des mentions importantes comme le sel, poivre ou la rotation des données.
   - Clés et champs : Veillez à bien identifier les clés de manière cohérente par rapport à la source, et à inclure tous les champs pertinents sans omettre les fréquences de chargement ou les définitions de clés automatiques.  

2. Utilisation des contextes
   - Utilisation des contextes : Actuellement, soit l'utilisation des contextes/variables est insuffisante, soit il y a un manque d'informations (mention « Aucune info » ou « Pas de contexte utilisé »). Il est nécessaire de paramétrer et d'utiliser correctement les contextes et les variables (pour les connexions aux sources, au cluster Cloudera, etc.) au sein de vos jobs.
   - Justification technique : Le calcul des actions ou la démarche de détermination (par exemple pour le correcteur de position ou de vitesse) doit être pleinement étayé et documenté.   


## Corrections

### 1. Dans la partie 2.1

Justification de l'Arborescence Physique du Datalake (HDFS & Hive)
Afin d'assurer le chargement efficace des données dans Hive à travers des tables externes, chaque chargement de dimension et chaque table de faits est stocké dans un répertoire physique strictement isolé au sein d'HDFS. Cette séparation physique évite tout chevauchement lors des exécutions d'ETL et garantit une intégrité référentielle absolue.

```
/datalake/
├── bronze/                         <-- Zone Brute (Natif HDFS)
│   ├── postgresql/                 <-- Source 1 (Actes, Patients, etc.)
│   ├── etablissements/             <-- Source 2 (CSV FINESS)
│   ├── satisfaction/               <-- Source 3 (FTP CSV/JSON)
│   └── insee_deces/                <-- Source 4 (FTP Open Data)
├── silver/                         <-- Zone Qualifiée & Anonymisée (HDFS)
│   ├── dim_patient/
│   ├── dim_etablissement/  
│   ├── dim_localisation/
│   ├── dim_diagnostic/
│   ├── dim_professionnel/
│   └── faits/
└── gold/                           <-- Zone Décisionnelle (Tables Externes Hive)
    ├── dimensions/
    │   ├── dim_temps/              <-- Stocké dans /datalake/gold/dimensions/dim_temps
    │   ├── dim_localisation_insee/ <-- Stocké dans /datalake/gold/dimensions/dim_localisation_insee
    │   ├── dim_etablissement/      <-- Stocké dans /datalake/gold/dimensions/dim_etablissement
    │   ├── dim_patient/            <-- Stocké dans /datalake/gold/dimensions/dim_patient
    │   ├── dim_diagnostic/         <-- Stocké dans /datalake/gold/dimensions/dim_diagnostic
    │   └── dim_professionnel/      <-- Stocké dans /datalake/gold/dimensions/dim_professionnel
    └── faits/
        ├── fait_consultations/     <-- Stocké dans /datalake/gold/faits/fait_consultations (Partitionné annee/mois)
        ├── fait_hospitalisations/  <-- Stocké dans /datalake/gold/faits/fait_hospitalisations (Partitionné annee/mois)
        ├── fait_satisfaction/      <-- Stocké dans /datalake/gold/faits/fait_satisfaction
        └── fait_deces/             <-- Stocké dans /datalake/gold/faits/fait_deces
```

### 2. Ajout de :  4.2. Gestion des Contextes et Variables de Connexion (Talend Contexts)
Afin d'éviter toute dépendance d'environnement en dur (hardcoding) et de permettre une portabilité totale du projet entre le poste de développement local et le cluster Cloudera, l'ensemble des jobs Talend exploite un groupe de contextes centralisé.

Les paramètres d'accès aux bases et clusters sont gérés dynamiquement via des variables de contexte :
```
# Paramètres de Connexion Base Source PostgreSQL (HCG)
context.DB_Postgres_Server=10.0.1.50
context.DB_Postgres_Port=5432
context.DB_Postgres_Database=hcg_oltp
context.DB_Postgres_Schema=public
context.DB_Postgres_Login=etl_user
context.DB_Postgres_Password=EncryptedPasswordString

# Paramètres de Connexion Cluster Cloudera Hadoop & Hive Gold
context.Cloudera_Namenode_URI=hdfs://cloudera-namenode.chu.internal:8020
context.Hive_HS2_Server=cloudera-hive.chu.internal
context.Hive_Port=10000
context.Hive_Database=chu_gold_db
context.Hive_Login=hive_etl
context.Hive_Principal=hive/cloudera-hive.chu.internal@CHU.INTERNAL

# Paramètres des Serveurs FTP & Répertoires
context.FTP_Server=ftp.chu.internal
context.FTP_Port=22
context.FTP_User=ftp_extract
context.FTP_Directory=/exports/satisfaction/
context.HDFS_Bronze_Path=/datalake/bronze/
```

### 3. Dans la partie 4.3

Détail des mécanismes de protection des données (Sel, Poivre & Rotation)
Afin d'assurer une étanchéité parfaite vis-à-vis du RGPD et d'empêcher les attaques par dictionnaires ou tables arc-en-ciel sur les identifiants patients :
- Ajout d'un Sel et d'un Poivre : L'empreinte de pseudonymisation est calculée en combinant l'identifiant source avec un sel spécifique propre au patient et un poivre applicatif.

### 4. Correction dans la partie 4.4

### Autre correction

- Ajouter une étape entre les sources de données et la couche bronze afin de transférer les données des sources distantes en local.
- Faire au minimum un job talend par source puis pas fréquence de synchronisation.
