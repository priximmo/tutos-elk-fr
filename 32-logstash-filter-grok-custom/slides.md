%title: ELK
%author: xavki


# LOGSTASH : FILTER - GROK CUSTOM


<br>


1er cas : le grok de grok (en deux temps)

* parfois plus intéressant que de faire des regex complex (performance)

```
filter {
  grok {
    match => {
      "message" => "%{IPORHOST:source} %{DATE_EU:date} %{USERNAME:utilisateur} %{INT:job_id} %{WORD:job_name};%{WORD:job_step};%{GREEDYDATA:comment};%{NUMBER:size}"
    }
  }
  grok {
    match => {
      "comment" => "%{GREEDYDATA:comment_after}"
    }
  }

  mutate {
     remove_field => [ "message" ]
     remove_field => [ "comment" ]
  }
}
```

-----------------------------------------------------------------------------------------------

# LOGSTASH : FILTER - GROK CUSTOM


<br>


CUSTOM PATTERNS

* modèle :

```
(?<field_name>[the pattern here])
```

PS : format regex like  https://github.com/kkos/oniguruma/blob/master/doc/RE

<br>


* exemple

```
  grok {
    match => {
      "comment" => "(?<job_version>job-[0-9.]*).*\{(?<nav>[a-zA-Z ]*)\}"
    }
  }
```

<br>


PATTERNS_DIR

* stockage de patterns via le patterns_dir

```
mkdir -p /etc/logstash/patterns
chmod 755 /etc/logstash/patterns
vim /etc/logstash/patterns/app1
echo "NAV [a-zA-Z ]*" > /etc/logstash/patterns/app1
```

```
  grok {
    patterns_dir => ["/etc/logstash/patterns"]
    match => {
      "comment" => "(?<job_version>job-[0-9.]*).*\{%{NAV:navigateur}\}"
    }
  }
```
