#!/bin/bash

echo "Waiting for rpcbind to come up..."
active=$(/usr/sbin/service rpcbind status | grep "[ok]" )
while [ -z "$active" ]; do
  printf "."
  /usr/sbin/service rpcbind stop
  /usr/sbin/service rpcbind start
  sleep 5
  active=$(/usr/sbin/service rpcbind status | grep "[ok]" )
done
echo "rpcbind is up and running."
