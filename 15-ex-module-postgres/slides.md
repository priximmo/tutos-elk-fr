%title: ELK
%author: xavki


# FILEBEAT : module Postgresql


<br>


* collecte de logs postgres (y compris requêtes)

<br>


* installation de postgresql

```
apt install postgresql
```

<br>


* configuration du niveau de log

```
vim /etc/postgresql/10/main/postgresql.conf
log_directory = 'log'  
log_statement = 'all'   #ddl...
```



<br>


* configuration de filbeat et de son module postgresql

```
vim /etc/filebeat/modules.d/postgresql.yml.disabled

- module: postgresql
  log:
    enabled: true
    var.paths: ["/var/log/postgresql/*.log*"]

filebeat modules enable postgresql
```
