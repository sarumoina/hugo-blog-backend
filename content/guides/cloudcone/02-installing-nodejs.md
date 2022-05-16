---
title: "02. Installing Nodejs"
date: 2022-05-16T14:49:29+05:30
draft: false
tags: ['guides', 'cloudcone', 'nodejs']
---

In order to run the full stack server, at first, you will have to install nodejs. At the time of writing this article, nodejs is at version 14.0


    # Using Ubuntu
    $ curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash -
    $ sudo apt-get install -y nodejs

This will install nodejs 14.0 in your server.

{{< notification class="link" >}}

if executing sudo apt update returns with an error, then goto the cloudcone control panel > Firewall > Accept. It will update the packages without any hiccups after that
{{< /notification >}}

#### Downgrade nodejs

If you want to downgrade to older version then you can do it via the following:

    $ npm install -g n   # Install n globally
    $ n 14.17.0          # Install and use v0.10.33
