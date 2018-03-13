#!/usr/bin/env bash

source vars.sh

tar -xjf $NEXTCLOUD_ARCHIVE -C $WWW_DIR
mkdir $NEXTCLOUD_DIR_DATA

chown -R www-data:www-data $NEXTCLOUD_DIR

cp $APACHE2_NEXTCLOUD_FILE $APACHE2_NEXTCLOUD_CONF
ln -s $APACHE2_NEXTCLOUD_CONF $APACHE2_NEXTCLOUD_ENAB