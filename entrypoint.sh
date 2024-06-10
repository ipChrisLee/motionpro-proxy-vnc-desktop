#!/usr/bin/env bash

/usr/bin/vpnd 2>&1

touch /var/lock/subsys/local

service ssh start

exec "$@"
