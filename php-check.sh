PHP7_MODULES=$(echo "ctype
    dom
    gd
    iconv
    json
    libxml
    mbstring
    posix
    simplexml
    xmlreader
    xmlwriter
    zip
    zlib
    pdo_sqlite
    pdo_mysql
    pdo_pgsql
    curl
    fileinfo
    bz2
    intl
    mcrypt
    openssl
    ldap
    smbclient
    ftp
    imap
    exif
    gmp
    apcu
    memcached
    redis
    imagick
    pcntl
")

ALL_MODULES=$(php -m)

for MOD in $PHP7_MODULES; do
    if [ -z "$(echo $ALL_MODULES | grep $MOD)" ] ; then
        echo $MOD
    fi
done
