FROM php:7.4-apache

# Install necessary packages
RUN apt-get update && \
    apt-get install -y \
        libzip-dev \
        libicu-dev \
        libjpeg-dev \
        libpng-dev \
        libfreetype6-dev \
        libssl-dev \
        libmcrypt-dev \
        libonig-dev \
        libpq-dev \
        libxml2-dev \
        unzip

# Configure PHP extensions
RUN docker-php-ext-configure gd --with-freetype --with-jpeg
RUN docker-php-ext-install \
        gd \
        intl \
        mbstring \
        mysqli \
        opcache \
        pdo_mysql \
        zip

# Enable mod_rewrite
RUN a2enmod rewrite

# Copy the code to the container
COPY . /var/www/html/

# Copy wp-config.php file to the container
COPY wp-config.php /var/www/html/wordpress/wp-config.php

# Set permissions for wp-config.php
RUN chmod 660 /var/www/html/wp-config.php

# Set the working directory
WORKDIR /var/www/html/

# Change the ownership of the files
RUN chown -R www-data:www-data /var/www/html/

# Expose the port
EXPOSE 80

# Start the Apache service
CMD ["apache2-foreground"]
