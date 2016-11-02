## How to run

```
docker run -d --net=host --name=kafka liubin/kafka:0.10.1.0
```

Volumes:

- /zookeeper
- /kafka

Connect from producer/consumer use `kafka:9092`


## Test

### Create topic

```
docker exec kafka $KAFKA_HOME/bin/kafka-topics.sh --create --zookeeper localhost:2181 --replication-factor 1 --partitions 1 --topic test
```

### List topics

```
docker exec kafka $KAFKA_HOME/bin/kafka-topics.sh --list --zookeeper localhost:2181
```

### Send messages

```
docker exec kafka $KAFKA_HOME/bin/kafka-console-producer.sh --broker-list localhost:9092 --topic test
```

### Consume messages

```
docker exec kafka $KAFKA_HOME/bin/kafka-console-consumer.sh --bootstrap-server localhost:9092 --topic test --from-beginning
```
