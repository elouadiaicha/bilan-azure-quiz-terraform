# Azure Quiz – Infrastructure as Code

## 📖 Description

Ce dépôt contient l'ensemble de l'infrastructure Azure du projet **Azure Quiz**, déployée avec **Terraform**.

L'objectif est de provisionner automatiquement les ressources Azure nécessaires au fonctionnement de l'application tout en appliquant les bonnes pratiques d'Infrastructure as Code (IaC), de sécurité et de CI/CD.

L'infrastructure est modulaire afin de faciliter sa maintenance, sa réutilisation et son évolution.

---

# 🏗️ Architecture

L'infrastructure déploie les ressources Azure suivantes :

- Azure App Service (Backend Spring Boot)
- Azure Static Web App (Frontend Angular)
- Azure Database for PostgreSQL Flexible Server
- Azure Managed Redis
- Azure Storage Account
- Azure Key Vault

Le Resource Group ainsi que l'App Service Plan sont fournis par l'environnement de formation et sont récupérés via des **data sources Terraform**.

Le schéma d'architecture est disponible dans :

```text
docs/architecture.png
```

---

# 📁 Structure du projet

```text
.
├── .github/
│   └── workflows/
│
├── docs/
│   ├── architecture.drawio
│   └── architecture.png
│
├── modules/
│   ├── app-service/
│   ├── key_vault/
│   ├── postgresql/
│   ├── redis/
│   ├── static-web-app/
│   └── storage/
│
├── backend.tf
├── main.tf
├── outputs.tf
├── providers.tf
├── variables.tf
├── versions.tf
├── terraform.tfvars
└── README.md
```

---

# ⚙️ Technologies utilisées

- Terraform
- Microsoft Azure
- AzureRM Provider
- GitHub Actions
- OpenID Connect (OIDC)
- Trivy
- Gitleaks

---

# 🚀 Déploiement

Initialisation :

```bash
terraform init
```

Validation :

```bash
terraform validate
```

Vérification du format :

```bash
terraform fmt -recursive
```

Prévisualisation :

```bash
terraform plan
```

Déploiement :

```bash
terraform apply
```

---

# 🔒 Sécurité

Plusieurs mécanismes de sécurité ont été mis en œuvre :

- Authentification GitHub → Azure via OpenID Connect (OIDC)
- Backend Terraform distant sur Azure Storage
- Analyse de sécurité de l'infrastructure avec Trivy
- Détection de secrets avec Gitleaks
- Protection des branches avec CODEOWNERS
- Mise à jour automatique des dépendances via Dependabot
- Accès réseau restreint au Storage Account
- Accès réseau restreint au Key Vault
- Chiffrement des communications en TLS 1.2

---

# 🔄 Intégration Continue

Le pipeline GitHub Actions exécute automatiquement :

- Vérification du format Terraform
- Terraform Validate
- Terraform Plan
- Terraform Apply (uniquement sur la branche `main`)
- Analyse de sécurité Trivy
- Analyse de secrets Gitleaks

---

# 📑 Modules Terraform

Le projet est organisé en modules indépendants :

| Module | Description |
|---------|-------------|
| app-service | Déploiement du backend Spring Boot |
| static-web-app | Déploiement du frontend Angular |
| postgresql | Base de données PostgreSQL Flexible Server |
| redis | Azure Managed Redis |
| storage | Azure Storage Account |
| key_vault | Azure Key Vault |

---

# 🧱 Backend Terraform

Le fichier d'état Terraform est stocké dans un **Azure Storage Account** afin de permettre :

- un état distant partagé ;
- le verrouillage du state ;
- une meilleure collaboration.

---

# 📄 Architecture Decision Records (ADR)

Les principales décisions techniques sont documentées dans les ADR du projet, notamment :

- utilisation de Terraform comme outil d'Infrastructure as Code ;
- authentification Azure via OpenID Connect ;
- utilisation d'un backend Terraform distant ;
- sécurisation des ressources Azure.

---

# 📚 Bonnes pratiques mises en œuvre

- Infrastructure modulaire
- Variables centralisées
- Outputs Terraform
- Tags sur les ressources Azure
- Backend distant
- Authentification sans secret grâce à OIDC
- Analyse de sécurité automatisée
- Détection de secrets
- Déploiement automatisé via GitHub Actions

---

# 👤 Auteur

**Aicha Elouadi**

Formation **Administrateur Cloud & DevOps – Simplon**

2026
