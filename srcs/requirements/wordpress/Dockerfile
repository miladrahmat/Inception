FROM alpine:3.20.6

RUN apk update
RUN apk add --no-cache mariadb-client \
	php83 \
	php83-fpm \
	php83-phar \
	php83-mysqli \
	php83-curl \
	php83-mbstring \
	curl \
	bash

COPY ./conf/www.conf /etc/php83/php-fpm.d/www.conf
ARG WEB_USER
ARG WEB_GROUP
RUN	echo "user = $WEB_USER" >> /etc/php83/php-fpm.d/www.conf
RUN echo "group = $WEB_GROUP" >> /etc/php83/php-fpm.d/www.conf

COPY ./conf/mem_override.ini /etc/php83/conf.d/mem_override.ini

COPY ./tools/wordpress-script.sh /bin/wordpress-script.sh
RUN chmod +x /bin/wordpress-script.sh

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /bin/wp

RUN mkdir -p /var/www/wp
RUN mkdir -p /var/www/html

RUN adduser -D -H -s /sbin/nologin -g ${WEB_GROUP} -G ${WEB_GROUP} ${WEB_USER}

EXPOSE 9000

WORKDIR /var/www/html

CMD [ "wordpress-script.sh" ]