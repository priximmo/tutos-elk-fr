%title: ELK
%author: xavki


# ElasticSearch : cluster


<br>


* cluster = nécessaire en production

* ES est une base distribuée

<br>


* index > shards | replicas > documents > fields

<br>


* différents rôles :
		* master = responsable du cluster (notion de vote N/2 + 1)
		* datas	= porte des datas
		* clients = répond au client

<br>


* on part de noeuds avec ES non démarrés > tous clients et master

--------------------------------------------------------------------------------

# ElasticSearch : cluster


<br>



```
cluster.name: xavki
node.name: xavki1
node.master: true
node.data: true
path.data: /var/lib/elasticsearch
path.logs: /var/log/elasticsearch
network.bind_host: 0.0.0.0
network.host: 192.168.20.102
cluster.initial_master_nodes: ["xavki1"]
discovery.zen.ping.unicast.hosts: ["192.168.20.102", "192.168.20.106", "192.168.20.107"]
```


```
curl -XGET 127.0.0.1:9200/_cluster/health
```
