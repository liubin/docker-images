cd $KAFKA_HOME

nohup bin/zookeeper-server-start.sh config/zookeeper.properties &

nohup bin/kafka-server-start.sh config/server.properties &

tail -f nohup.out
