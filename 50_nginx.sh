#!/bin/bash

echo 'showing nginx log'
mkdir -p /var/log/nginx/
tail --follow=name --retry /var/log/nginx/error.log &

echo 'testing configuration'
nginx -t

echo 'running nginx'
nginx

