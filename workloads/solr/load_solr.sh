#!/bin/bash
if [ ! -n "$1" ]; then
        echo "useage: load_solr.sh [data size file]"
else
        cd /home/epi/YCSB
        DATA_SIZE=$1
        bin/ycsb load solr -s -P workloads/workloada -P workloads/$DATA_SIZE -p table=ycsb_collection
fi
