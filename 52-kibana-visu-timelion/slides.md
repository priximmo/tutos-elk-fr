%title: ELK
%author: xavki


# KIBANA : VISU - Timelion

https://www.elastic.co/guide/en/kibana/current/timelion.html

<br>


* unique count clientip :

```
.es(index=kibana_sample_data_logs,
    timefield='@timestamp',
    metric='cardinality:clientip'),
```

<br>


* avec custom label

```
.es(index=kibana_sample_data_logs,
    timefield='@timestamp',
    metric='cardinality:clientip').label('today'),
```

<br>


* afficher un deuxième graphe

```
.es(index=kibana_sample_data_logs,
    timefield='@timestamp',
    metric='cardinality:clientip').label('today'),
.es(offset=-1d,  
    index=kibana_sample_data_logs,
    timefield='@timestamp',
    metric='cardinality:clientip')
    .label('last day')
```


--------------------------------------------------------------------------------------

# KIBANA : VISU - Timelion


<br>


* sur la moyenne des 5 derniers hits par heure

```
.es(index=kibana_sample_data_logs,
    timefield='@timestamp',
    metric='cardinality:clientip').label('today'),
.es(offset=-1d,  
    index=kibana_sample_data_logs,
    timefield='@timestamp',
    metric='cardinality:clientip')
    .label('last day')
    .mvavg(5)
```

<br>


* mise en forme


```
.es(index=kibana_sample_data_logs,
    timefield='@timestamp',
    metric='cardinality:clientip').label('today'),
.es(offset=-1d,  
    index=kibana_sample_data_logs,
    timefield='@timestamp',
    metric='cardinality:clientip')
    .label('last day')
    .mvavg(5)
    .lines(fill=0.5,width=0.1)
    .color(#1E90FF)
.title('Clients Visits')
```
