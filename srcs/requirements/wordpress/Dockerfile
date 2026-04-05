FROM debian:bookworm

RUN apt update && apt install -y \
    php-fpm \
    php-mysql \
    mariadb-client \
    curl \
    && apt clean \
    && rm -rf /var/lib/apt/lists/*

COPY conf/www.conf /etc/php/8.2/fpm/pool.d/www.conf

COPY tools/setup.sh /setup.sh
RUN chmod +x /setup.sh

CMD ["/setup.sh"]