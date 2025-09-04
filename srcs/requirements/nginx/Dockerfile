FROM alpine:3.20.6

RUN apk update
RUN apk add --no-cache nginx openssl

ARG WEB_USER
ARG WEB_GROUP

RUN mkdir -p /run/nginx
RUN mkdir -p /etc/nginx/ssl
RUN openssl req -x509 -nodes \
	-out /etc/nginx/ssl/certificate.crt \
	-keyout /etc/nginx/ssl/certificate.key \
	-subj "/C=FI/ST=Uusimaa/L=Helsinki/0=42/OU=Hive/CN=mrahmat-.42.fr"
COPY ./conf/nginx.conf /etc/nginx/nginx.conf
RUN chmod 644 /etc/nginx/nginx.conf
RUN echo "user $WEB_USER $WEB_GROUP;" >> /etc/nginx/nginx.conf

RUN adduser -D -H -s /sbin/nologin -g ${WEB_GROUP} -G ${WEB_GROUP} ${WEB_USER}
RUN mkdir -p /var/www/html
RUN chown -R ${WEB_USER}:${WEB_GROUP} /var/www/html
RUN chmod 755 /var/www/html

EXPOSE 443

CMD ["nginx", "-c", "/etc/nginx/nginx.conf", "-g", "daemon off;"]