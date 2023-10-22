#!/bin/bash

# Fonction pour gérer l'interruption de Ctrl+C
cleanup() {
    echo "Le script a été interrompu."
    # Ajoutez ici toute autre opération que vous souhaitez effectuer avant de quitter.
    exit 1
}

# Capturer le signal SIGINT (Ctrl+C) et appeler la fonction cleanup
trap cleanup INT

# Arrête et supprime les conteneurs, les images, les volumes et les réseaux créés par docker-compose up
echo "======> docker-compose down"
docker-compose down

# Nettoie tous les conteneurs, images, et réseaux non utilisés
echo "======> docker system prune -f"
docker system prune -f


# Démarre les services Docker Compose en mode détaché et reconstruit les images si nécessaire
echo "======> docker-compose up -d --build"
docker-compose build

# Démarre les services Docker Compose en mode détaché
echo "======> docker-compose up -d"
docker-compose up -d

# Affiche la liste des conteneurs en cours d'exécution
echo "======> docker ps"
docker ps

# Demande à l'utilisateur d'entrer l'ID du conteneur
read -p "Entrez l'ID du conteneur : " user_input

# Exécute une commande à l'intérieur du conteneur spécifié
echo "======> docker exec -it $user_input bash"
docker exec -it "$user_input" bash