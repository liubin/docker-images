FROM ubuntu:trusty

EXPOSE 24007
EXPOSE 24007/udp
EXPOSE 24008
EXPOSE 24008/udp
EXPOSE 49152
EXPOSE 49153-59153
EXPOSE 2222

VOLUME ["/data/glusterfs"]

ENTRYPOINT ["/glusterfs/start.sh"]

RUN mkdir -p /var/run/sshd && chmod 755 /var/run/sshd

RUN apt-get update -y

RUN apt-get install -y openssh-server

RUN apt-get install -y software-properties-common \
  && add-apt-repository -y ppa:gluster/glusterfs-3.8 && apt-get update \
  && apt-get install -y glusterfs-server

ADD ./*.sh /glusterfs/
RUN chmod +x /glusterfs/*.sh
ADD sshd_config /etc/ssh/sshd_config

# Master only:
# CMD ["host1,host2,host3"]
