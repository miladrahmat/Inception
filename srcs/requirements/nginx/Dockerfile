FROM alpine:3.20.6

RUN apk update
RUN apk add --no-cache nginx openssl

RUN mkdir -p /run/nginx
RUN mkdir -p /etc/nginx/ssl
COPY ./conf/nginx.conf /etc/my.cnf.d/nginx.conf
RUN chmod 644 /etc/my.cnf.d/nginx.conf

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]