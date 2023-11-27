# Description
Environnement de développement web (Apahce, PHP, MySQL) avec Docker.

## Prérequis
- Docker
- Docker Compose

## Installation
1. Cloner le projet
2. Completer le fichier `.env` avec vos données
3. Lancer la commande `docker-compose up -d`
4. Accéder à l'application sur `http://localhost`
5. Accéder à phpMyAdmin sur `http://localhost:8080`

## Configuration
### Apache
Les fichiers de configuration d'Apache se trouve dans le dossier `./server/`: `./server/apache2.conf` et `./server/sites/000-default.conf

### PHP
Les fichiers de configuration de PHP se trouve dans le dossier `./server/php`.

### MySQL
Le dossier `./database` contient les données de la base de données MySQL.

## Utilisation
### Ajouter un nouveau site
1. Dans le dossier `./www` supprimer le fichier `index.php` et ajouter votre projet.
2. Dans le fichier `./server/000-default.conf` ajouter un nouveau VirtualHost.

**Vous pouvez ajouté autant de services que vous le souhaitez dans le fichier `docker-compose.yml`.**

## Contribuer
- [Lucas RATIARAY](https://lucasratiaray.fr)
