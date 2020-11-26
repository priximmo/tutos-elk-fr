%title: ELK
%author: xavki


# ELK : installation Logstash


<br>


* ETL

* Input / Filter / Output

* injection dans elasticsearch

<br>


* debian :

```
sudo apt install openjdk-11-jdk-headless
sudo wget --directory-prefix=/opt/ https://artifacts.elastic.co/downloads/logstash/logstash-7.6.1.deb
sudo dpkg -i /opt/logstash*.deb
sudo systemctl enable logstash
sudo systemctl start logstash
```

<br>


* centos :

```
sudo yum install -y java-11-openjdk-headless
sudo wget --directory-prefix=/opt/ https://artifacts.elastic.co/downloads/logstash/logstash-7.6.1.rpm
sudo rpm -ivh /opt/logstash*.rpm
sudo systemctl enable logstash
sudo systemctl start logstash
```
