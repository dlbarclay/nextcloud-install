#!/usr/bin/env bash

source vars.sh

tar -xjf $NEXTCLOUD_ARCHIVE -C $WWW_DIR
mkdir $NEXTCLOUD_DIR_DATA

chown -R www-data:www-data $NEXTCLOUD_DIR

bash nginx-openssl-create.sh

if [ "$WEBSERVER" = "apache2" ]; then
    cp $APACHE2_NEXTCLOUD_FILE $APACHE2_NEXTCLOUD_CONF
    ln -s $APACHE2_NEXTCLOUD_CONF $APACHE2_NEXTCLOUD_ENAB
fi

if [ "$WEBSERVER" = "nginx" ]; then
    sed "$NGINX_SED_EXPR" $NGINX_NEXTCLOUD_SKEL > $NGINX_NEXTCLOUD_CONF
    ln -s $NGINX_NEXTCLOUD_CONF $NGINX_NEXTCLOUD_ENAB
fi
