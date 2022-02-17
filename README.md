# Docker Setup for ASTRO System
Docker setup to contain astro all(PMS, VMS, Crewing, Purchasing, Astro -- Main) ASTRO applications.  

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
127.0.0.1   api.app-astro.loc       app-astro.loc 
127.0.0.1   api.app-pms.loc         app-pms.loc 
127.0.0.1   api.app-vms.loc         app-vms.loc 
127.0.0.1   api.app-crewing.loc     app-crewing.loc 
127.0.0.1   api.app-purchasing.loc  app-purchasing.loc
```
Note: Replace `127.0.0.1` with your docker machine IP.

## Adding the codes for the listed applications
Checkout the respective codes and put them in their respective folders 
```
git clone git@github.com:jericho767/astro.git astro
git clone git@github.com:jericho767/astro-pms.git pms
git clone git@github.com:jericho767/astro-vms.git vms
git clone git@github.com:jericho767/astro-crewing.git crewing
git clone git@github.com:jericho767/astro-purchasing.git purchasing
```
For any modifications on the defined output directories, make alterations in the env as well:
```
###########################################################
##### SOURCE DIRECTORY OF LARAVEL CODE for all astro apps.
###########################################################
PMS_BE_SRC_DIR=./sites/pms/src/backend
VMS_BE_SRC_DIR=./sites/vms/src/backend
CREWING_BE_SRC_DIR=./sites/crewing/src/backend
PURCHASING_BE_SRC_DIR=./sites/purchasing/src/backend
ASTRO_BE_SRC_DIR=./sites/astro/src/backend
...
...
...
############################################################
##### SOURCE DIRECTORY OF FRONTEND CODE for all astro apps.
############################################################
PMS_FE_SRC_DIR=./sites/pms/src/frontend
VMS_FE_SRC_DIR=./sites/vms/src/frontend
CREWING_FE_SRC_DIR=./sites/crewing/src/frontend
PURCHASING_FE_SRC_DIR=./sites/purchasing/src/frontend
ASTRO_FE_SRC_DIR=./sites/astro/src/frontend
```

## Containers

Manipulate containers with the typical `docker-compose` commands.
