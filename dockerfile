FROM wordpress:latest

COPY config/php.ini /usr/local/etc/php/
COPY config/wp-config.php /var/www/html/
COPY config/uploads.ini /usr/local/etc/php/conf.d/


