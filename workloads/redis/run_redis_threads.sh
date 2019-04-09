#!/bin/bash
if [ ! -n "$1" ]; then
        echo "please specify data size"
else
        operations=100000
        workload=workload-read
	threads=1
        if [! -n "$2" ]; then
                operations=10000
        else
                operations=$2
        fi
        if [! -n "$3" ]; then
                workload=workload-read
        else
                workload=$3
        fi
	if [ -z "$4" ]; then
		threads=1
	else
		threads=$4
	fi

        cd /home/epi/YCSB
        DATA_SIZE=$1
        bin/ycsb run redis -P workloads/$workload -P workloads/$DATA_SIZE -p "redis.host=numa-04" -p "redis.port=6379" -p operationcount=$operations -threads $threads
fi

