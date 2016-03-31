#!/bin/bash

echo "Waiting for rpcbind to come up..."
until [ -z $(/usr/sbin/service rpcbind status | grep "[ok]")]; do
  printf "."
  /usr/sbin/service rpcbind stop
  /usr/sbin/service rpcbind start
  sleep 5
done
echo "rpcbind is up and running."
