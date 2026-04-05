## Comparisons

### Virtual Machines vs Docker

**Virtual Machine**
- Full OS with its own kernel
- Strong isolation
- Heavy and slower

**Docker**
- Shares host kernel
- Lightweight and fast
- Designed for application isolation

In this project, a VM provides the base environment, while Docker isolates services.

---

### Secrets vs Environment Variables

**Environment Variables**
- Used for configuration
- Less secure for sensitive data

**Docker Secrets**
- Designed for confidential data
- Mounted as files inside containers

This project uses `.env` for configuration and Docker secrets for passwords.

---

### Docker Network vs Host Network

**Docker Network**
- Isolated communication between containers
- Containers communicate by service name

**Host Network**
- Shares host networking
- Less isolation
- Not allowed in this project

This project uses a Docker bridge network.

---

### Docker Volumes vs Bind Mounts

**Docker Volume**
- Managed by Docker
- Abstract storage

**Bind Mount**
- Direct mapping to host filesystem
- Full control over location

This project uses bind mounts under `/home/dpaluszk/data` to ensure persistence.

## Resources

### Documentation

- Docker documentation
- Docker Compose documentation
- NGINX documentation
- MariaDB documentation
- PHP-FPM documentation
- WordPress documentation
- WP-CLI documentation
- OpenSSL documentation

---

### AI usage

AI was used to:
- understand Docker concepts
- design container architecture
- debug configuration issues
- structure documentation

All generated content was reviewed, tested, and adapted.