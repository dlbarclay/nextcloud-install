#!/usr/bin/env bash

source vars.sh

#TARFILE="https://download.nextcloud.com/server/releases/latest-13.tar.bz2"
#SHA1SUM="https://download.nextcloud.com/server/releases/latest-13.tar.bz2.sha256"

NEXTCLOUD_DOWNLOAD_URI
NEXTCLOUD_CHECKSUM_URI

wget "$NEXTCLOUD_DOWNLOAD_URI"
wget "$NEXTCLOUD_CHECKSUM_URI"

sha1sum -c "$NEXTCLOUD_CHECKSUM"

if [ $? -ne 0 ]; then
    echo "$0: ERROR! Not downloaded correctly!"
fi

