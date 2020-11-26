%title: ELK
%author: xavki


# Kibana : TLS / HTTPS


<br>


* exemple avec un certificat autosigné / openssl

* 2 solutions :
		* kibana seul = sans redirection
		* nginx frontal = avec redirection possible et passwd (si nécessaire)

<br>


SOLUTION NGINX

* génération du certificat

```
openssl req -x509 -newkey rsa:2048 -nodes -keyout kibana.key -out kibana.crt -days 365
```

* installation nginx

```
apt install nginx
```

<br>


* déplacement des certificats

```
mkdir -p /etc/ssl/certs /etc/ssl/private
mv kibana.crt /etc/ssl/certs/kibana.pem
mv kibana.key /etc/ssl/private/kibana.key
chown root:root /etc/ssl/certs/kibana.pem /etc/ssl/private/kibana.key
chmod 777 /etc/ssl/certs/kibana.pem
chmod 700 /etc/ssl/private/kibana.key
```

<br>


* si nécessaire htpasswd

```
apt-get install apache2-utils
sudo htpasswd -c /etc/nginx/conf.d/kibana.htpasswd xavki
```

----------------------------------------------------------------------------------------------------------------

# Kibana : TLS / HTTPS



<br>


* configuration nginx

```
server {
    listen 80;
    listen [::]:80;
    return 301 https://$host$request_uri;
}

server {
    listen 443 default_server;
    listen            [::]:443;
    ssl on;
    ssl_certificate /etc/ssl/certs/kibana-access.pem;
    ssl_certificate_key /etc/ssl/private/kibana-access.key;
    access_log            /var/log/nginx/nginx.access.log;
    error_log            /var/log/nginx/nginx.error.log;
    location / {
        auth_basic "Restricted";
        auth_basic_user_file /etc/nginx/conf.d/kibana.htpasswd;
        proxy_pass http://127.0.0.1:5601/;
    }
}
```

* restart nginx

```
systemctl restart nginx
```

<br>


* modification conf kibana.yml (0.0.0.0 > localhost)

