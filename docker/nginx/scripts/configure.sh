#!/bin/bash
mkdir -p /etc/nginx/ssl
sed -i "s/API_DOMAIN/$API_DOMAIN/g" /etc/nginx/conf.d/default.conf
sed -i "s/APP_DOMAIN/$APP_DOMAIN/g" /etc/nginx/conf.d/default.conf
openssl dhparam -out /etc/nginx/ssl/dhparam.pem 2048

# Create Self-signed SSL Cert for APP Domain
if [ ! -z "$APP_DOMAIN" ]
then
openssl req -x509 -newkey rsa:4096 -sha256 -days 3650 -nodes \
  -keyout /etc/nginx/ssl/$APP_DOMAIN.key -out /etc/nginx/ssl/$APP_DOMAIN.cert -extensions san -config \
  <(echo "[req]";
    echo distinguished_name=req;
    echo "[san]";
    echo subjectAltName=DNS:$APP_DOMAIN,IP:10.0.0.1
    ) \
  -subj /CN=$APP_DOMAIN
fi

# Create Self-signed SSL Cert for API Domain
if [ ! -z "$API_DOMAIN" ]
then
openssl req -x509 -newkey rsa:4096 -sha256 -days 3650 -nodes \
  -keyout /etc/nginx/ssl/$API_DOMAIN.key -out /etc/nginx/ssl/$API_DOMAIN.cert -extensions san -config \
  <(echo "[req]";
    echo distinguished_name=req;
    echo "[san]";
    echo subjectAltName=DNS:$API_DOMAIN,IP:10.0.0.1
    ) \
  -subj /CN=$API_DOMAIN
fi
