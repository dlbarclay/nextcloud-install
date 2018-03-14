#!/usr/bin/env bash

source vars.sh

PACKAGES="$PACKAGES $PACKAGES_PHP7 $PACKAGES_COMMON"

if [ "$WEBSERVER" = "apache2" ]; then
    PACKAGES="$PACKAGES $PACKAGES_APACHE2"
fi

if [ "$WEBSERVER" = "nginx" ]; then
    PACKAGES="$PACKAGES $PACKAGES_NGINX"
fi

if [ "$DATABASE" = "postgresql" ]; then
    PACKAGES="$PACKAGES $PACKAGES_PGSQL"
fi

apt install -y $PACKAGES

