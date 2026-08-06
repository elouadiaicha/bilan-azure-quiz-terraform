# ADR-002 : Choix des services Azure

## Statut

Accepté

## Contexte

L'application Azure Quiz est composée :

- d'un frontend Angular
- d'un backend Spring Boot
- d'une base PostgreSQL
- d'un cache Redis

## Décision

Les services retenus sont :

- Azure Static Web App pour le frontend
- Azure App Service Linux pour le backend
- Azure Database for PostgreSQL Flexible Server
- Azure Managed Redis
- Azure Storage Account
- Azure Key Vault

## Justification

Ces services sont entièrement managés.

Ils réduisent la charge d'administration tout en répondant aux besoins du projet.

Le choix d'App Service plutôt qu'AKS permet de simplifier le déploiement.
