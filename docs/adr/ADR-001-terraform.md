# ADR-001 : Adoption de Terraform pour le provisionnement de l'infrastructure

## Statut

Accepté

## Contexte

Le projet Azure Quiz nécessite le déploiement de plusieurs ressources Azure :

- Resource Group
- Storage Account
- Key Vault
- PostgreSQL Flexible Server
- Azure Managed Redis
- Azure App Service
- Azure Static Web App

Le déploiement manuel via le portail Azure rendrait la reproduction de l'environnement difficile.

## Décision

Utiliser Terraform comme outil d'Infrastructure as Code.

L'infrastructure est organisée en modules afin de faciliter la maintenance et la réutilisation du code.

## Conséquences

### Avantages

- Infrastructure reproductible
- Versionnement Git
- Déploiement automatisable
- Maintenance facilitée

### Inconvénients

- Courbe d'apprentissage
- Gestion du state Terraform
