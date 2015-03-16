FROM ubuntu:14.04
MAINTAINER Federico Ramallo <framallo@gmail.com>

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && \
    apt-get install -y  nginx && \
    rm -rf /var/lib/apt/lists/*
    
RUN echo "daemon off;" >> /etc/nginx/nginx.conf
RUN sed -i -e '/http {/a client_max_body_size 100M;' /etc/nginx/nginx.conf 

VOLUME /var/log/nginx
EXPOSE 80

RUN rm /etc/nginx/sites-enabled/*
VOLUME /etc/nginx/sites-enabled

ADD *.sh /
RUN chmod +x /*.sh

CMD for f in /*.sh; do $f ; done

