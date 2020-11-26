%title: ELK
%author: xavki


# LOGSTASH : INPUT PLUGIN JDBC / POSTGRESQL


<br>


* installation du driver postgresql pour JDBC

```
wget -o /usr/share/logstash/lib/ https://jdbc.postgresql.org/download/postgresql-42.2.13.jar
chmod 755 /usr/share/logstash/lib/postgresql-42.2.13.jar
```

<br>


* création postgres : USER/DB/TABLE

```
CREATE USER xavki ENCRYPTED PASSWORD 'xavki;' 
CREATE DATABASE xavki OWNER xavki;
CREATE TABLE tb2 (id SERIAL PRIMARY KEY, nom VARCHAR(255));
INSERT INTO tb2 (nom) VALUES ('Paul');
```

* postgresql.conf :  listen_address "\*"

* pg_hba.conf : 

```
local   all             all                                    trust
host    all             all             0.0.0.0/0              md5
```

* éventuellement sur le client

```
apt install postgresql-client-10
```

------------------------------------------------------------------------------

# LOGSTASH : INPUT PLUGIN JDBC / POSTGRESQL


<br>


* configuration logstash

```
input {
    jdbc {
        jdbc_connection_string => "jdbc:postgresql://192.168.20.104:5432/xavki"
        jdbc_user => "xavki"
        jdbc_password => "xavki"
        jdbc_driver_library => "/usr/share/logstash/lib/postgresql-42.2.13.jar"
        jdbc_driver_class => "org.postgresql.Driver"
        statement => "SELECT * from mytable"
    }
}
output {
  elasticsearch {
    hosts => "127.0.0.1"
    index => "pg-tb2"
    document_id => "%{id}"
  }
}
```

Rq : id / champs de référence


------------------------------------------------------------------------------

# LOGSTASH : INPUT PLUGIN JDBC / POSTGRESQL


<br>


* des champs complémentaires : add_fields, id, tags, type

<br>


* parameter => { "target_id" => "321" } : passer des paramètres

* schedule => "\* \* \* \* \*" 

* statement_filepath : chemin de fichier de requêtes


