%title: ELK
%author: xavki


# Kibana : rollup


<br>


* agrégation de documents

* jobs à fréquence régulière

* ex : compaction sur des durées longues


<br>


* insertion de datas : https://github.com/oliver006/elasticsearch-test-data

```
python es_test_data.py --es_url=http://192.168.20.102:9200 --count=10000000 --dict_file=urls.txt --index_name=access_logs --format=url:dict:1:1,bytes:int:1337:9999,datetime:tstxt
```

