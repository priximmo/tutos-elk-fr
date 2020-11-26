%title: Kubernetes 
%author: xavki


# Filebeat : Nginx


<br>



```
sudo rpm --import https://artifacts.elastic.co/GPG-KEY-elasticsearch
echo "[elastic-6.x]
name=Elastic repository for 6.x packages
baseurl=https://artifacts.elastic.co/packages/oss-6.x/yum
gpgcheck=1
gpgkey=https://artifacts.elastic.co/GPG-KEY-elasticsearch
enabled=1
autorefresh=1
type=rpm-md" | sudo tee /etc/yum.repos.d/elastic-beats.repo

sudo yum install -y filebeat
```



vim /etc/filebeat/filebeat.yml

```
#comment elastic
output.logstash:
  hosts: ["192.168.20.102:5044"]
```


```
filebeat modules list
filebeat modules enable nginx
yum install -y epel-release
yum install -y nginx
```


* ajout conf nginx pour logstash (cf fichier)

```
systemctl restart logstash
```
