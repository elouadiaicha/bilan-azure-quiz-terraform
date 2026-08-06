# ADR-004 : Authentification GitHub OIDC

## Statut

Accepté

## Contexte

La pipeline GitHub Actions doit accéder aux ressources Azure.

L'utilisation d'un Client Secret permanent n'est pas souhaitable.

## Décision

Utiliser OpenID Connect (OIDC) entre GitHub Actions et Azure.

Une Federated Identity Credential est configurée dans Microsoft Entra ID.

## Conséquences

### Avantages

- Aucun secret Azure permanent
- Authentification temporaire
- Meilleure sécurité
- Gestion simplifiée des identités
