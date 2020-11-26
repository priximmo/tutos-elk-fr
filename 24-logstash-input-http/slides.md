%title: ELK
%author: xavki


# LOGSTASH : INPUT PLUGIN HTTP


<br>


* input http :
		* réception de requêtes http (appli, curl...)

```
input {
  http {
    host => "0.0.0.0"
    port => 8888
  }
}
output {
    elasticsearch {
      hosts => ["localhost:9200"]
      index => "http-%{+YYYY.MM.dd}"     
    }
}
```

<br>


* envoi

```
curl -H "content-type: application/json" -d '{"champs1": "monom",champs2": "salut"}' 192.168.20.102:8888/maroute2
```

-------------------------------------------------------------------

# LOGSTASH : INPUT PLUGIN HTTP


<br>


Quelques options :

* response_code

* response_headers

* tls/ssl 

* max_content_length

cf : https://www.elastic.co/guide/en/logstash/current/plugins-inputs-http.html
