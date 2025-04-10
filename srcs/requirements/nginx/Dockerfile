FROM debian:latest

RUN apt update && apt upgrade -y && apt install -y nginx openssl

RUN mkdir -p /etc/nginx/ssl /run/nginx

RUN openssl req -newkey rsa:2048 -x509 -sha256 -days 365 -nodes \
    -out /etc/nginx/ssl/selfsigned.crt \
    -keyout /etc/nginx/ssl/selfsigned.key \
    -subj "/C=PT/ST=Lisboa/L=Lisboa/O=42 School/OU=manumart/CN=manumart.42.fr"

COPY default /etc/nginx/sites-available/default

CMD ["nginx", "-g", "daemon off;"]