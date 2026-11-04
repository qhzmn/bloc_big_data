# Bloc 1 - Projet Big Data
**Cloud Healthcare Unit (CHU) — Entrepôt de Données Décisionnel (EDD)**

---

Dernière mise à jour : 04/11/2026

Editeur : ProSoft
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
├── README.md                                           # Ce fichier
│   docs/                                               # Documentation générale et livrables
│   ├── Livrable_1_Referentiel_et_Architecture.pdf
│   ├── Livrable_1_Referentiel_et_Architecture.md
│   ├── Livrable_2_Implementation_et_Performance.pdf
│   ├── Livrable_2_Implementation_et_Performance.md
│   └── Livrable_3_Presentation_Storytelling.pptx
├── sql/                                                # Scripts SQL versionnés
├── etl/                                                # Pipelines d'intégration et scripts de transformation
└── dashboards/                                         # Fichiers sources des tableaux de bord (PBIX, export Superset)
```

## 🛠️ Installation et Déploiement
1. Cloner le projet :
```ps1
git clone https://github.com/qhzmn/bloc_big_data.git
cd bloc_big_data
```