#!/bin/bash
service nginx start
service postgresql start
su -i postgres -c "psql -d template1 -c 'CREATE USER xsshunter WITH PASSWORD ${};'"
su -i postgres -c "psql -d template1 -c 'CREATE DATABASE xsshunter;'"
/usr/bin/python2.7 /xsshunter/enerate_config.py
mv /cert/ssl_cert /etc/nginx/ssl/${}.crt
mv /cert/ssl_key /etc/nginx/ssl/${}.key
nohup sh /xsshunter/gui/guiserver.sh
nohup sh /xsshunter/api/apiserver.py
