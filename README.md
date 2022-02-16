# TODO UPDATE THIS!

# Docker Setup for ASTRO Systems
Docker setup to contain all(PMS, VMS, Crewing, Purchasing, Astro -- Main) ASTRO systems.  

## Getting Started
Copy `.env` for docker in root directory
```
cp .env.example .env
```
Fill in variables
```
...
...
MYSQL_ROOT_PASSWORD=r00t!234 
MYSQL_DATABASE=astro
MYSQL_USER=username
MYSQL_PASSWORD=p@ssw0rd!
MAIL_NAME=mail.domain.jp
MAIL_HOST=email-smtp.us-east-1.amazonaws.com
MAIL_PORT=587
MAIL_USERNAME=AKIAJG2ZHDOL5JJ7O23Q
MAIL_PASSWORD=BAsPuqpqjA5dQTJAuNMsddGwANpOQdbgIoFFa5I74KyW
DOCKER_IP=172.0.0.0
TIMEZONE=Asia/Manila
....
....
```
Add the listed domains in the `.env` to the host file:
```
192.168.99.100 api.app-astro.loc app-astro.loc api.app-pms.loc app-pms.loc api.app-vms.loc app-vms.loc api.app-crewing.loc app-crewing.loc api.app-purchasing.loc app-purchasing.loc
```
Note: Replace `192.168.99.100` with your docker machine IP.
