#!/usr/bin/env bash

PACKAGES_PHP7=$(echo "
    php7.0
    php7.0-bz2
    php7.0-cli
    php7.0-common
    php7.0-curl
    php7.0-gd
    php7.0-gmp
    php7.0-imap
    php7.0-intl
    php7.0-json
    php7.0-ldap
    php7.0-mbstring
    php7.0-mcrypt
    php7.0-mysql
    php7.0-pgsql
    php7.0-xml
    php7.0-zip
    php-apcu
    php-imagick
    php-memcached
    php-redis
    php-smbclient
")

PACKAGES_PGSQL=$(echo "
    postgresql-client postgresql
")

PACKAGES_APACHE=$(echo "
    apache2 libapache2-mod-php7.0
")

PACKAGES_NGINX=$(echo "
    
")

PACKAGES_COMMON=$(echo "
    ffmpeg
")

