FROM debian:bullseye

RUN apt update && apt upgrade -y && apt install -y nginx openssl

RUN mkdir -p /etc/nginx/ssl /run/nginx

# Use build arguments to generate the SSL certificate
RUN openssl req -newkey rsa:2048 -x509 -sha256 -days 365 -nodes \
    -out /etc/nginx/ssl/selfsigned.crt \
    -keyout /etc/nginx/ssl/selfsigned.key \
    -subj "/C=${COUNTRY}/ST=${STATE}/L=${CITY}/O=${ORGANIZATION}/OU=${ORG_UNIT}/CN=${DOMAIN}"

COPY default /etc/nginx/sites-available/default

CMD ["nginx", "-g", "daemon off;"]