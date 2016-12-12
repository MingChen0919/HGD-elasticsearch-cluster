# Elasticsearch cluster on cloud
This repository shows how to set up an elasticsearch cluster with 5 nodes on the cloud (jetstream cloud as an example). And this tutorial is for Centos OS.

## Launch 5 instances on jetstream and install elasticsearch

* Launch 5 instances
* Install elasticsearch

```
git clone https://github.com/MingChen0919/elasticsearch-cluster-on-cloud.git
cd elasticsearch-cluster-on-cloud
sudo sh install-elasticsearch.sh
```

## Modify `elasticsearch.yml` in each elasticsearch instance

Here we want to set three of the elasticsearch node as master node, and the other two as data node. By default the `elasticsearch.yml` is at `/etc/elasticsearch/elasticsearch.yml`

* Master node 1

```{xml}
cluster.name = my-claster
node.name = master-node-01
network.host = 0.0.0.0
discovery.zen.ping.unicast.hosts: ["149.165.170.63", "149.165.170.62", "149.165.157.69", "149.165.170.58", "149.165.157.68"] ## add the ip addresses of all jetstream instance that has a running elasticsearch node.
master.node = true
data.node = true
```

* Master node 2

```{xml}
cluster.name = my-claster
node.name = master-node-02
network.host = 0.0.0.0
discovery.zen.ping.unicast.hosts: ["149.165.170.63", "149.165.170.62", "149.165.157.69", "149.165.170.58", "149.165.157.68"] ## add the ip addresses of all jetstream instance that has a running elasticsearch node.
master.node = true
data.node = true
```


* Master node 3

```{xml}
cluster.name = my-claster
node.name = master-node-03
network.host = 0.0.0.0
discovery.zen.ping.unicast.hosts: ["149.165.170.63", "149.165.170.62", "149.165.157.69", "149.165.170.58", "149.165.157.68"] ## add the ip addresses of all jetstream instance that has a running elasticsearch node.
master.node = true
data.node = true
```



* Data node 1

```{xml}
cluster.name = my-claster
node.name = data-node-01
network.host = 0.0.0.0
discovery.zen.ping.unicast.hosts: ["149.165.170.63", "149.165.170.62", "149.165.157.69", "149.165.170.58", "149.165.157.68"] ## add the ip addresses of all jetstream instance that has a running elasticsearch node.
master.node = false
data.node = true
```


* Data node 2

```{xml}
cluster.name = my-claster
node.name = data-node-02
network.host = 0.0.0.0
discovery.zen.ping.unicast.hosts: ["149.165.170.63", "149.165.170.62", "149.165.157.69", "149.165.170.58", "149.165.157.68"] ## add the ip addresses of all jetstream instance that has a running elasticsearch node.
master.node = false
data.node = true
```

## Start elasticsearch from each of the 5 jetstream instance

```
sudo service elasticsearch start
```


