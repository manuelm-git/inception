#!/bin/bash
# filepath: /home/manumart/Desktop/maneleh42/inception/srcs/requirements/wordpress/script.sh

cd /var/www/html

echo "Starting WordPress setup script..."

# Download wp-cli if not already present
if [ ! -f wp-cli.phar ]; then
    echo "Downloading wp-cli.phar..."
    curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
    chmod +x wp-cli.phar
fi

echo "wp-cli.phar downloaded and ready."

# Download WordPress core if not already present
if [ ! -f wp-config.php ]; then
    echo "Downloading WordPress core..."
    ./wp-cli.phar core download --allow-root
    ./wp-cli.phar config create \
        --dbname="${WORDPRESS_DB_NAME}" \
        --dbuser="${WORDPRESS_DB_USER}" \
        --dbpass="${WORDPRESS_DB_PASSWORD}" \
        --dbhost="${WORDPRESS_DB_HOST}" \
        --allow-root
fi

echo "WordPress core downloaded and configured."

# Install WordPress if not already installed
if ! ./wp-cli.phar core is-installed --allow-root; then
    echo "Installing WordPress..."
    ./wp-cli.phar core install \
        --url="${DOMAIN}" \
        --title="inception" \
        --admin_user="${WORDPRESS_ADMIN_USER}" \
        --admin_password="${WORDPRESS_ADMIN_PASSWORD}" \
        --admin_email="${WORDPRESS_ADMIN_EMAIL}" \
        --allow-root
else
    echo "WordPress is already installed."
fi

echo "WordPress installation complete."

# Start PHP-FPM in the foreground
exec php-fpm8.2 -F