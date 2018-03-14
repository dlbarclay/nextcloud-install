#!/usr/bin/env bash

source vars.sh

pushd $NEXTCLOUD_DIR

if [ ! -e $NEXTCLOUD_CONFIG_PHP ]; then
    echo "Nextcloud not installed. Installing nextcloud."

    if [ "$DATABASE" = "mysql" ]; then
        echo "Installing using mysql."
        sudo -u www-data php occ maintenance:install \
            --database "mysql" \
            --database-name "$DATABASE_NAME"  \
            --database-host="$DATABASE_HOST" \
            --database-user "root" \
            --database-pass "$DATABASE_PASS" \
            --admin-user "$ADMIN_USER" \
            --admin-pass "$ADMIN_PASS"
    fi
    
    if [ "$DATABASE" = "postgresql" ]; then
        echo "Installing using postgresql."
        sudo -u www-data php occ maintenance:install \
            --database="pgsql" \
            --database-name="$DATABASE_NAME" \
            --database-host="$DATABASE_HOST" \
            --database-user="$DATABASE_USER" \
            --database-pass="$DATABASE_PASS" \
            --admin-user="$ADMIN_USER" \
            --admin-pass="$ADMIN_PASS"
    fi
fi


echo -e "\e[31mTODO:\e[39m Add trusted domains to config.php"
sudo -u www-data php occ config:system:set trusted_domains 1 --value="$(hostname)"
sudo -u www-data php occ config:system:set trusted_domains 2 --value="$(hostname -f)"

echo -e "\e[31mTODO:\e[39m Add pretty URLs to config.php"
sudo -u www-data php occ config:system:set "overwrite.cli.url" --value="https://$(hostname -f)"
sudo -u www-data php occ config:system:set "htaccess.RewriteBase" --value="/"

#  "overwrite.cli.url" : "https://example.org/nextcloud",
#  "htaccess.RewriteBase" : "/nextcloud"


popd


