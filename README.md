*This project has been created as part of the 42 curriculum by dpaluszk.*

# Inception

## Description

Inception is a system administration project focused on Docker and Docker Compose. The goal is to build a small web infrastructure inside a virtual machine using multiple dedicated containers instead of one monolithic environment.

This project includes:
- an NGINX container as the only public entrypoint on port 443
- a WordPress + PHP-FPM container
- a MariaDB container
- a Docker network connecting the services
- persistent storage for database data and WordPress files
- Docker secrets for confidential values

The purpose of the project is to understand how containers communicate, how services are separated, how persistent data works, and how a reverse proxy connects to an application stack.

## Project Architecture

The stack is composed of three services:

- **NGINX**: handles HTTPS traffic and serves as the only external entrypoint
- **WordPress + PHP-FPM**: runs the application logic
- **MariaDB**: stores application data

Flow:

`Browser -> NGINX -> WordPress (PHP-FPM) -> MariaDB`

## Instructions

### Prerequisites

- Linux virtual machine
- Docker installed
- Docker Compose installed
- `make` installed

### Project structure

```text
.
├── Makefile
├── README.md
├── USER_DOC.md
├── DEV_DOC.md
├── secrets
│   ├── credentials.txt
│   ├── db_password.txt
│   ├── db_root_password.txt
│   └── wp_user_password.txt
└── srcs
    ├── docker-compose.yml
    └── requirements
        ├── mariadb
        │   ├── Dockerfile
        │   ├── conf/
        │   └── tools/
        ├── nginx
        │   ├── Dockerfile
        │   ├── conf/
        │   └── tools/
        └── wordpress
            ├── Dockerfile
            ├── conf/
            └── tools/