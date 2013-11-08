#!/bin/bash

echo "HELL YEAH"

apt-get install -y nginx

mkdir /opt/w00t

echo "W00T" > /opt/w00t/index.html

cat > /etc/nginx/sites-available/W00T <<CONF
server {
        listen 80;
        listen [::]:80 default_server ipv6only=on;

        root /opt/w00t;
        index index.html;

        server_name localhost;

		location / {
                # First attempt to serve request as file, then
                # as directory, then fall back to displaying a 404.
                try_files \$uri \$uri/ /index.html;
                # Uncomment to enable naxsi on this location
                # include /etc/nginx/naxsi.rules
        }
    }
CONF
link /etc/nginx/sites-available/W00T /etc/nginx/sites-enabled/W00T
unlink /etc/nginx/sites-enabled/default
service nginx restart
