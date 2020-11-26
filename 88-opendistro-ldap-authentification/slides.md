%title: ELK
%author: xavki


# OPENDISTRO :  LDAP Authentication


<br>


* prérequis : cluster ES + LDAP (cf vagrantfile)


<br>


* Authentication <> Authorization

* accès <> permissions

<br>


* user LDAP : Alice/password

* source uid :

```
apt install ldap-utils
ldapsearch -x -LLL -H ldap://192.168.20.124 -b 'dc=example,dc=com' uid
```

----------------------------------------------------------------------------------------

# OPENDISTRO :  LDAP Authentication


<br>


* mise à jour config.yml

/usr/share/elasticsearch/plugins/opendistro_security/tools/securityadmin.sh /usr/share/elasticsearch/plugins/opendistro_security/securityconfig -icl -nhnv -cacert /etc/elasticsearch/root-ca.pem -cert /etc/elasticsearch/kirk.pem -key /etc/elasticsearch/kirk-key.pem

<br>


* création d'un nouveau user

* hash du password + fichier

```
slappasswd -h {SHA} -s xavki
ldapadd -xWD cn=admin,dc=example,dc=com -f create_user_xavki.ldif
```

* test connexion

```
ldapwhoami -vvv -h 192.168.20.124 -p 389 -D 'uid=xavki,ou=people,dc=example,dc=com' -x -W
```


<br>


* check

```
curl https://127.0.0.1:9200/_cluster/health?pretty --insecure -u alice:password
curl https://127.0.0.1:9200/_opendistro/_security/authinfo?pretty --insecure -u alice:password
```
