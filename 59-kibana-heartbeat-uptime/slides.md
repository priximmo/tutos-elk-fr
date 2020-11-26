%title: ELK
%author: xavki


# HEARTBEAT : disponilibité


<br>


* installation 

```
wget --directory-prefix /opt/ https://artifacts.elastic.co/downloads/beats/heartbeat/heartbeat-7.8.0-amd64.deb
sudo dpkg -i /opt/heartbeatbeat*.deb
```

<br>


* configuration elasticsearch et kibana

```
vim /etc/heartbeat/heartbeat.yml
```

