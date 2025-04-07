FROM debian:latest

# Install required packages
RUN apt update && apt upgrade -y && apt install -y nginx openssl

# Create directories for SSL certificates
RUN mkdir -p /etc/nginx/ssl /run/nginx

# Generate a self-signed certificate for TLS 1.2
RUN openssl req -newkey rsa:2048 -x509 -sha256 -days 365 -nodes \
    -out /etc/nginx/ssl/selfsigned.crt \
    -keyout /etc/nginx/ssl/selfsigned.key \
    -subj "/C=PT/ST=Lisboa/L=Lisboa/O=42 School/OU=manumart/CN=manumart.42.fr"

# Copy the NGINX configuration file
COPY default /etc/nginx/sites-available/default

# Expose HTTPS port
EXPOSE 443

# Start NGINX
CMD ["nginx", "-g", "daemon off;"]