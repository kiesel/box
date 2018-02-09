#!/bin/sh -x

vagrant up

net use A: /delete
net use A: '\\127.0.0.1\kiesel' /persistent:no

vagrant provision
