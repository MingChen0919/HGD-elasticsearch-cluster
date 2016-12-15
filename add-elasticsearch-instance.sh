#!/bin/bash

## ==== Usage example: create 2 clusters, each has 3 nodes === ========
## add-elasticsearch-instance.sh HGD-cluster-1 HGD-cluster-1-node-1 9201 2
## add-elasticsearch-instance.sh HGD-cluster-1 HGD-cluster-1-node-2 9202 2
## add-elasticsearch-instance.sh HGD-cluster-1 HGD-cluster-1-node-3 9203 2 

## add-elasticsearch-instance.sh HGD-cluster-2 HGD-cluster-2-node-1 9204 2
## add-elasticsearch-instance.sh HGD-cluster-2 HGD-cluster-2-node-2 9205 2
## add-elasticsearch-instance.sh HGD-cluster-2 HGD-cluster-2-node-3 9206 2
## ====================================================================

CLUSTER_NAME=$1
NODE_NAME=$2
PORT=$3
MINIMUM_MASTER_NODES=$4
ES_HEAP_SIZE=2g

## make a copy of init script of elasticsearch
cp -r /etc/init.d/elasticsearch "/etc/init.d/elasticsearch_${NODE_NAME}"
## make a copy of log directory
cp -r /var/log/elasticsearch "/var/log/elasticsearch_${NODE_NAME}" && chown -R elasticsearch:elasticsearch "/var/log/elasticsearch_${NODE_NAME}" 
## make a copy of data path
cp -r /var/lib/elasticsearch "/var/lib/elasticsearch_${NODE_NAME}" && chown -R elasticsearch:elasticsearch "/var/lib/elasticsearch_${NODE_NAME}"
## make a copy of configure file directory
cp -r /etc/elasticsearch "/etc/elasticsearch_${NODE_NAME}" && chown -R elasticsearch:elasticsearch "/etc/elasticsearch_${NODE_NAME}"
## make a copy of elasticsearch.pid file directory
cp -r /var/run/elasticsearch "/var/run/elasticsearch_${NODE_NAME}" && chown -R elasticsearch:elasticsearch "/var/run/elasticsearch_${NODE_NAME}"

## associate the copy of init script of elasticsearch with the new log, data, configure and pid path
sed  -i "s|export ES_HEAP_SIZE|export ES_HEAP_SIZE=${ES_HEAP_SIZE}|g" "/etc/init.d/elasticsearch_${NODE_NAME}"
sed  -i "s|LOG_DIR=\"/var/log/elasticsearch\"|LOG_DIR=\"/var/log/elasticsearch_${NODE_NAME}\"|g" "/etc/init.d/elasticsearch_${NODE_NAME}" 
sed  -i "s|DATA_DIR=\"/var/lib/elasticsearch\"|DATA_DIR=\"/var/lib/elasticsearch_${NODE_NAME}\"|g" "/etc/init.d/elasticsearch_${NODE_NAME}"
sed  -i "s|CONF_DIR=\"/etc/elasticsearch\"|CONF_DIR=\"/etc/elasticsearch_${NODE_NAME}\"|g" "/etc/init.d/elasticsearch_${NODE_NAME}"
sed  -i "s|PID_DIR=\"/var/run/elasticsearch\"|PID_DIR=\"/var/run/elasticsearch_${NODE_NAME}\"|g" "/etc/init.d/elasticsearch_${NODE_NAME}"


cd /etc/elasticsearch_"${NODE_NAME}"
echo "cluster.name : ${CLUSTER_NAME}" > elasticsearch.yml
echo "node.name : ${NODE_NAME}" >> elasticsearch.yml
#echo "node.master : false" >> elasticsearch.yml
#echo "node.data : true" >> elasticsearch.yml
echo "path.data : /var/lib/elasticsearch_${NODE_NAME}" >> elasticsearch.yml
echo "path.logs : /var/log/elasticsearch_${NODE_NAME}" >> elasticsearch.yml
echo "network.host : 0.0.0.0" >> elasticsearch.yml
echo "http.port : ${PORT}" >> elasticsearch.yml
echo "bootstrap.memory_lock : true" >> elasticsearch.yml
## no need to set the discovery.zen.ping.unicast.hosts when multiple nodes are in the same host.
#echo "discovery.zen.ping.unicast.hosts: ['0.0.0.0', '0.0.0.0: `expr ${PORT} + 100`']" >> elasticsearch.yml
echo "discovery.zen.minimum_master_nodes: ${MINIMUM_MASTER_NODES}" >> elasticsearch.yml

chown elasticsearch:elasticsearch elasticsearch.yml

