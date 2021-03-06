#!/bin/bash
service nginx start
service postgresql start
su - postgres -c "psql -d template1 -c 'CREATE USER xsshunter WITH PASSWORD '\''${password}'\'';'"
su - postgres -c "psql -d template1 -c 'CREATE DATABASE xsshunter;'"
cd /xsshunter ; ./generate_config.py
sleep 5 && mv /xsshunter/default /etc/nginx/sites-enabled/default
mkdir /etc/nginx/ssl/
echo "$crt" | base64 -d > /etc/nginx/ssl/${domain}.crt 
echo "$key" | base64 -d > /etc/nginx/ssl/${domain}.key
service nginx restart
mkdir /xsshunter/api/uploads
sleep 10 && nohup sh /xsshunter/api/apiserver.sh | nohup sh /xsshunter/gui/guiserver.sh
