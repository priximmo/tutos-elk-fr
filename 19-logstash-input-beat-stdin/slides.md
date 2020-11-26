%title: ELK
%author: xavki


# LOGSTASH : INPUT PLUGIN BEAT


<br>


* type beat = écoute des producteurs de type beat

<br>


* exemples :
		* filebeat		: envoi de fichiers
		* metricbeat	: métriques
		* packetbeat	: réseau
		* winlogbeat	: évènements windows
		* auditbeat		: données d'audit (login...)
		* heartbeat 	: disponibilité

<br>


* principe d'écoute
		* ip/interface et ports


-------------------------------------------------------------


# LOGSTASH : ETL et Input de type BEAT


<br>


* modèle :

```
input {
  beats {
    port => 5044
  }
}
output {
   file {
      path => "/tmp/output.log"
   }
}
```

<br>


* host => "0.0.0.0"			> ip en écoute

<br>


* port => 5044					> obligatoire

<br>


* ssl : cf vidéo 14

<br>


* add_field => { "env" => "prod" }

* type => "mybeat"

* tags => ["tag1"]

-------------------------------------------------------------


# LOGSTASH : ETL et Input de type BEAT


<br>


* multi-input

```
input {
   beats {
     type => "svc1"
     tags => ["tag1"]
     port => 5044
     add_field => { "env" => "prod" }
   }
   stdin {
     type => "svc2"
   }
}
output {
   file {
      path => "/tmp/output.log"
   }
}
```

```
/usr/share/logstash/bin/logstash -f /etc/logstash/conf.d/file.conf
```
