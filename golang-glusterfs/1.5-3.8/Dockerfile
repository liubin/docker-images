FROM golang:1.5

MAINTAINER bin liu

RUN apt-get update -y

RUN apt-get install -y apt-transport-https

RUN wget -O - https://download.gluster.org/pub/gluster/glusterfs/3.8/3.8.0/rsa.pub | apt-key add -

RUN echo deb https://download.gluster.org/pub/gluster/glusterfs/3.8/3.8.0/Debian/jessie/apt/ jessie main > /etc/apt/sources.list.d/gluster.list

RUN apt-get update -y

RUN apt-get install -y glusterfs-client

