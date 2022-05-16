---
title: "03 Installing Nginx"
date: 2022-05-16T15:58:21+05:30
draft: false
tags: ['guides', 'cloudcone', 'nginx']
---

**Table of Content:**

- [Installing Nginx:](#installing-nginx)
- [Setting up nginx as webserver for nextjs/gatsby](#setting-up-nginx-as-webserver-for-nextjsgatsby)
- [Setting up nginx as webserver for php](#setting-up-nginx-as-webserver-for-php)
- [Running multiple server blocks](#running-multiple-server-blocks)
- [Retreiving errors](#retreiving-errors)


#### Installing Nginx:

To install nginx, run the following command in terminal:

    $ sudo apt install nginx

#### Setting up nginx as webserver for nextjs/gatsby

Example config for reverse proxy:

    # example script for reverse proxy
    server {
        server_name example.xopun.com;
        location / {
                    # First attempt to serve request as file, then
                    # as directory, then fall back to displaying a 404.
                    proxy_pass http://localhost:5000;
                    proxy_http_version 1.1;
                    proxy_set_header Upgrade $http_upgrade;
                    proxy_set_header Connection 'upgrade';
                    proxy_set_header Host $host;
                    proxy_cache_bypass $http_upgrade;
            }
    }

{{< notification class="warning" >}}
If you get any errors stating Can't start Nginx - Job for nginx.service failed then especially check the line endings. Every line should end with a ";" otherwise this error will popup
{{< /notification >}}

#### Setting up nginx as webserver for php

Edit the following in nginx (`/etc/nginx/sites-enabled/default`):

    server {

        server_name example.xopun.com;
        listen 80;
        root /var/www/example.xopun.com;

        index index.php;

        location / {
                try_files $uri $uri/ /index.php?$query_string;
        }


        location ~ \.php$ {
            include snippets/fastcgi-php.conf;
            fastcgi_pass unix:/run/php/php8.0-fpm.sock;
        }

        location ~ /\.ht {
            deny all;
        }
    }

We are using the `php8.0-fpm` as the fastcgi gateway in order to serve the php files.

Restart the nginx server via `sudo systemctl restart nginx`. You can also test the nginx configuration by `sudo nginx -t`.

#### Running multiple server blocks

Just put them in their own file inside the server block as shown above. The files should be put in `/etc/nginx/sites-enabled/` folder.

#### Retreiving errors

    $ sudo tail /var/log/nginx/error.log -n 200
