# Elasticsearch cluster on cloud
This repository shows how to set up an elasticsearch cluster with 5 nodes on the cloud (jetstream cloud as an example).

## Launch 5 instances on jetstream and install elasticsearch

* Launch 5 instances
* Install elasticsearch

```
git clone https://github.com/MingChen0919/elasticsearch-cluster-on-cloud.git
cd elasticsearch-cluster-on-cloud
sudo sh install-elasticsearch.sh
```


## Install elasticsearch

```
sudo sh install-elasticsearch.sh
```

## Create some environmental variable

```
sh environmental_variables.sh $host_01 $host_02 $host_3
```

## Create elasticsearch node

```
sudo sh add-elasticsearch-master-node.sh $master_node_name 9200
```
