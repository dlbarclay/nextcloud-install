#!/usr/bin/env bash

source vars.sh

wget $NEXTCLOUD_DOWNLOAD_URI
wget $NEXTCLOUD_CHECKSUM_URI

sha256sum -c $NEXTCLOUD_CHECKSUM

