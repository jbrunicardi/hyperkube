#!/bin/bash

echo "Waiting for rpcbind to come up..."
until $(/sbin/service rpcbind status | grep "[ok]"); do
  printf "."
  /sbin/service rpcbind stop
  /sbin/service rpcbind start
  sleep 5
done
echo "rpcbind is up and running."
