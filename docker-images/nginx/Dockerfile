FROM alpine:3.4

MAINTAINER Kevin Labesse <kevin@labesse.fr>

RUN apk add --update nginx

RUN echo "upstream php-upstream { server php:9000; }" > /etc/nginx/conf.d/upstream.conf
#RUN adduser -u 1000 -D -g '' -G nginx nginx

RUN rm -rf /var/cache/apk/* && rm -rf /tmp/*

CMD ["nginx"]

EXPOSE 80
EXPOSE 443
