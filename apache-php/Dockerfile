FROM php:8.4-apache

# Instalar dependencias y módulos PHP
RUN apt-get update && apt-get install -y \
    libpng-dev \
    libicu-dev \
    libxml2-dev \
    libzip-dev \
    libpq-dev \
    libgd-dev \
    libonig-dev \
    gettext-base \
    libapache2-mod-auth-openidc \
    && docker-php-ext-install \
        gd \
        intl \
        pdo_mysql \
        pdo_pgsql \
        soap \
        zip \
        opcache \
        mbstring \
        exif \
        bcmath \
        calendar \
        sockets \
    && a2enmod rewrite auth_openidc headers \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Configuración PHP
COPY config/php.ini /usr/local/etc/php/conf.d/
COPY config/opcache.ini /usr/local/etc/php/conf.d/

# Plantilla VirtualHost
COPY config/virtualhost.conf.template /etc/apache2/sites-available/

# .htaccess base
COPY config/.htaccess /var/www/html/

# Script de entrada
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
CMD ["apache2-foreground"]
