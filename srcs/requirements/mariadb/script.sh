#!/bin/bash

# Initialize the MariaDB data directory
mysql_install_db --user=mysql --datadir=/var/lib/mysql

# Debugging: Print environment variables
echo "MYSQL_DATABASE=${MYSQL_DATABASE}"
echo "MYSQL_USER=${MYSQL_USER}"
echo "MYSQL_PASSWORD=${MYSQL_PASSWORD}"

# environment variables
if [ -f /docker-entrypoint-initdb.d/init.sql ]; then
    echo "Processing init.sql with environment variables..."
    envsubst < /docker-entrypoint-initdb.d/init.sql > /docker-entrypoint-initdb.d/init-processed.sql
    mv /docker-entrypoint-initdb.d/init-processed.sql /docker-entrypoint-initdb.d/init.sql
    echo "Processed init.sql:"
    cat /docker-entrypoint-initdb.d/init.sql
else
    echo "Error: /docker-entrypoint-initdb.d/init.sql not found!"
    exit 1
fi

# Start MariaDB and ensure it processes the init.sql file
exec mysqld --user=mysql --init-file=/docker-entrypoint-initdb.d/init.sql