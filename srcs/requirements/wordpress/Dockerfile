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

RUN sed -i 's/127.0.0.1:9000/0.0.0.0:9000/' /etc/php83/php-fpm.d/www.conf \
	&& sed -i 's/user = nobody/user = nginx/' /etc/php83/php-fpm.d/www.conf \
	&& sed -i 's/group = nobody/group = nginx/' /etc/php83/php-fpm.d/www.conf

WORKDIR /var/www/html

RUN 