#!/bin/bash

# Verificações

[ -d "/data/wssigner" ] && echo "/data/wssigner folder...OK!" || { echo "ERRO: /data/wssigner folder not found!"; exit 1; }
[ -f "/run/secrets/CERT" ] && echo "/run/secrets/CERT secret/file...OK!" || { echo "ERRO: /run/secret/CERT secret/file not found!"; exit 1; }
[ -f "/run/secrets/CERT_PASS" ] && echo "/run/secrets/CERT_PASS secret/file...OK!" || { echo "ERRO: /run/secret/CERT_PASS secret/file not found!"; exit 1; }

# link log file to stdout 
ln -sf /dev/stdout /data/wssigner/log/ws-signer.log

# run maintenance script
/maintenance.sh &

# control secret files
export WS_SIGNER_PASSWORD=$(cat /run/secrets/CERT_PASS)
ln -s /run/secrets/CERT /data/wssigner/CERT.pfx

# run the application
cd /data/wssigner
java -jar ws-signer.jar


