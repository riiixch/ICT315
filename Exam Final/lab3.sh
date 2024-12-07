#!/bin/bash

weightPrice() {
    local weight=$1

    if [[ -z $weight ]]
    then
        echo "Please input number of weight"
    elif (( $weight > 2000 ))
    then
        echo "Service fee : The weight cannot be recorded."
    elif (( $weight > 1000 ))
    then
        echo "Service fee : 58 THB"
    elif (( $weight > 500 ))
    then
        echo "Service fee : 38 THB"
    elif (( $weight > 250 ))
    then
        echo "Service fee : 28 THB"
    elif (( $weight > 100 ))
    then
        echo "Service fee : 22 THB"
    elif (( $weight <= 100 ))
    then
        echo "Service fee : 18 THB"
    else
        echo "Please input number of weight"
    fi
}

echo "===================="
read -p "Weight : " wei
weightPrice $wei
echo "===================="