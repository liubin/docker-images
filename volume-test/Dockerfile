FROM alpine:3.4

VOLUME ["/var/lib/mysql", "/var/lib/postgres"]

ADD start.sh /start.sh
RUN chmod +x /start.sh

CMD ["/start.sh"]
