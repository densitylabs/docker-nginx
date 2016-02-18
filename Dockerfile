FROM ubuntu:14.04
MAINTAINER Federico Ramallo <framallo@gmail.com>

ENV DEBIAN_FRONTEND=noninteractive
ENV NGINX_VERSION 1.9.11-1~trusty

RUN apt-key adv --keyserver hkp://pgp.mit.edu:80 --recv-keys 573BFD6B3D8FBC641079A6ABABF5BD827BD9BF62 \
	&& echo "deb http://nginx.org/packages/mainline/ubuntu/ trusty nginx" >> /etc/apt/sources.list \
	&& apt-get update \
	&& apt-get install -y ca-certificates nginx=${NGINX_VERSION} gettext-base \
	&& rm -rf /var/lib/apt/lists/*

RUN echo "daemon off;" >> /etc/nginx/nginx.conf
RUN sed -i -e '/http {/a client_max_body_size 100M;' /etc/nginx/nginx.conf

EXPOSE 80 443

VOLUME /var/log/nginx
VOLUME /sites

RUN mkdir -p /var/log/nginx/

ADD *.sh /
RUN chmod +x /*.sh

CMD for f in /*.sh; do $f ; done
