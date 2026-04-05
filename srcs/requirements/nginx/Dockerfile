FROM debian:bookworm

RUN apt update && apt install -y nginx openssl && \
    apt clean && rm -rf /var/lib/apt/lists/*

COPY conf/default.conf /etc/nginx/sites-available/default
COPY tools/setup.sh /setup.sh
RUN chmod +x /setup.sh
 
CMD ["/setup.sh"]