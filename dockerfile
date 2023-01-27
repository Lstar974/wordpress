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

# Set the working directory
WORKDIR /var/www/html/

# Change the ownership of the files
RUN chown -R www-data:www-data /var/www/html/

# Install WP-CLI
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
    && chmod +x wp-cli.phar \
    && mv wp-cli.phar /usr/local/bin/wp

# Download and configure WordPress
RUN sudo -u www-data -i -- wp config set DB_NAME "wordpress" --allow-root && wp config set DB_USER "lucas" --allow-root && wp config set DB_PASSWORD "root" --allow-root

# Install WordPress
RUN wp core install --url=test.com --title=test.com --admin_user=lucas --admin_password=lucas --admin_email=admin@example.com

# Expose the port
EXPOSE 80

# Start the Apache service
CMD ["apache2-foreground"]
