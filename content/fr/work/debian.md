---
date: 2015-06-19
title: GNU/Linux Debian
description: Dépôt d’empaquetages et de rétro-portages personnels
lang: fr-FR
tags:
  - apt
  - nom de code
  - debian
  - distribution
  - gnu/linux
  - trousseau
  - empaquetage
  - clef publique
  - renm
  - source
menu:
  main_fr:
    parent: work
---

### Configuration des sources {#sources-configuration}

Ajouter l’une des lignes suivantes (en fonction du nom de code de votre distribution) au fichier
`/etc/apt/sources.list.d/renm.list` :

```
deb http://packages.renm.org/debian/ wheezy main
deb http://packages.renm.org/debian/ wheezy-backports main
deb http://packages.renm.org/debian/ jessie main
deb http://packages.renm.org/debian/ jessie-backports main
deb http://packages.renm.org/debian/ sid main
```

### Clef publique {#public-key}

La clef publique utilisée par les dépôts est téléchargeable [ici](http://packages.renm.org/debian/renm.asc), et peut
être ajoutée via la commande :

```
sudo apt-key add renm.asc
```

ou bien encore de manière automatique après avoir ajouté le dépôt avec :

```
apt-get install debian-renm-keyring
```

<span class="fa fa-info-circle"></span> **Note :** le dépôt n’étant pas reconnu comme étant de confiance, cela pourra
nécessiter d’autoriser explicitement son installation.
