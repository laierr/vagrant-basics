#!/bin/bash

echo "HELL YEAH"

apt-get install -y nginx
service nginx restart

echo "W00T" > /usr/share/nginx/html/index.html
