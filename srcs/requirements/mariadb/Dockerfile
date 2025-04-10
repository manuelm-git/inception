FROM debian:bullseye

RUN apt update && apt upgrade -y && apt install -y \ 
    mariadb-server gettext

COPY 50-server.cnf /etc/mysql/mariadb.conf.d/.
COPY init.sql /docker-entrypoint-initdb.d/init.sql
COPY script.sh /docker-entrypoint-initdb.d/script.sh
RUN chmod +x /docker-entrypoint-initdb.d/script.sh

RUN mkdir /run/mysqld
CMD ["/docker-entrypoint-initdb.d/script.sh"]