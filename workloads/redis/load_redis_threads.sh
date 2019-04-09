#!/bin/bash
if [ ! -n "$1" ]; then
        echo "please specify data size"
else
        cd /home/epi/YCSB
        DATA_SIZE=$1
	if [ -z "$2" ]; then
		threads=1
	else
		threads=$2
	fi
        bin/ycsb load redis -P workloads/workloada -P workloads/$DATA_SIZE -p "redis.host=numa-04" -p "redis.port=6379" -threads $threads
fi

