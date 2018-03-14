#!/usr/bin/env bash

source apt-packages.sh

WWW_DIR="/var/www"
NEXTCLOUD_DIR="$WWW_DIR/nextcloud"
NEXTCLOUD_DIR_DATA="$NEXTCLOUD_DIR/data"

NEXTCLOUD_ARCHIVE="nextcloud-13.0.0.tar.bz2"
NEXTCLOUD_CHECKSUM="nextcloud-13.0.0.tar.bz2.sha256"
NEXTCLOUD_DOWNLOAD_URI="https://download.nextcloud.com/server/releases/$NEXTCLOUD_ARCHIVE"
NEXTCLOUD_CHECKSUM_URI="https://download.nextcloud.com/server/releases/$NEXTCLOUD_CHECKSUM"

APACHE2_NEXTCLOUD_FILE="apache2-site.conf"
APACHE2_NEXTCLOUD_CONF="/etc/apache2/sites-available/nextcloud.conf"
APACHE2_NEXTCLOUD_ENAB="/etc/apache2/sites-enabled/nextcloud.conf"
APACHE2_MODULES=$(echo "
    rewrite
    headers
    env
    dir
    mime
    ssl
")

NGINX_SSL_CERT_DIR="/etc/ssl/nginx"
NGINX_SSL_CERT_CRT="$NGINX_SSL_CERT_DIR.crt"
NGINX_SSL_CERT_KEY="$NGINX_SSL_CERT_DIR.key"

NGINX_SED_EXPR="s+__HOSTNAME+$(hostname -f)+g;s+__SSL_DIR+$NGINX_SSL_CERT_DIR+g"
NGINX_NEXTCLOUD_SKEL="nginx-site.conf.skel"
NGINX_NEXTCLOUD_CONF="/etc/nginx/sites-available/nextcloud.conf"
NGINX_NEXTCLOUD_ENAB="/etc/nginx/sites-enabled/nextcloud.conf"
NGINX_MODULES=$(echo "
")

if [ -n "$FCGI_ENABLED" ] ; then
    APACHE2_MODULES="$APACHE2_MODULES setenvif"
fi

DATABASE_NAME="nextcloud"
DATABASE_USER="nextcloud"
DATABASE_PASS="password"
DATABASE_HOST="localhost"
ADMIN_USER="admin"
ADMIN_PASS="password"

NEXTCLOUD_CONFIG_PHP="$NEXTCLOUD_DIR/config/config.php"
