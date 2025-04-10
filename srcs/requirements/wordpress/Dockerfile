FROM debian:bullseye

# Install necessary packages
RUN apt update && apt upgrade -y && apt install -y \
    php7.4-fpm php7.4-mysql curl wget unzip

# Copy the script and configuration files
COPY www.conf /etc/php/7.4/fpm/pool.d/www.conf
COPY script.sh /usr/local/bin/script.sh

# Make the script executable
RUN chmod +x /usr/local/bin/script.sh

# Set the entrypoint
CMD ["/usr/local/bin/script.sh"]