#!/bin/bash
if [ ! -n "$1" ]; then
        echo "usage: run_solr.sh [data size file] [operations] [workload file]"
else
        operations=10000
        workload=workload-read
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

        cd /home/epi/YCSB
        DATA_SIZE=$1
        taskset -c 57-63 bin/ycsb run rocksdb -s -P workloads/$workload -P workloads/$DATA_SIZE -p operationcount=$operations -p rocksdb.dir=/tmp/ycsb-rocksdb-data
fi

