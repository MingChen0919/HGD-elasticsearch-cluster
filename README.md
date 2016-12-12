# elasticsearch-cluster-on-cloud


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
