---
title: "01. Installing the OS"
date: 2022-05-16T13:06:50+05:30
draft: false
tags: ['guides', 'cloudcone']
---

**Table of Content:**

- [installing the os](#installing-the-os)
- [Login to the server](#login-to-the-server)
- [Changing Date & time](#changing-datetime)

#### Installing the OS

You'll require SSH keys in order to prevent logging in to computer with a password everytime.

**local computer**


    $ ssh-keygen
    # Follow the onscreen directions in order to generate the public and the private pair
    $ cat YOUR_KEY.pub
    # The public key will appear
    # Copy the public key.

**In cloudcone web dashboard**

Now go to the profile section in the dashboard of cloudcone and select SSH keys.

>Paste the content that you've copied earlier.

Now it is time to login to the server.

#### Login to the server:

Open the terminal and type the following:

    ssh root@YOUR_IPV4_IP

It will ask for your password which will be provided to you in the registered mail. Enter the password. Now it is time to install the SSH keys.

    # STEP 2: INSTALL THE SSH KEY
    $ curl -o cc-ikey -L web.cloudc.one/sh/key && sh cc-ikey some-random-key #it will be different for you.

Also, if you want to get information about the RAM usage in the system, then execute the following in the terminal.

    $ wget -O install stats.cloudcone.sh && bash install some-random-string
    # It will be different on every instances. The random string will be provided to you by cloudcone.

After the installation, you'll see the ram usage in cloudcone dashboard.

#### Changing date/time

To set the timezone, run the following command:

    $ sudo timedatectl set-timezone Asia/Kolkata

And

{{< notification class="warning" >}}

If you want to get a list of time-zones available, you can use the following:

{{< /notification >}}

    $ timedatectl list-timezones

You can also use `grep` in order to narrow it down such as `$ timedatectl list-timezones | grep Asia/Kolkata`