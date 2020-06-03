%title: ELK
%author: xavki


# LOGSTASH : INPUT PLUGIN EXEC ET TCP


<br>
* exécution d'une commande classique

* attention : logstash n'est pas souvent le bon choix

* bash / python / ruby / perl

<br>
* principe :

```
input {
   exec {
     type => "apps"
     command => "/home/vagrant/hello-xavki.sh"
     interval => "10"
   }
}
```

PS : gestion du timing
		* interval : en seconde
		* schedule : 0 \* \* \* \* (façon linux)

<br>
* add_field => { "env" => "prod" }

* type => "mybeat"

* tags => ["tag1"]

-----------------------------------------------------------------------------


# LOGSTASH : INPUT PLUGIN EXEC ET TCP


<br>
* et en TCP ? pull ou push ?

* mode => "server" : ou client

* port => 11111


```
   tcp {
     type => "app2"
     mode => "server"
     port => 11111
   }
```
