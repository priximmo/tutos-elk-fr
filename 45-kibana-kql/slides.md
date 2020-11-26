%title: ELK
%author: xavki


# KIBANA : Discover - KQL

<br>


La plus simple :

```
response : 200
```

<br>


Double conditions sur les champs : 

```
response: 200 and machine.os : "win xp"
```

<br>


Double conditions sur les valeurs :

```
response: (404 or 200) and machine.os : "win 7"
```

<br>


Négation

```
response : 200 and not machine.os : win
```

<br>


Wildcard

```
response : *0* and not machine.os : os*
```

<br>


Parenthèses

```
response : *0* and (machine.os: "win" or machine.os : os*)
```
