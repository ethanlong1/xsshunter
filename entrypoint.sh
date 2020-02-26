#!/bin/bash
service nginx start
service postgresql start
su - postgres -c "psql -d template1 -c 'CREATE USER xsshunter WITH PASSWORD '\''${password}'\'';'"
su - postgres -c "psql -d template1 -c 'CREATE DATABASE xsshunter;'"
/usr/bin/python2.7 /xsshunter/generate_config.py
sleep 20 &&  cp /xsshunter/ssl.crt /etc/nginx/ssl/${domain}.crt ; cp /xsshunter/ssl.key /etc/nginx/ssl/${domain}.key
nohup sh /xsshunter/gui/guiserver.sh
nohup sh /xsshunter/api/apiserver.py
tail -f /dev/null
