#!/usr/bin/env bash

source vars.sh

pushd $NEXTCLOUD_DIR

sudo -u www-data php occ maintenance:install --database "mysql" --database-name "$DATABASE_NAME"  --database-user "root" --database-pass "$DATABASE_PASS" --admin-user "$ADMIN_USER" --admin-pass "$ADMIN_PASS"

popd

echo -e "\e[31mTODO:\e[39m Add trusted domains to config.php"
echo -e "\e[31mTODO:\e[39m Add pretty URLs to config.php"

