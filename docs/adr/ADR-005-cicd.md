# ADR-005 : Pipeline CI/CD GitHub Actions

## Statut

Accepté

## Contexte

Le projet est réparti sur plusieurs dépôts GitHub.

Chaque dépôt doit être validé automatiquement.

## Décision

Chaque dépôt dispose d'une pipeline GitHub Actions.

Pour le dépôt Terraform, la pipeline réalise :

- terraform fmt
- terraform validate
- terraform plan
- terraform apply sur la branche main

## Conséquences

La qualité du code est vérifiée automatiquement avant chaque déploiement.

Les erreurs sont détectées dès la Pull Request.
