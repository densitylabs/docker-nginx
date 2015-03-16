#!/bin/bash

echo 'showing nginx log'
tail -f /var/log/nginx/error.log &

echo 'running nginx'
nginx

