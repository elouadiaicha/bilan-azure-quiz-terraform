# Azure Quiz – Terraform

## Présentation

Ce dépôt contient l'ensemble de l'infrastructure Azure du projet **Azure Quiz**, provisionnée avec **Terraform**.

L'objectif est de déployer une infrastructure **reproductible, modulaire et automatisée** permettant d'héberger une application composée d'un **frontend Angular**, d'un **backend Spring Boot** ainsi que des différents services Azure nécessaires à son fonctionnement.

Ce projet s'inscrit dans une démarche **Infrastructure as Code (IaC)** et applique plusieurs bonnes pratiques DevOps afin de garantir la maintenabilité, la sécurité et l'automatisation des déploiements.

Les principales pratiques mises en œuvre sont :

- Infrastructure modulaire avec Terraform
- Backend Terraform distant sur Azure Storage
- Pipeline CI/CD avec GitHub Actions
- Authentification GitHub ↔ Azure via OpenID Connect (OIDC)
- Gestion collaborative avec CODEOWNERS
- Mise à jour automatique des dépendances avec Dependabot
- Documentation des décisions d'architecture (ADR)

---

# Architecture

Le projet repose sur une architecture Cloud native composée des services Azure suivants :

| Ressource | Service Azure | Rôle |
|-----------|---------------|------|
| Resource Group | Azure Resource Group | Regroupe l'ensemble des ressources du projet |
| Storage | Azure Storage Account | Stockage des fichiers et backend Terraform |
| Key Vault | Azure Key Vault | Gestion sécurisée des secrets |
| PostgreSQL | Azure Database for PostgreSQL Flexible Server | Base de données relationnelle |
| Redis | Azure Managed Redis | Cache distribué |
| Backend | Azure App Service (Linux) | Hébergement de l'API Spring Boot |
| Frontend | Azure Static Web App | Hébergement de l'application Angular |

## Schéma d'architecture

![Architecture](docs/architecture.png)

---

# Structure du projet

```
.
├── backend.tf
├── providers.tf
├── variables.tf
├── outputs.tf
├── versions.tf
├── main.tf
│
├── modules
│   ├── app-service
│   ├── key_vault
│   ├── postgresql
│   ├── redis
│   ├── static-web-app
│   └── storage
│
├── docs
│   ├── architecture.drawio
│   ├── architecture.png
│   └── adr
│
└── .github
    ├── workflows
    └── dependabot.yml
```

L'infrastructure est organisée sous forme de modules Terraform afin de favoriser la réutilisabilité, la maintenance et la lisibilité du code.

---

# Déploiement

## Prérequis

- Terraform 1.9 ou supérieur
- Azure CLI
- Un abonnement Azure
- Authentification Azure

```bash
az login
```

## Initialisation

```bash
terraform init
```

## Validation

```bash
terraform fmt -recursive
terraform validate
```

## Génération du plan

```bash
terraform plan
```

## Déploiement

```bash
terraform apply
```

---

# Backend Terraform

Le fichier **terraform.tfstate** est stocké dans un backend Azure Blob Storage.

Cette configuration offre plusieurs avantages :

- stockage centralisé du state
- verrouillage des déploiements
- collaboration entre plusieurs développeurs
- sécurisation de l'état de l'infrastructure

---

# CI/CD

Le projet est intégré à **GitHub Actions**.

À chaque Pull Request ou Push, la pipeline exécute automatiquement :

- Terraform Format
- Terraform Validate
- Terraform Plan
- Terraform Apply (sur la branche `main`)

L'authentification entre GitHub et Azure est réalisée via **OpenID Connect (OIDC)** afin d'éviter l'utilisation de secrets Azure permanents.

---

# Documentation

Le dossier **docs/** contient :

- le schéma d'architecture
- les Architecture Decision Records (ADR)
- les éléments de conception du projet

---

# Technologies

- Terraform
- Microsoft Azure
- Azure App Service
- Azure Static Web Apps
- Azure Database for PostgreSQL
- Azure Managed Redis
- Azure Key Vault
- GitHub Actions
- OpenID Connect (OIDC)

---

# Auteur

**Aicha Elouadi**

Formation **Simplon – Administrateur Cloud Azure**
