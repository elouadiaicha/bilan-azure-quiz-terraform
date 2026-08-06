# ADR-003 : Backend Terraform distant

## Statut

Accepté

## Contexte

Le fichier terraform.tfstate ne doit pas être stocké uniquement sur le poste local.

## Décision

Le state Terraform est stocké dans un Azure Storage Account.

Le backend utilise :

- Azure Storage Account
- conteneur Blob tfstate

## Justification

Cette solution permet :

- le verrouillage du state
- le travail collaboratif
- une meilleure sécurité
- la persistance de l'état de l'infrastructure
