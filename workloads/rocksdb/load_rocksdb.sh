#!/bin/bash
if [ ! -n "$1" ]; then
        echo "useage: load_solr.sh [data size file]"
else
        cd /home/epi/YCSB
        DATA_SIZE=$1
        bin/ycsb load rocksdb -s -P workloads/workloada -P workloads/$DATA_SIZE -p rocksdb.dir=/tmp/ycsb-rocksdb-data
fi
