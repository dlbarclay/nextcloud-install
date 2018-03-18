#!/usr/bin/env bash

source apt-packages.sh

BINDHOST=$(hostname)

WWW_DIR="/var/www"
NEXTCLOUD_DIR="$WWW_DIR/nextcloud"
NEXTCLOUD_DIR_DATA="$NEXTCLOUD_DIR/data"

NEXTCLOUD_ARCHIVE="latest-13.tar.bz2"
NEXTCLOUD_CHECKSUM="$NEXTCLOUD_ARCHIVE.sha256"
NEXTCLOUD_RELEASE_URI="https://download.nextcloud.com/server/releases"
NEXTCLOUD_DOWNLOAD_URI="$NEXTCLOUD_RELEASE_URI/$NEXTCLOUD_ARCHIVE"
NEXTCLOUD_CHECKSUM_URI="$NEXTCLOUD_RELEASE_URI/$NEXTCLOUD_CHECKSUM"

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

NGINX_SSL_CERT_DIR="/etc/nginx/ssl/keys"
NGINX_SSL_CERT_CRT="$NGINX_SSL_CERT_DIR/$BINDHOST.crt"
NGINX_SSL_CERT_KEY="$NGINX_SSL_CERT_DIR/$BINDHOST.key"

NGINX_SED_EXPR="s+__HOSTNAME+$BINDHOST+g;s+__SSL_DIR+$NGINX_SSL_CERT_DIR+g"
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
