%title: ELK
%author: xavki


# LOGSTASH : FILTER - GROK


<br>


* INPUT > FILTER > OUTPUT

* Filter grok = parsing de données non structurées (non linéaire par exemple)

* utilisation de regulars expressions

<br>


* format

```
%{SYNTAX:SEMANTIC}
```

PS :
	* syntax : récupération de la data
	* semantic : variable de stockage
	* changement du type de champs de destination %{SYNTAX:SEMANTIC:int}
			* défaut string, uniquement vers int/float

<br>


```
%{SYNTAX1:VAR1} %{SYNTAX2:VAR2} %{SYNTAX3:VAR3} %{SYNTAX1:VAR4}
```

PS : une syntax peut en intégrer d'autres

<br>


* dissect VS grok :
		* grok = regex > plus forte variations du pattern
		* dissect plus rapide


---------------------------------------------------------------------------------------------------

# LOGSTASH : FILTER - GROK


<br>


* Liste de SYNTAX : https://github.com/logstash-plugins/logstash-patterns-core/blob/master/patterns/grok-patterns

* Communs :
			* INT : entier
			* NUMBER : float
			* IP : adresse ipv4/v6
			* IPORHOST : ip ou hostname
			* TIMESTAMP_ISO8601 : %{YEAR}-%{MONTHNUM}-%{MONTHDAY}[T ]%{HOUR}:?%{MINUTE}(?::?%{SECOND})?%{ISO8601_TIMEZONE}?
			* WORD : un mot (sans espace...)
			* GREEDYDATA : tous les caractères
			* USERNAME : min/maj, ".", "-", "_"
			* EMAILADDRESS
			* URIPATH : avec ou sans ":" puis "/" etc
			* URIHOST : hostname/ip + ":" + port
			* LOGLEVEL : debug, warn, warning...

* important de connaître les valeurs potentielles des champs (ex : ip ou hostname ou les deux)

---------------------------------------------------------------------------------------------------

# LOGSTASH : FILTER - GROK


<br>


* Construction via 
		* kibana > dev_tools > grokdebugger
		* https://grokdebug.herokuapp.com/ (patterns tout prêts)

<br>


* exemple :

```
127.0.0.1 10/06/2020 xavier.moi 13 TESTU;BEGIN;start job-0.1;10156.22
```

<br>


* décortiquons :
		* ip ou hostname >> IPORHOST
		* date avec quel format >> DATE_EU
		* identifiant prénom.nom >> USERNAME
		* un entier (toujours ?) >> INT
		* un mot ou plusieurs ? un >> WORD
		* changement de séparateur
		* un autre mot seul >> WORD
		* une phrase pas de spécificités >> GREEDYDATA (attention on garde pas le champs)
		* un nombre à décimales >> NUMBER

<br>


* résultat

```
%{IPORHOST:source} %{DATE_EU:date} %{USERNAME:utilisateur} %{INT:job_id} %{WORD:job_name};%{WORD:job_step};%{GREEDYDATA};%{NUMBER:size}
```


----------------------------------------------------------------------------------------------------

# LOGSTASH : FILTER - GROK


<br>


OPTIONS :

* overwrite

```
    filter {
      grok {
        match => { "message" => "%{SYSLOGBASE} %{DATA:message}" }
        overwrite => [ "message" ]
      }
    }
```

<br>


* break_on_match : arrêt dès le premier matching

* custom pattern : cf prochaine vidéo
