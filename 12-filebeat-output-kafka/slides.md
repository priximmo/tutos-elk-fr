%title: ELK
%author: xavki


# Filebeat : Output Kafka

<br>



docker run --net=host --rm confluentinc/cp-kafka:latest kafka-topics --bootstrap-server localhost:19092 --list
kafkacat -C -b 192.168.20.1:19092 -t filebeat
docker run --net=host --rm confluentinc/cp-kafka:latest kafka-topics --bootstrap-server localhost:19092 --topic filebeat --delete
