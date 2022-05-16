---
title: "04 Installing Yarn"
date: 2022-05-16T17:36:14+05:30
draft: false
tags: ['guides', 'cloudcone', 'yarn']
---

To install yarn on the server, execute the following:

    $ curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
    $ echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
    $ sudo apt-get update && sudo apt-get install yarn

