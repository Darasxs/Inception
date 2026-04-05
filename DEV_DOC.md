## Setup from scratch

1. Install:
- Docker
- Docker Compose
- make

2. Create secrets:

printf "root123" > secrets/db_root_password.txt
printf "wp123" > secrets/db_password.txt
printf "admin123" > secrets/credentials.txt
printf "user123" > secrets/wp_user_password.txt

3. Configure:

srcs/.env

4. Create persistent directories:

mkdir -p /home/dpaluszk/data/mariadb
mkdir -p /home/dpaluszk/data/wordpress

---

## Useful commands

make
make down
make restart
make logs
make ps
make clean
make fclean

---

## Data persistence

Data is stored in:

/home/dpaluszk/data/mariadb
/home/dpaluszk/data/wordpress

Persistence is ensured using bind mounts.

---

## Secrets

Secrets are stored in:

secrets/

Mounted inside containers at:

/run/secrets/