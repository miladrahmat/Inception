FROM alpine:3.20.6

RUN apk update
RUN apk add --no-cache \
	php83 \
	php83-fpm \
	php83-mysqli \
	php83-curl \
	php83-json \
	php83-mbstring \
	php83-xml \
	php83-zip \
	php83-gd \
	curl \
	bash \
	tar \
	less

COPY ./conf/wordpress.conf /etc/php83/php-fpm.d/www.conf
ARG WEB_USER
ARG WEB_GROUP
RUN	echo "user = $WEB_USER" >> /etc/php83/php-fpm.d/www.conf
RUN echo "group = WEB_GROUP" >> /etc/php83/php-fpm.d/www.conf

COPY ./tools/wordpress-script.sh /bin/wordpress-script.sh
RUN chmod +x /bin/wordpress-script.sh

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /bin/wp

WORKDIR /var/www/html

RUN 