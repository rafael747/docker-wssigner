#!/bin/bash


if [ -d "/data/wssigner" ]
then
	# copy project files to another location
	cp -r /data/wssigner /tmp/

	# link log file to stdout 
	ln -sf /dev/stdout /tmp/wssigner/log/ws-signer.log

	# run maintenance script
	/maintenance.sh &

	# run the application
	cd /tmp/wssigner
	java -jar ws-signer.jar
else
	exit 1
fi


