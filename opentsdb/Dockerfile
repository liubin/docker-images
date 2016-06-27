FROM petergrace/opentsdb-docker:2.2

MAINTAINER bin liu <liubin0329@gmail.com>

ADD opentsdb.conf /etc/

RUN cd /tmp && \
  cd wget http://downloads.sourceforge.net/project/gnuplot/gnuplot/5.0.3/gnuplot-5.0.3.tar.gz && \
  tar zxvf gnuplot-5.0.3.tar.gz  && \
  cd gnuplot-5.0.3 && \
  apk add gd gd-dev libpng libpng-dev  && \
  apk --update add --virtual builddeps build-base autoconf automake git python && \
  ./configure && \
  make && \
  make install && \
  apk del builddeps && rm -rf /var/cache/apk/* && \
  cd / && rm -rf /tmp/gnuplot*

