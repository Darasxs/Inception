#!/bin/bash
set -e

if [ ! -d "/var/lib/mysql/mysql" ]; then
    echo "Initializing database..."

    mariadb-install-db --user=mysql --datadir=/var/lib/mysql

    mysqld_safe --datadir=/var/lib/mysql &

    echo "Waiting for MariaDB..."
    until mysqladmin ping --silent; do
        sleep 1
    done

    echo "Creating DB and user..."
    mysql <<EOF
CREATE DATABASE IF NOT EXISTS \`${MYSQL_DATABASE}\`;
CREATE USER IF NOT EXISTS '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';
GRANT ALL PRIVILEGES ON \`${MYSQL_DATABASE}\`.* TO '${MYSQL_USER}'@'%';
ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';
FLUSH PRIVILEGES;
EOF

    mysqladmin -u root -p"${MYSQL_ROOT_PASSWORD}" shutdown
fi

echo "Starting MariaDB..."
exec mysqld_safe --datadir=/var/lib/mysql