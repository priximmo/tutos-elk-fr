%title: ELK
%author: xavki


# ELK : installation Kibana


<br>


* visualisation

* exploitation

* assistant d'installation metrics/logs/SIEM

* jeux de données exemples

<br>


* debian :

```
sudo wget --directory-prefix=/opt/ https://artifacts.elastic.co/downloads/kibana/kibana-7.6.1-amd64.deb
sudo dpkg -i /opt/kibana*.deb
# edit /etc/kibana/kibana.yml
#server.host: "0.0.0.0"
sudo systemctl start kibana
sudo systemctl enable kibana
```

<br>


* centos :

```
sudo wget --directory-prefix=/opt/ https://artifacts.elastic.co/downloads/kibana/kibana-7.6.1-x86_64.rpm
sudo rpm -ivh /opt/kibana*.rpm
# edit /etc/kibana/kibana.yml
#server.host: "0.0.0.0"
sudo systemctl start kibana
sudo systemctl enable kibana
```
