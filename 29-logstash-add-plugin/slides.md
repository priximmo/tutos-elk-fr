%title: ELK
%author: xavki


# LOGSTASH : ADD/UPDATE/REMOVE PLUGIN


<br>


* plugins : input / filter / output

* dépôt : https://github.com/logstash-plugins

<br>


* liste des plugins :

```
/usr/share/logstash/bin/logstash-plugin list
```

<br>


* deux types instalations :
		* en ligne
		* hors ligne

----------------------------------------------------------------------------

# LOGSTASH : ADD PLUGIN


<br>


HORS LIGNE :

* préparation du plugin

```
apt install ruby-bundler
git clone https://github.com/logstash-plugins/logstash-filter-alter.git
gem build logstash-filter-alter.gemspec
```

* ajout du plugin dans le fichier Gemfile de logstash

```
vim /usr/share/logstash/Gemfile
gem "logstash-filter-alter", :path => "/var/lib/logstash/plugins/logstash-filter-alter"
/usr/share/logstash/bin/logstash-plugin install --no-verify
``` 

* vérification

```
logstash -e 'filter {alter {}}'
```

----------------------------------------------------------------------------

# LOGSTASH : ADD PLUGIN


<br>


EN LIGNE : 

<br>


* check

```
./logstash-plugin list
```


<br>


* installation

```
./logstash-plugin install logstash-filter-bytes
```

<br>


* vérification

```
logstash -e 'filter {bytes {}}'
```

--------------------------------------------------------------------------


# LOGSTASH : REMOVE/UPDATE PLUGIN


<br>


* mise à jour

```
bin/logstash-plugin update logstash-filter-bytes
```

<br>


* suppression

```
bin/logstash-plugin remove logstash-filter-bytes
```
