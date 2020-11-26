%title: ELK
%author: xavki


# LOGSTASH : FILTER - GROK : GROKPARSEFAILURE


<br>


* A surveiller avec grok : tags = grokparsefailure

* Logstash n'a pas pu parser la ligne comme il faut

* A traiter = un cas de figure non identifié

* exemple >> cf grok-parse-failure.conf  >> informations pas toujours présentent

<br>


* première chose mettre en place un système pour retrouver facilement les erreurs
		* par output
		* par kibana (kql adapté)

<br>


* corriger les erreurs
