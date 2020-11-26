%title: ELK
%author: xavki


# KIBANA : Discover - Lucene

<br>


* caractères inconnus

```
machine.os: w?n
```


<br>


* approximation

```
machine.os: wip~1
machine.os: wip~0.2
```

<br>


* proximité

```
message: "GET Mozilla"~1
message: "GET Mozilla"~100
```

* range inclusif

```
response: [200 TO 503]
response: [200 TO *]
```

* range exclusif

```
response: {200 TO 503}
```

* caractère spéciaux

```
message:/[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}/
```


