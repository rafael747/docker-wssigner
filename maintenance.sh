#!/bin/bash

# script to monitor ws-signer state, and kill if it uses a lot of cpu

while true
do
	sleep 2m

	echo "[Maintenance] Checking ws-signer process..."

	pid=$(ps -eo %cpu,pid,command | grep '[j]ava' | awk '{print $1,$2,$3}')
	if [[ -n $pid ]]
	then
		kcpu=$(echo $pid | awk '{print $1}')
    		kpid=$(echo $pid | awk '{print $2}')
    		kcom=$(echo $pid | awk '{print $3}')
		kkill=$(echo $kcpu 90|awk '{if ($1 > $2) print 1; else print 0}')
    
		if [ $kkill -eq "1" ]
		then
			echo "[Maintenance] cpu usage=$kcpu --- Need to kill pid=$kpid"
        		kill $kpid
		else
			echo "[Maintenance] cpu usage=$kcpu --- Do not need to kill"
    		fi
	else
		echo "[Maintenance] PID not found!"
	fi
	
done

