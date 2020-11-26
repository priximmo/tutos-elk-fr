%title: ELK
%author: xavki


# OPENDISTRO : Kibana et Password ADMIN


<br>


* installation de kibana :

```
sudo apt install opendistroforelasticsearch-kibana
```

<br>


* changemenet de la conf /etc/kibana/kibana.yml

```
server.host: "0.0.0.0"
```

<br>


* connexion

admin/admin

<br>


* génération d'un hash

```
cd /usr/share/elasticsearch/plugins/opendistro_security/securityconfig/
/usr/share/elasticsearch/plugins/opendistro_security/tools/hash.sh
vim /usr/share/elasticsearch/plugins/opendistro_security/securityconfig/internal_users.yml 
/usr/share/elasticsearch/plugins/opendistro_security/tools/securityadmin.sh /usr/share/elasticsearch/plugins/opendistro_security/securityconfig -icl -nhnv -cacert /etc/elasticsearch/root-ca.pem -cert /etc/elasticsearch/kirk.pem -key /etc/elasticsearch/kirk-key.pem
```

* test
