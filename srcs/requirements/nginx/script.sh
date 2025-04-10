#!/bin/bash
# filepath: /home/manumart/Desktop/maneleh42/inception/srcs/requirements/nginx/script.sh

# Copy the Nginx configuration file
echo "Setting up Nginx configuration..."
cp /default /etc/nginx/sites-available/default

# Test Nginx configuration
nginx -t

# Start Nginx
echo "Starting Nginx..."
exec nginx -g "daemon off;"