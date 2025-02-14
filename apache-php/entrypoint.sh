#!/bin/bash

# Generar configuración PHP
envsubst < /usr/local/etc/php/conf.d/php.ini.template > /usr/local/etc/php/conf.d/php.ini

# Generar VirtualHost
envsubst < /etc/apache2/sites-available/virtualhost.conf.template > /etc/apache2/sites-available/000-default.conf

# Configuración Apache
echo "<Directory /var/www/html>
    AllowOverride All
</Directory>" > /etc/apache2/conf-available/security.conf

a2enconf security

exec apache2-foreground
