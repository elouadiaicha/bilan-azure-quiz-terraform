# ADR-006 : Stratégie réseau de l'environnement non-production

## Statut

Accepté

## Contexte

L'architecture initiale prévoyait une isolation réseau stricte entre le frontend, le backend et les services de données Azure.

L'objectif était notamment d'utiliser un VNet, des subnets et des mécanismes d'accès privés afin de limiter l'exposition des ressources.

Lors de l'implémentation, l'environnement mutualisé de formation a introduit des contraintes, notamment sur l'intégration VNet de l'App Service Plan partagé.

L'architecture a donc dû être adaptée tout en conservant un niveau de sécurité cohérent avec les contraintes du cahier des charges.

## Décision

L'architecture finale repose sur :

- Azure Static Web Apps comme frontend public ;
- Azure Linux Web App comme backend ;
- App Service Plan mutualisé fourni par le formateur ;
- règles réseau basées sur les IP sortantes du backend pour PostgreSQL et le Storage Account ;
- CORS limité à l'origine exacte du frontend ;
- clé API partagée pour protéger les endpoints `/api/**` ;
- Managed Identity de l'App Service ;
- RBAC `Storage Blob Data Contributor` pour l'accès au Blob Storage.

L'isolation réseau stricte du backend par VNet et Private Endpoint n'a pas été retenue dans l'architecture finale.

## Justification

Azure Static Web Apps doit communiquer avec une origine publique dans l'architecture retenue.

Le cahier des charges autorise explicitement, pour la cible Services managés, le remplacement de l'isolation stricte du backend par un contrôle applicatif équivalent basé sur :

- un CORS restreint à l'origine exacte du frontend ;
- une clé API partagée vérifiée par le backend.

Cette solution permet de respecter les contraintes de l'environnement mutualisé tout en maintenant un contrôle d'accès adapté.

## Alternatives écartées

### VNet + subnets + Private Endpoints

Cette solution était prévue initialement et offrait une meilleure isolation réseau.

Elle a été écartée en raison des contraintes rencontrées avec l'intégration VNet de l'App Service Plan mutualisé.

### Backend totalement public sans contrôle applicatif

Cette solution aurait été plus simple à mettre en œuvre mais ne répondait pas aux exigences de sécurité du projet.

## Conséquences

Avantages :

- architecture compatible avec les contraintes de la subscription de formation ;
- déploiement simplifié ;
- contrôle CORS précis ;
- authentification applicative via clé API ;
- accès Blob sans clé grâce à la Managed Identity.

Limites :

- le backend reste techniquement exposé sur une URL publique ;
- la sécurité repose en partie sur des contrôles applicatifs plutôt que sur une isolation réseau complète ;
- les IP sortantes de l'App Service doivent rester cohérentes avec les règles réseau des services associés.
