# Utilisez l'image de base PHP 8.2 avec Apache
FROM php:8.2-apache

# Mettez à jour la liste des paquets disponibles
RUN apt-get update

# Installez les dépendances pour MySQL avec PDO
RUN apt-get install -y libzip-dev \
    && docker-php-ext-configure zip \
    && docker-php-ext-install pdo pdo_mysql zip

# Installez les dépendances pour les bibliothèques d'image
RUN apt-get update -y && apt-get install -y libpng-dev libfreetype6-dev libyaml-dev
 
# Configurez l'extension GD pour utiliser Freetype
RUN docker-php-ext-configure gd --with-freetype

# Installez l'extension GD
RUN docker-php-ext-install gd

# Modifiez l'UID de l'utilisateur www-data à 1000
RUN usermod -u 1000 www-data

# Activez le module de réécriture Apache (mod_rewrite)
RUN a2enmod rewrite

WORKDIR /var/www/

CMD rm -rf /var/www/html && apache2-foreground