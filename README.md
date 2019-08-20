# i love l.a.m.p.

**website starter kit**
---

**image includes**
- ubuntu
- php 7.3
- apache 2
- composer 
- mysql *coming soon*
- and maybe some other junk

**also included**
- apache configs
- apache rewrite module
- composer.json boilerplate
- a bunch of php extensions
- Dockerfile + docker-compose.yml
- Makefile
- and a bunch of other nonsense :D

---
### doing thingz

you can see the `Makefile` if you wanna see all the commands,
but the most useful are probably...
- `make mulligan` - stop and remove container, destroy images, rebuild image, restart container
- `make stop` - stop the container (runs on port `80` and `443` by default, so might conflict with other containers)
- `make up` - start the container
- `make build` - build the image
- `make composer` - run composer in the container, useful if you're making changes to `composer.json`

---
### other crap

i use this a lot for personal projects, so i thought i'd share. i hope you enjoy.

** love, peace, and chicken grease
