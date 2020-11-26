%title: ELK
%author: xavki


# OPENDISTRO : Cluster elasticsearch


<br>


modifier le /etc/elasticsearch/elasticsearch.yml

```
cluster.name: xavki
node.name: oes1
node.master: true
node.data: true
path.data: /var/lib/elasticsearch
path.logs: /var/log/elasticsearch
network.bind_host: 0.0.0.0
network.host: 192.168.20.120
cluster.initial_master_nodes: ["oes1"]
discovery.zen.ping.unicast.hosts: ["192.168.20.120", "192.168.20.121", "192.168.20.122"]
######## Start OpenDistro for Elasticsearch Security Demo Configuration ########
# WARNING: revise all the lines below before you go into production
opendistro_security.ssl.transport.pemcert_filepath: esnode.pem
opendistro_security.ssl.transport.pemkey_filepath: esnode-key.pem
opendistro_security.ssl.transport.pemtrustedcas_filepath: root-ca.pem
opendistro_security.ssl.transport.enforce_hostname_verification: false
opendistro_security.ssl.http.enabled: true
opendistro_security.ssl.http.pemcert_filepath: esnode.pem
opendistro_security.ssl.http.pemkey_filepath: esnode-key.pem
opendistro_security.ssl.http.pemtrustedcas_filepath: root-ca.pem
opendistro_security.allow_unsafe_democertificates: true
opendistro_security.allow_default_init_securityindex: true
opendistro_security.authcz.admin_dn:
  - CN=kirk,OU=client,O=client,L=test, C=de
opendistro_security.audit.type: internal_elasticsearch
opendistro_security.enable_snapshot_restore_privilege: true
opendistro_security.check_snapshot_restore_write_privileges: true
opendistro_security.restapi.roles_enabled: ["all_access", "security_rest_api_access"]
cluster.routing.allocation.disk.threshold_enabled: false
node.max_local_storage_nodes: 3
######## End OpenDistro for Elasticsearch Security Demo Configuration ########
```


<br>



* password ADMIN et KIBANASERVER

```
cd /usr/share/elasticsearch/plugins/opendistro_security/securityconfig/
/usr/share/elasticsearch/plugins/opendistro_security/tools/hash.sh
vim /usr/share/elasticsearch/plugins/opendistro_security/securityconfig/internal_users.yml 
/usr/share/elasticsearch/plugins/opendistro_security/tools/securityadmin.sh /usr/share/elasticsearch/plugins/opendistro_security/securityconfig -icl -nhnv -cacert /etc/elasticsearch/root-ca.pem -cert /etc/elasticsearch/kirk.pem -key /etc/elasticsearch/kirk-key.pem
```

* sur le premier noeud et modifier les internal_users.yml sur les autres noeuds (restart ES)


<br>


* installation kibana

```
sudo apt install opendistroforelasticsearch-kibana
```
