FROM alpine:3.20.6

RUN apk update
RUN apk add mariadb mariadb-client bash

# COPY ./conf/mariadb.cnf /etc/mysql/mariadb.cnf
# RUN chmod 644 /etc/mysql/mariadb.cnf

COPY ./tools/mariadb-script.sh /usr/local/bin/mariadb-script.sh 
RUN chmod +x /usr/local/bin/mariadb-script.sh

RUN addgroup -S mariadb && adduser -S mariadb -G mariadb -h /var/lib/mariadb

RUN mkdir -p /tmp/mariadb && chown -R mariadb:mariadb /tmp/mariadb
RUN mkdir -p /run/mariadb && chown -R mariadb:mariadb /run/mariadb

COPY ./conf/mariadb.cnf /etc/my.cnf.d/mariadb.cnf
RUN chmod 644 /etc/my.cnf.d/mariadb.cnf

EXPOSE 3306

ENTRYPOINT [ "mariadb-script.sh" ]
