#!/usr/bin/env bash

export WEBSERVER="nginx"
export DATABASE="postgresql"


DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
pushd $DIR


source vars.sh

bash install-packages.sh
bash install-files.sh
bash install-nextcloud.sh


popd

