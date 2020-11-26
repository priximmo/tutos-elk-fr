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
ldapsearch -x -LLL -H ldap://192.168.20.124 -b 'dc=example,dc=com' uid

```
