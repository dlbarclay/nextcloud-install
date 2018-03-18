#!/usr/bin/env bash

source vars.sh

mkdir -pv $NGINX_SSL_CERT_DIR

echo "\e[31mTODO:\e[39m Add automated install using pre-defined openssl configuration"

openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout $NGINX_SSL_CERT_KEY -out $NGINX_SSL_CERT_CRT

# Set up the access privileges for certificates
chown -R root:www-data $NGINX_SSL_CERT_DIR
chmod 710 $NGINX_SSL_CERT_DIR
chmod 640 $NGINX_SSL_CERT_CRT $NGINX_SSL_CERT_CRT

