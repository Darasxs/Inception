## How to access the admin panel

https://dpaluszk.42.fr/wp-admin

---

## Credentials

Credentials are stored in the `secrets/` directory:

- db_password.txt → database password
- db_root_password.txt → database root password
- credentials.txt → WordPress admin password
- wp_user_password.txt → WordPress user password

They are mounted inside containers at:

/run/secrets/

---

## How to check services

make ps

or

docker ps

---

## How to view logs

make logs

or

docker logs nginx
docker logs wordpress
docker logs mariadb

---

## How to verify the website

curl -k -I https://dpaluszk.42.fr