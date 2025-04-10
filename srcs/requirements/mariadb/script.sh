#!/bin/bash
mysql_install_db

# Debugging: Print environment variables
echo "MYSQL_DATABASE=${MYSQL_DATABASE}"
echo "MYSQL_USER=${MYSQL_USER}"
echo "MYSQL_PASSWORD=${MYSQL_PASSWORD}"

# Replace placeholders in init.sql with environment variables
if [ -f /docker-entrypoint-initdb.d/init.sql ]; then
    echo "Processing init.sql with environment variables..."
    cat /docker-entrypoint-initdb.d/init.sql
    envsubst < /docker-entrypoint-initdb.d/init.sql > /docker-entrypoint-initdb.d/init-processed.sql
    mv /docker-entrypoint-initdb.d/init-processed.sql /docker-entrypoint-initdb.d/init.sql
    echo "Processed init.sql:"
    cat /docker-entrypoint-initdb.d/init.sql
fi

# Start MariaDB and ensure it processes the init.sql file
exec mysqld --init-file=/docker-entrypoint-initdb.d/init.sql