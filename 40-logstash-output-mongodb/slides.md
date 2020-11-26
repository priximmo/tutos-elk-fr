%title: ELK
%author: xavki


# LOGSTASH : OUTPUT - MONGODB


<br>


* installation de mongodb

```
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 4B7C549A058F8B6B
echo "deb [ arch=amd64 ] https://repo.mongodb.org/apt/ubuntu bionic/mongodb-org/4.2 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb.list
sudo apt update
sudo apt install mongodb-org
```

<br>


* création de la DB :

```
show databases
use xavkidb
```

-------------------------------------------------------------------------------------

# LOGSTASH : OUTPUT - MONGODB


<br>


* cf configuration de logstash + cf fichier

```
/usr/share/logstash/bin/logstash-plugin install --version=3.1.5 logstash-output-mongodb
```


<br>


* lister les documents

```
db.mycollect.find()
```

* clean

```
db.mycollect.drop()
db.dropDatabase() 
```

