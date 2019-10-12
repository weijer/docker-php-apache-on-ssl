# !/bin/sh

path=$1
servername=$2

mkdir -p ${path}
openssl genrsa -out ${path}/server.key 2048
openssl req -new -key ${path}/server.key -out ${path}/server.csr -subj '/C=CN/ST=BeiJing/L=BeiJing/O=CloudDisk/OU=Web/FE='${servername}
openssl x509 -in ${path}/server.csr -days 3650 -req -signkey ${path}/server.key -out ${path}/server.crt -config /usr/lib/ssl/openssl.cnf -extensions v3_req
