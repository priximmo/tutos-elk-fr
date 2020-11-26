%title: ELK
%author: xavki


# LOGSTASH : FILTERS - DATE


<br>


* date importante dans ELK => timestamp des évènements

* défaut => date de la collecte = date timestamp
	* décallage plus ou moins important (cron de filebeat, durée de processing...)

* plugin date permet de parser un champs pour en définir une date

<br>


* deux types d'opérations :
		* parsing
		* conversion

-----------------------------------------------------------------------

# LOGSTASH : FILTERS - DATE


<br>


PARSING :

* utiliser un pattern pour récupérer la date

```
filter {
  csv {
    columns => ["mydate", "action"]
    separator => ";"
    }
  date {
      match => [ "mydate", "dd/MM/yyyy  H:m:s" ]
    }
}
```

-----------------------------------------------------------------------

# LOGSTASH : FILTERS - DATE


<br>


CONVERSION : 

```
date +%s  # unix epoch en seconde
```

```
filter {
  csv {
    columns => ["mydate", "action"]
    separator => ";"
    }
  date {
      match => [ "mydate", "UNIX" ]
    }
  mutate {
      copy => { "[@timestamp]" => "mydate" }
    }
}
```
