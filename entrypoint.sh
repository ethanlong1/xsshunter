#!/bin/bash
service nginx start
service postgresql start
su -i postgres -c "/xsshuner/postgres.sh"
su -i postgres -c "psql -d template1 -c 'CREATE DATABASE xsshunter;'"
/usr/bin/python2.7 /xsshunter/generate_config.py
mv /cert/ssl_cert /etc/nginx/ssl/${domain}.crt
mv /cert/ssl_key /etc/nginx/ssl/${domain}.key
#nohup sh /xsshunter/gui/guiserver.sh
#nohup sh /xsshunter/api/apiserver.py
