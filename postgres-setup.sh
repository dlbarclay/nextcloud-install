#!/usr/bin/env bash

CMD="CREATE USER nextcloud WITH PASSWORD 'password';"
echo "$CMD"
sudo -upostgres psql -c "$CMD"
CMD="CREATE DATABASE nextcloud TEMPLATE template0 ENCODING 'UNICODE';"
echo "$CMD"
sudo -upostgres psql -c "$CMD"
CMD="ALTER DATABASE nextcloud OWNER TO nextcloud;"
echo "$CMD"
sudo -upostgres psql -c "$CMD"
CMD="GRANT ALL PRIVILEGES ON DATABASE nextcloud TO nextcloud;"
echo "$CMD"
sudo -upostgres psql -c "$CMD"

