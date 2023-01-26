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
        mysql-client \
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

# Set the working directory
WORKDIR /var/www/html/

# Copy the config file
COPY wp-config.php .

# Change the ownership of the files
RUN chown -R www-data:www-data /var/www/html/

# Expose the port
EXPOSE 80

# Start the Apache service
CMD ["apache2-foreground"]



