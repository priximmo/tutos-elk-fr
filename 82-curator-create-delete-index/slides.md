%title: ELK
%author: xavki


# ElasticSearch Curator - Index


<br>


* suppression de l'index de test :

```
  2_delete_old_test:
    action: delete_indices
    description: delete test index
    options:
      continue_if_exception: True
      ignore_empty_list: True
    filters:
    - filtertype: pattern
      kind: prefix
      value: restored_communes
    - filtertype: age
      source: creation_date
      direction: younger
      unit: days
      unit_count: 2
```


<br>


* création de l'index du jour suivant :

```
actions:
  4_create_index_next_day:
    action: create_index
    description: create index for the day
    options:
      name: '<communes-{now/d+1d}>'
      continue_if_exception: True
      disable_action: False
      extra_settings:
        settings:
          number_of_shards: 6
          number_of_replicas: 2
```
