#!/usr/bin/env bash

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

if [ -n "$FCGI_ENABLED" ] ; then
    APACHE2_MODULES="$APACHE2_MODULES setenvif"
fi

DATABASE_NAME="nextcloud"
DATABASE_PASS="password"
ADMIN_USER="admin"
ADMIN_PASS="password"

NEXTCLOUD_CONFIG_PHP="$NEXTCLOUD_DIR/config/config.php"
