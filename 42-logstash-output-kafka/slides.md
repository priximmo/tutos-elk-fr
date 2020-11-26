%title: ELK
%author: xavki


# LOGSTASH : OUTPUT - KAFKA

<br>


Run docker-compose

<br>



* quelques commandes kafka : liste / écoute / delete de topic

```
docker run --net=host --rm confluentinc/cp-kafka:latest kafka-topics --bootstrap-server localhost:19092 --list
kafkacat -C -b 192.168.20.1:19092 -t cmoilogstash
docker run --net=host --rm confluentinc/cp-kafka:latest kafka-topics --bootstrap-server localhost:19092 --topic cmoilogstash --delete
```

<br>



* conf de base

```
output {
  kafka {
    topic_id => "clogstash"
    bootstrap_servers => "192.168.20.1:19092,192.168.20.1:29092"
    codec => "json"
  }
}
```

------------------------------------------------------------------------------


# LOGSTASH : OUTPUT - KAFKA



<br>


* autres options
		* acks : 0, 1, all
		* message_key : ordre des message
		* partitionner : méthode de partition (hash de la clef de message > round robin...)
		* buffer_memory : producer kafka
		* batch_size : taille > producer > regroupement par partition
		* compression_type : none, gzip...
		* kerberos
		* tls
		* retries
