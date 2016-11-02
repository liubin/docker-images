FROM anapsix/alpine-java

MAINTAINER bin liu

RUN apk add --update wget coreutils

RUN cd /tmp && \
    wget http://ftp.riken.jp/net/apache/kafka/0.10.1.0/kafka_2.11-0.10.1.0.tgz && \
    tar xfz kafka_2.11-0.10.1.0.tgz -C /opt && \
    rm /tmp/kafka_2.11-0.10.1.0.tgz

VOLUME ["/kafka", "/zookeeper"]
EXPOSE 9092 2181

ENV KAFKA_HOME /opt/kafka_2.11-0.10.0.1

ADD start-kafka.sh $KAFKA_HOME/start-kafka.sh

ADD config/ $KAFKA_HOME/config/

RUN chmod a+x $KAFKA_HOME/start-kafka.sh

CMD ["$KAFKA_HOME/start-kafka.sh"]