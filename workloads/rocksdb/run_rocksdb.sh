#!/bin/bash
if [ ! -n "$1" ]; then
        echo "usage: run_solr.sh [data size file] [operations] [workload file]"
else
        operations=10000
        workload=workload-read
        if [ ! -n "$2" ]; then
                operations=10000
        else
                operations=$2
        fi
        if [ ! -n "$3" ]; then
                workload=workload-read
        else
                workload=$3
        fi

        cd /home/epi/YCSB
        DATA_SIZE=$1
        sudo env "PATH=$PATH" taskset -c 57-63 bin/ycsb run rocksdb -P workloads/$workload -P workloads/$DATA_SIZE -p operationcount=$operations -p rocksdb.dir=/tmp/ycsb-rocksdb-data -p lock_memory=true -cp ./rocksdb/target/dependency/slf4j-simple-1.7.25.jar
fi

