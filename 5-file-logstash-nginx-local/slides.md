%title: ELK
%author: xavki


# Logstash : Nginx local


<br>


* configuration logstash

* input / filter / output

* filter > grok

<br>


* exemple qui n'existe pas dans la vraie vie

exporter les logs nginx vers ELK...
	nginx > logstash > elasticsearch < kibana

sur la même machine 

-----------------------------------------------------------------

# Logstash : Nginx local


<br>


* nginx pour logstash

```
sudo apt install nginx
sudo usermod -aG adm logstash
```

<br>


* fichier de patterns

```
mkdir /etc/logstash/pattern
chmod 755 -R /etc/logstash/pattern
cat /etc/logstash/pattern/nginx
NGUSERNAME [a-zA-Z\.\@\-\+_%]+
NGUSER %{NGUSERNAME}
```

Rq: https://grokdebug.herokuapp.com/

cf fichier de filtre joint


-----------------------------------------------------------------


IPORHOST : ip ou hostname
NGUSER : cf ng user
HTTPDATE : date 
WORD : mot (GET...)
URIPATHPARAM : chemin uri
NUMBER : nombre
