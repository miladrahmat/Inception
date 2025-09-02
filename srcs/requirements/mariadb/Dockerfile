FROM alpine:3.20.6

RUN apk update
RUN apk add mariadb mariadb-client bash

COPY ./conf/mariadb.conf /etc/my.cnf.d/mariadb.conf
RUN chmod 644 etc/my.cnf.d/mariadb.conf

COPY ./tools/mariadb-script.sh /usr/local/bin/mariadb-script.sh 
RUN chmod +x /usr/local/bin/mariadb-script.sh

EXPOSE 3306

ENTRYPOINT [ "mariadb-script.sh" ]
