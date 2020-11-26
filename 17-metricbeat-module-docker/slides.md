%title: ELK
%author: xavki


# METRICBEAT : module docker


<br>


* installation 

```
wget --directory-prefix /opt/ https://artifacts.elastic.co/downloads/beats/metricbeat/metricbeat-7.6.1-amd64.deb
sudo dpkg -i /opt/metricbeat*.deb
```

<br>


* configuration elasticsearch et kibana

```
vim /etc/metricbeat/metricbeat.yml
```

<br>


* check module system

```
vim /etc/metricbeat/modules.d/docker.yml
```

* activation du module system et des dashboards

```
metricbeat modules enable docker
metricbeat setup 
metricbeat setup --dashboards
```
<br>


* ajout dashboard kibana
