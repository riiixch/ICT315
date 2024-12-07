#!/bin/bash
while true; do
    echo "=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-="
    echo "Script update system packages"
    echo "=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-="

    sudo apt-get update -y && sudo apt-get upgrade -y
    echo "System packages updated at $(date)"
    sleep 604800
done
