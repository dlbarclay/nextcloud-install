#!/usr/bin/env bash

source vars.sh

for MOD in $APACHE2_MODULES ; do
    a2enmod $MOD
    if [ $? -ne 0 ] ; then
        echo "FAILED!!! Check for apache2 module $MOD"
    fi
done

a2ensite default-ssl

systemctl restart "apache2"
