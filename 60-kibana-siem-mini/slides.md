%title: ELK
%author: xavki


# SIEM : ex - iptables


SIEM : Security Information Management System

<br>


* installation de filebeat

```
wget --directory-prefix /opt/ https://artifacts.elastic.co/downloads/beats/filebeat/filebeat-7.6.1-amd64.deb
sudo dpkg -i /opt/filebeat*.deb
```

----------------------------------------------------------------------------

# SIEM : ex - iptables



<br>


* activation des logs iptables

```
iptables -A INPUT -p tcp --dport 80 -j LOG --log-prefix "IPTABLES "
iptables -L --line-numbers
iptables -D INPUT 1
```

<br>


* isolation des logs iptables

```
cat /etc/rsyslog.d/iptables.conf
:msg,contains,"IPTABLES " /var/log/iptables.log
& stop
```

```
systemctl restart rsyslog
```

----------------------------------------------------------------------------

# SIEM : ex - iptables


<br>


* configuration de filebeat

```
filebeat.inputs:
- type: log
  enabled: false
  paths:
    - /var/log/*.log
filebeat.config.modules:
  path: ${path.config}/modules.d/*.yml
  reload.enabled: false
setup.template.settings:
setup.kibana:
  host: "192.168.20.102:5601"
output.elasticsearch:
  hosts: ["192.168.20.102:9200"]
processors:
  - add_host_metadata: ~
```

----------------------------------------------------------------------------

# SIEM : ex - iptables


<br>


* activation du module iptables de filebeat

```
- module: iptables
  log:
    enabled: true
    var.input: "file"
    var.paths: ["/var/log/iptables.log"]
```

```
filebeat modules enable iptables
filebeat setup
```

