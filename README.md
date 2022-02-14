# Docker Setup for ASTRO Systems
Docker setup to contain all(PMS, VMS, Crewing, Purchasing, Astro -- Main) ASTRO systems.  

## Getting Started
Copy `.env` for docker in root directory
```
cp .env.example .env
```
Fill in variables
```
ENVIRONMENT=development                 # development/staging/production
PROJECT_NAME=YOUR_PROJECT_NAME_HERE     # Prefix for the docker containers to be created
MYSQL_ROOT_PASSWORD=p@ss1234!           # root password of the root mysql user
MYSQL_DATABASE=YOUR_DATABASE_NAME       # database that will be created
MYSQL_USER=YOUR_DATABASE_USER           # mysql user
MYSQL_PASSWORD=YOUR_DATABASE_USER       # user password
....
....
....
API_DOMAIN=api.app.loc
APP_DOMAIN=app.loc
```
For local development, add the following lines to host file:
```
192.168.99.100    app.loc api.app.loc
```
Note: Replace `192.168.99.100` with your docker machine IP.
