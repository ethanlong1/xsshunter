#!/bin/bash
service nginx start
service postgresql start
su - postgres -c "psql -d template1 -c 'CREATE USER xsshunter WITH PASSWORD '\''${password}'\'';'"
su - postgres -c "psql -d template1 -c 'CREATE DATABASE xsshunter;'"
/usr/bin/python2.7 /xsshunter/generate_config.py
mv /xsshunter/default /etc/nginx/sites-enabled/default
mkdir /etc/nginx/ssl/
echo "$crt" | base64 -d > /etc/nginx/ssl/${domain}.crt 
echo "$key" | base64 -d > /etc/nginx/ssl/${domain}.key
nohup sh /xsshunter/api/apiserver.sh
sleep 10
nohup sh /xsshunter/gui/guiserver.sh
