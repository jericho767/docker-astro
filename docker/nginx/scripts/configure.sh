#!/bin/bash
mkdir -p /etc/nginx/ssl
# Replace the APP and API DOMAIN strings from default.conf file with the environment variable
sed -i "s|ASTRO_API_DOMAIN|$ASTRO_API_DOMAIN|g" /etc/nginx/conf.d/default.conf
sed -i "s|PMS_API_DOMAIN|$PMS_API_DOMAIN|g" /etc/nginx/conf.d/default.conf
sed -i "s|VMS_API_DOMAIN|$VMS_API_DOMAIN|g" /etc/nginx/conf.d/default.conf
sed -i "s|CREWING_API_DOMAIN|$CREWING_API_DOMAIN|g" /etc/nginx/conf.d/default.conf
sed -i "s|PURCHASING_API_DOMAIN|$PURCHASING_API_DOMAIN|g" /etc/nginx/conf.d/default.conf
sed -i "s|ASTRO_APP_DOMAIN|$ASTRO_APP_DOMAIN|g" /etc/nginx/conf.d/default.conf
sed -i "s|PMS_APP_DOMAIN|$PMS_APP_DOMAIN|g" /etc/nginx/conf.d/default.conf
sed -i "s|VMS_APP_DOMAIN|$VMS_APP_DOMAIN|g" /etc/nginx/conf.d/default.conf
sed -i "s|CREWING_APP_DOMAIN|$CREWING_APP_DOMAIN|g" /etc/nginx/conf.d/default.conf
sed -i "s|PURCHASING_APP_DOMAIN|$PURCHASING_APP_DOMAIN|g" /etc/nginx/conf.d/default.conf
# Replace the BACKEND DESTINATION DIRECTORY strings from default.conf file with the environment variable
sed -i "s|ASTRO_BE_DEST_DIR|$ASTRO_BE_DEST_DIR|g" /etc/nginx/conf.d/default.conf
sed -i "s|PMS_BE_DEST_DIR|$PMS_BE_DEST_DIR|g" /etc/nginx/conf.d/default.conf
sed -i "s|VMS_BE_DEST_DIR|$VMS_BE_DEST_DIR|g" /etc/nginx/conf.d/default.conf
sed -i "s|CREWING_BE_DEST_DIR|$CREWING_BE_DEST_DIR|g" /etc/nginx/conf.d/default.conf
sed -i "s|PURCHASING_BE_DEST_DIR|$PURCHASING_BE_DEST_DIR|g" /etc/nginx/conf.d/default.conf
# Replace the FRONTEND DESTINATION DIRECTORY strings from default.conf file with the environment variable
sed -i "s|ASTRO_FE_DEST_DIR|$ASTRO_FE_DEST_DIR|g" /etc/nginx/conf.d/default.conf
sed -i "s|PMS_FE_DEST_DIR|$PMS_FE_DEST_DIR|g" /etc/nginx/conf.d/default.conf
sed -i "s|VMS_FE_DEST_DIR|$VMS_FE_DEST_DIR|g" /etc/nginx/conf.d/default.conf
sed -i "s|CREWING_FE_DEST_DIR|$CREWING_FE_DEST_DIR|g" /etc/nginx/conf.d/default.conf
sed -i "s|PURCHASING_FE_DEST_DIR|$PURCHASING_FE_DEST_DIR|g" /etc/nginx/conf.d/default.conf

openssl dhparam -out /etc/nginx/ssl/dhparam.pem 2048

# Create Self-signed SSL Cert for APP Domain
if [ ! -z "$ASTRO_APP_DOMAIN" ]
then
openssl req -x509 -newkey rsa:4096 -sha256 -days 3650 -nodes \
  -keyout /etc/nginx/ssl/$ASTRO_APP_DOMAIN.key -out /etc/nginx/ssl/$ASTRO_APP_DOMAIN.cert -extensions san -config \
  <(echo "[req]";
    echo distinguished_name=req;
    echo "[san]";
    echo subjectAltName=DNS:$ASTRO_APP_DOMAIN,IP:10.0.0.1
    ) \
  -subj /CN=$ASTRO_APP_DOMAIN
fi

if [ ! -z "$PMS_APP_DOMAIN" ]
then
openssl req -x509 -newkey rsa:4096 -sha256 -days 3650 -nodes \
  -keyout /etc/nginx/ssl/$PMS_APP_DOMAIN.key -out /etc/nginx/ssl/$PMS_APP_DOMAIN.cert -extensions san -config \
  <(echo "[req]";
    echo distinguished_name=req;
    echo "[san]";
    echo subjectAltName=DNS:$PMS_APP_DOMAIN,IP:10.0.0.1
    ) \
  -subj /CN=$PMS_APP_DOMAIN
fi

if [ ! -z "$VMS_APP_DOMAIN" ]
then
openssl req -x509 -newkey rsa:4096 -sha256 -days 3650 -nodes \
  -keyout /etc/nginx/ssl/$VMS_APP_DOMAIN.key -out /etc/nginx/ssl/$VMS_APP_DOMAIN.cert -extensions san -config \
  <(echo "[req]";
    echo distinguished_name=req;
    echo "[san]";
    echo subjectAltName=DNS:$VMS_APP_DOMAIN,IP:10.0.0.1
    ) \
  -subj /CN=$VMS_APP_DOMAIN
fi

if [ ! -z "$CREWING_APP_DOMAIN" ]
then
openssl req -x509 -newkey rsa:4096 -sha256 -days 3650 -nodes \
  -keyout /etc/nginx/ssl/$CREWING_APP_DOMAIN.key -out /etc/nginx/ssl/$CREWING_APP_DOMAIN.cert -extensions san -config \
  <(echo "[req]";
    echo distinguished_name=req;
    echo "[san]";
    echo subjectAltName=DNS:$CREWING_APP_DOMAIN,IP:10.0.0.1
    ) \
  -subj /CN=$CREWING_APP_DOMAIN
fi

if [ ! -z "$PURCHASING_APP_DOMAIN" ]
then
openssl req -x509 -newkey rsa:4096 -sha256 -days 3650 -nodes \
  -keyout /etc/nginx/ssl/$PURCHASING_APP_DOMAIN.key -out /etc/nginx/ssl/$PURCHASING_APP_DOMAIN.cert -extensions san -config \
  <(echo "[req]";
    echo distinguished_name=req;
    echo "[san]";
    echo subjectAltName=DNS:$PURCHASING_APP_DOMAIN,IP:10.0.0.1
    ) \
  -subj /CN=$PURCHASING_APP_DOMAIN
fi

# Create Self-signed SSL Cert for API Domain
if [ ! -z "$ASTRO_API_DOMAIN" ]
then
openssl req -x509 -newkey rsa:4096 -sha256 -days 3650 -nodes \
  -keyout /etc/nginx/ssl/$ASTRO_API_DOMAIN.key -out /etc/nginx/ssl/$ASTRO_API_DOMAIN.cert -extensions san -config \
  <(echo "[req]";
    echo distinguished_name=req;
    echo "[san]";
    echo subjectAltName=DNS:$ASTRO_API_DOMAIN,IP:10.0.0.1
    ) \
  -subj /CN=$ASTRO_API_DOMAIN
fi

if [ ! -z "$PMS_API_DOMAIN" ]
then
openssl req -x509 -newkey rsa:4096 -sha256 -days 3650 -nodes \
  -keyout /etc/nginx/ssl/$PMS_API_DOMAIN.key -out /etc/nginx/ssl/$PMS_API_DOMAIN.cert -extensions san -config \
  <(echo "[req]";
    echo distinguished_name=req;
    echo "[san]";
    echo subjectAltName=DNS:$PMS_API_DOMAIN,IP:10.0.0.1
    ) \
  -subj /CN=$PMS_API_DOMAIN
fi

if [ ! -z "$VMS_API_DOMAIN" ]
then
openssl req -x509 -newkey rsa:4096 -sha256 -days 3650 -nodes \
  -keyout /etc/nginx/ssl/$VMS_API_DOMAIN.key -out /etc/nginx/ssl/$VMS_API_DOMAIN.cert -extensions san -config \
  <(echo "[req]";
    echo distinguished_name=req;
    echo "[san]";
    echo subjectAltName=DNS:$VMS_API_DOMAIN,IP:10.0.0.1
    ) \
  -subj /CN=$VMS_API_DOMAIN
fi

if [ ! -z "$CREWING_API_DOMAIN" ]
then
openssl req -x509 -newkey rsa:4096 -sha256 -days 3650 -nodes \
  -keyout /etc/nginx/ssl/$CREWING_API_DOMAIN.key -out /etc/nginx/ssl/$CREWING_API_DOMAIN.cert -extensions san -config \
  <(echo "[req]";
    echo distinguished_name=req;
    echo "[san]";
    echo subjectAltName=DNS:$CREWING_API_DOMAIN,IP:10.0.0.1
    ) \
  -subj /CN=$CREWING_API_DOMAIN
fi

if [ ! -z "$PURCHASING_API_DOMAIN" ]
then
openssl req -x509 -newkey rsa:4096 -sha256 -days 3650 -nodes \
  -keyout /etc/nginx/ssl/$PURCHASING_API_DOMAIN.key -out /etc/nginx/ssl/$PURCHASING_API_DOMAIN.cert -extensions san -config \
  <(echo "[req]";
    echo distinguished_name=req;
    echo "[san]";
    echo subjectAltName=DNS:$PURCHASING_API_DOMAIN,IP:10.0.0.1
    ) \
  -subj /CN=$PURCHASING_API_DOMAIN
fi
