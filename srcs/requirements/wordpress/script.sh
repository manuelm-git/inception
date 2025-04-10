#!/bin/bash
cd /var/www/html

# Debugging output
echo "Starting WordPress setup script..."

# Download wp-cli if not already present
if [ ! -f wp-cli.phar ]; then
    echo "Downloading wp-cli.phar..."
    curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
    chmod +x wp-cli.phar
fi

# Debugging output
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

# Debugging output
echo "WordPress core downloaded and configured."

# Install WordPress with the desired admin credentials
echo "Installing WordPress..."
./wp-cli.phar core install \
    --url="${DOMAIN}" \
    --title="inception" \
    --admin_user="${WORDPRESS_ADMIN_USER}" \
    --admin_password="${WORDPRESS_ADMIN_PASSWORD}" \
    --admin_email="${WORDPRESS_ADMIN_EMAIL}" \
    --allow-root

# Debugging output
echo "WordPress installation complete."

# Verify the admin user
if ./wp-cli.phar user get "${WORDPRESS_ADMIN_USER}" --allow-root > /dev/null 2>&1; then
    echo "Admin user '${WORDPRESS_ADMIN_USER}' successfully created."
else
    echo "Failed to create admin user '${WORDPRESS_ADMIN_USER}'."
    exit 1
fi

# Debugging output
echo "Admin user setup complete."

# Start PHP-FPM
php-fpm8.2 -F