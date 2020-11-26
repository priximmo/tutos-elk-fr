%title: ELK
%author: xavki


# LOGSTASH : ETL et Input de type file


<br>


* ETL : Extract Transfert and Load

* Input > Filter  > Output

<br>


* filebeat = log shipper
		* léger

* logstash = centralisation

* configuration de base : /etc/logstash/logstash.yml
		* delay
		* queue...


<br>


* Inputs Plugins :
		* beats (filebeat...)
		* database (elasticsearch, redis,...)
		* drivers (jdbc..)
		* outils logs cloud (cloudwatch)
		* message queue (kafka, pubsub...)
		* fichiers
		* exec shell
		* twitter, meetup
		* sockets (unix...)

--------------------------------------------------------------------------


# LOGSTASH : ETL et Input de type file


<br>


* le plus simple


```
input {
        file {
        path => "/home/vagrant/myfiles/*.log"
        }
}
output {
        file {
        path => "/tmp/output.log"
        }
}
```

--------------------------------------------------------------------------


# LOGSTASH : ETL et Input de type file




<br>


* quelques options :

<br>


id => "xavki1"							> dissociation des input

<br>


delimiter => ";"  					> délimitation (défaut \n)

<br>


close_older => "1 hour"			> ferme le fichier au bout de x temps

<br>


stat_interval => "1 second"	> fréquence entre les checks d'un fichier

<br>


discover_interval => "10"		> 10 x stat_interval pour la découverte de fichiers

<br>


exclude => "/var/log/syslog.log\*" > fichiers à exclure

<br>


exit_after_read => "false"	> relacher el fichier à chaque fois (attention disable le disco)

<br>


mode => "read"							> read/tail : attente du EOF (tail reste à l'écoute)

<br>


file_completed_action => "delete"		> en mode read seulement
start_position => "beginning"

--------------------------------------------------------------------------


# LOGSTASH : ETL et Input de type file


<br>


sincedb_path => "/var/li/logstash/xxx"	> localisation du fichier data de pointeur

<br>


sincedb_clean_after => "7 days" 				> fréquence de nettoyage des timestamp

<br>


add_field => { "env" => "prod" }

<br>


codec => "plain"												> prétraitement (avant filter) 

<br>


type => "apache"												> variable spécific réutilisable (filtres/kibana...)
