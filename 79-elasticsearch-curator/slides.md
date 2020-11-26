%title: ELK
%author: xavki


# ElasticSearch Curator - Présentation et Installation


<br>


* doc https://www.elastic.co/guide/en/elasticsearch/client/curator/5.8/index.html

<br>


* deux binaires : curator_cli et curator

<br>


* manager vos index en automatisant :
		* aliases
		* create/delete index
		* open/close index
		* rollover index
		* create/delete snapshot
		* index settings
		* restore
		* merge/shrink
		* cluster/shard routing...

<br>


* installation debian

```
wget -qO - https://packages.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add -
echo "deb [arch=amd64] https://packages.elastic.co/curator/5/debian stable main" > /etc/apt/sources.list.d/curator.list
sudo apt update
sudo apt install elasticsearch-curator
curator --help
```

-----------------------------------------------------------------------------------

# ElasticSearch Curator - Présentation et Installation



<br>


* fichier de configuration (connexion)

```
mkdir -p ~/.curator/
cat ~/.curator/curator.yml
client:
  hosts:
    - 192.168.20.102
    - 192.168.20.106
    - 192.168.20.107
  port: 9200
  url_prefix:
  use_ssl: False
  certificate:
  client_cert:
  client_key:
  ssl_no_validate: False
  http_auth:
  timeout: 30
  master_only: False

logging:
  loglevel: INFO
  logfile:
  logformat: default
  blacklist: ['elasticsearch', 'urllib3']
```


```
curator_cli show_indices
```
