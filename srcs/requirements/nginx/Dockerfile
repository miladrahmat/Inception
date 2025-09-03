FROM alpine:3.20.6

RUN apk update
RUN apk add --no-cache nginx openssl

RUN mkdir -p /run/nginx
RUN mkdir -p /etc/nginx/ssl
COPY ./conf/nginx.conf /etc/nginx/nginx.conf
RUN chmod 644 /etc/nginx/nginx.conf

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]