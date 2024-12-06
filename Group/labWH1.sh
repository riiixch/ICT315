#!/bin/bash

echo "=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-="
echo "Monitor Server Shell Script"
echo "=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-="

read -p "Input your IP Address : " server
clear

echo "=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-="
echo "Monitor Server IP : $server"
echo "=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-="

while true; do
  if ping -c 1 $server &> /dev/null; then
    echo "Server $server is up"
  else
    echo "Server $server is down"
  fi
    sleep 5
done
