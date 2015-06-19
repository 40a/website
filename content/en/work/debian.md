---
date: 2015-06-19
title: GNU/Linux Debian
description: Personal packages and backports repository
lang: en-US
tags:
  - apt
  - codename
  - debian
  - distribution
  - gnu/linux
  - keyring
  - package
  - public key
  - renm
  - source
menu:
  main_en:
    parent: work
---

### Sources Configuration {#sources-configuration}

Add one of the following lines (according to your distribution codename) to the `/etc/apt/sources.list.d/renm.list`
file:

```
deb http://packages.renm.org/debian/ wheezy main
deb http://packages.renm.org/debian/ wheezy-backports main
deb http://packages.renm.org/debian/ jessie main
deb http://packages.renm.org/debian/ jessie-backports main
deb http://packages.renm.org/debian/ sid main
```

### Public Key {#public-key}

The public key used by the repositories can be downloaded [here](http://packages.renm.org/debian/renm.asc), and added
with:

```
sudo apt-key add renm.asc
```

or in a automated way after the repository being added with:

```
apt-get install debian-renm-keyring
```

<span class="fa fa-info-circle"></span> **Note:** the repository being currently untrusted, its installation may
require an explicit authorization.
