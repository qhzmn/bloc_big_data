# Bloc 1 - Projet Big Data
**Cloud Healthcare Unit (CHU) — Entrepôt de Données Décisionnel (EDD)**

---

Dernière mise à jour : 04/11/2026

Editeur :
- Quentin HAZEMANN
- Jason KOUAM KAMDEM
- Ulysse BRULEY

FISA A4 INFO 25-28

---

## 📌 Table des Matières
- [Bloc 1 - Projet Big Data](#bloc-1---projet-big-data)
  - [📌 Table des Matières](#-table-des-matières)
  - [👁️ Aperçu du dépot](#️-aperçu-du-dépot)
  - [🚀 Contexte du Projet](#-contexte-du-projet)
  - [📁 Structure du Dépôt](#-structure-du-dépôt)
  - [🛠️ Installation et Déploiement](#️-installation-et-déploiement)

## 👁️ Aperçu du dépot
Ce dépôt contient l'ensemble des livrables, scripts SQL/ETL, documentations d'architecture et tableaux de bord développés pour le projet Cloud Healthcare Unit (CHU). L'objectif principal de ce projet est d'implémenter un Entrepôt de Données Décisionnel (EDD) sécurisé et performant, permettant de unifier et d'analyser l'activité hospitalière, le suivi des patients, les indicateurs de mortalité nationale ainsi que la satisfaction des usagers.

## 🚀 Contexte du Projet
Dans le cadre de sa transformation digitale, le groupe CHU centralise des données de santé volumineuses et hétérogènes issues de ses systèmes opérationnels (DB PostgreSQL) et de flux extérieurs (fichiers CSV, serveurs FTP open data).

## 📁 Structure du Dépôt
```text
.
├── README.md                                                   # Ce fichier
├── docs/                                                       # Documentation générale et livrables
│   ├── projet.pdf                                              # Sujet du projet
│   ├── livrable_1/                                             # Documentation du livrable 1
│   │   ├── Livrable_1_Referentiel_et_Architecture.pdf
│   │   ├── Livrable_1_Referentiel_et_Architecture.md
│   │   ├── correction_livrable_1.md
│   │   └── grille_livrable_1.xlsx
│   ├── livrable_2/                                             # Documentation du livrable 2
│   │   ├── Livrable_2_Implementation_et_Evaluation.pdf
│   │   └── Livrable_2_Implementation_et_Evaluation.md
│   ├── captures/                                               # Captures utilisées dans les livrables
│   │   └── ...
│   ├── livrable_3/                                             # Documentation du livrable 3
│   │   ├── Livrable_3_PowerBI.pbix
│   │   └── Livrable_3_Presentation.pptx
│   └── DATA 2024/                                              # Data utilisées pour ce projet (.gitingore)
│       └── ...
└── scripts/                                                    # Scripts du projet
    ├── architecture_dossiers/
    │   └── architecture_cloudera_hdfs.bat                      # Script permettant d'installer l'architecture dossier dans cloudera
    └── sql/
        ├── bronze/                                             # Script utlisé pour la couche bronze
        ├── silver/                                             # Script utlisé pour la couche silver
        ├── gold/                                               # Script utlisé pour la couche gold
        └── parametres/                                         # Script utlisé pour le paramétrage sql
```

## 🛠️ Installation et Déploiement
1. Cloner le projet :
```ps1
git clone https://github.com/qhzmn/bloc_big_data.git
cd bloc_big_data
```