#!/bin/bash
set -e

MYSQL_PASSWORD=$(cat /run/secrets/db_password)
WP_ADMIN_PASSWORD=$(cat /run/secrets/credentials)
WP_USER_PASSWORD=$(cat /run/secrets/wp_user_password)

mkdir -p /var/www/html
cd /var/www/html

if [ ! -f /usr/local/bin/wp ]; then
    curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
    chmod +x wp-cli.phar
    mv wp-cli.phar /usr/local/bin/wp
fi

echo "Waiting for MariaDB..."
until mysqladmin ping -h mariadb -u${MYSQL_USER} -p${MYSQL_PASSWORD} --port=5023 --silent; do
    sleep 1
done

if [ ! -f wp-load.php ]; then
    echo "Downloading WordPress..."
    wp core download --allow-root
fi

echo "Recreating wp-config.php..."
rm -f wp-config.php

wp config create \
    --dbname=${MYSQL_DATABASE} \
    --dbuser=${MYSQL_USER} \
    --dbpass=${MYSQL_PASSWORD} \
    --dbhost=mariadb:5023 \
    --allow-root

if ! wp core is-installed --allow-root; then
    echo "Installing WordPress..."

    wp core install \
        --url=${DOMAIN_NAME} \
        --title="${WP_TITLE}" \
        --admin_user=${WP_ADMIN_USER} \
        --admin_password=${WP_ADMIN_PASSWORD} \
        --admin_email=${WP_ADMIN_EMAIL} \
        --allow-root

    wp user create \
        ${WP_USER} ${WP_USER_EMAIL} \
        --user_pass=${WP_USER_PASSWORD} \
        --allow-root
fi

chown -R www-data:www-data /var/www/html

echo "Starting PHP-FPM..."
exec php-fpm8.2 -F