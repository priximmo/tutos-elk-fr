%title: ELK
%author: xavki


# LOGSTASH : FILTERS - ALTER / DISSECT / CIDR 


<br>


DISSECT

* pattern de déouverte (champs/valeur)

ex : 

```
127.0.0.1 10/06/2020 13 TESTU;BEGIN;start job-0.1;10156
```

```
  dissect {
    mapping => {
      "message" => "%{ip} %{date} %{job_number} %{job_name};%{job_type};%{info};%{size}"
    }
  }
```

* en complément :
		* \+ : ajot à un autre champs
		* \? : pas de prise en compte du champs
    * \& : comme un pointeur (valeur d'un autre champs comme clef)

---------------------------------------------------------------------------------------------------

# LOGSTASH : FILTERS - ALTER / BYTES / CIDR 


<br>


CIDR

* check d'ip et action si valide

```
  cidr {
    add_tag => [ "localhost" ]
    add_field => { "localhost" => "true" }
    address => [ "%{ip}" ]
    network => [ "127.0.0.0/24" ]
  }
```

---------------------------------------------------------------------------------------------------

# LOGSTASH : FILTERS - ALTER / BYTES / CIDR 


<br>


ALTER

```
  alter {
    condrewriteother => [
      "job_type", "PROCESS", "new" ,"processus"
    ]
  }
```

* plusieurs options :
		* coalesce : fusion de champs
		* condrewrite : réécriture d'un champs
		* condrewriteother : réécriture/écriture d'un autre champs
