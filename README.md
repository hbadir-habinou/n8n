# n8n - Déploiement Docker pour l'Automatisation de Workflows

## Description du Projet

Ce dépôt fournit une configuration **minimaliste et personnalisée** pour le déploiement de **n8n**, un outil d'automatisation de workflows *low-code* et *open-source*.

Le cœur de ce dépôt est un simple `Dockerfile` qui utilise l'image officielle de n8n pour garantir la stabilité et la mise à jour facile, tout en permettant une légère personnalisation de l'environnement de déploiement.

## Caractéristiques

| Caractéristique | Description |
| :--- | :--- |
| **Simplicité** | Un seul `Dockerfile` pour un déploiement rapide. |
| **Basé sur l'Officiel** | Utilise l'image `n8nio/n8n:latest` pour bénéficier des dernières mises à jour et correctifs de sécurité. |
| **Port Standard** | Expose le port par défaut `5678` pour l'accès à l'interface web. |
| **Extensibilité** | Point de départ idéal pour ajouter des configurations spécifiques ou des nœuds personnalisés. |

## Technologies Utilisées

*   **n8n:** Plateforme d'automatisation de workflows.
*   **Docker:** Technologie de conteneurisation pour un déploiement isolé et portable.

## Déploiement avec Docker

Pour utiliser cette configuration, suivez les étapes ci-dessous.

### 1. Prérequis

*   Docker et Docker Compose installés sur votre machine ou serveur.

### 2. Construction de l'Image

Naviguez vers le répertoire du dépôt et construisez l'image Docker.

```bash
cd n8n_repo
docker build -t mon-n8n-personnalise .
```

### 3. Lancement du Conteneur

Vous pouvez lancer le conteneur directement, en mappant le port 5678 et en utilisant des variables d'environnement pour la configuration de base.

**Exemple de commande `docker run` :**

```bash
docker run -it --rm \
    --name n8n \
    -p 5678:5678 \
    -e N8N_HOST=localhost \
    -e N8N_PORT=5678 \
    -e N8N_PROTOCOL=http \
    -e GENERIC_TIMEZONE=Europe/Paris \
    -v ~/.n8n:/home/node/.n8n \
    mon-n8n-personnalise
```

**Explication des options :**

| Option | Description |
| :--- | :--- |
| `-p 5678:5678` | Mappe le port interne 5678 au port externe 5678. |
| `-e N8N_HOST=...` | Définit le nom d'hôte pour les URLs générées par n8n. |
| `-e GENERIC_TIMEZONE` | Définit le fuseau horaire pour les exécutions de workflows. |
| `-v ~/.n8n:/home/node/.n8n` | **Volume Persistant** : Monte un volume local pour stocker les données de n8n (workflows, utilisateurs, logs) et garantir la persistance après redémarrage. |

### 4. Accès à l'Interface

Une fois le conteneur lancé, l'interface web de n8n sera accessible via votre navigateur à l'adresse :

`http://localhost:5678`

## Configuration Avancée

Pour une utilisation en production, il est fortement recommandé d'utiliser un fichier `docker-compose.yml` pour gérer la persistance des données, les variables d'environnement (comme les identifiants de base de données) et l'intégration avec un proxy inverse (comme Nginx ou Traefik) pour le SSL.

**Variables d'environnement importantes pour n8n :**

*   `N8N_BASIC_AUTH_USER` et `N8N_BASIC_AUTH_PASSWORD` : Pour sécuriser l'accès à l'interface.
*   `DB_TYPE` et `DB_POSTGRES_...` : Pour configurer une base de données externe (PostgreSQL ou MySQL) au lieu de la base de données SQLite par défaut.

