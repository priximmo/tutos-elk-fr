%title: ELK
%author: xavki


# LOGSTASH : OUTPUT - FILE - CSV - EXEC


<br>


* INPUT > FILTER > OUTPUT


<br>


* output : très nombreux
		* file
		* elasticsearch
		* influxdb
		* kafka
		* pubsub
		* csv
		* cloudwatch
		* mongodb
		* gelf
		* pipe
		* redmine
		* sns
		* syslog
		* tcp / http 

-----------------------------------------------------------------

# LOGSTASH : OUTPUT - FILE - CSV - EXEC



<br>


FILE

* la base

```
output {
  file {
    path => "/tmp/output.log"
  }
}
```

<br>


OPTIONS

* create_if_deleted : true default > créer ou pas le fichier

* file_mode : permissions du fichier (0640)

* flush_interval : fréquence d'écriture sur disque (2s) si 0 en continu

* gzip : compression du fichier de sortie

* path : chemin et fichier éventuellement avec des variables

* write_behavior : append/overwrite

-----------------------------------------------------------------

# LOGSTASH : OUTPUT - FILE - CSV - EXEC


<br>


CSV

* idem file (fields obligatoire)

```
output {
  csv {
    fields => ["message","host","path"]
    path => "/tmp/%{host}/output-%{+YYYY-MM-dd}.log"
    csv_options => {
      "col_sep" => "|"
      }
  }
}
```


----------------------------------------------------------------------

# LOGSTASH : OUTPUT - FILE - CSV - EXEC


<br>


* ajout du plugin

```
bin/logstash-plugin install logstash-output-exec
```

<br>


* configuration

```
filter {
  dissect {
    mapping => {
      "message" => "%{sourceip} %{date} %{other}"
    }
    add_tag => ["blacklist"]
  }
}
output {
  if "blacklist" in [tags] {
    exec {
      command => " echo 'iptables -A INPUT -s %{sourceip} -j DROP' >> /tmp/drop.rules"
    }
  }
}
```
