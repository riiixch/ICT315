#!/bin/bash

convert_to_fahrenheit() {
    local celsius=$1
    local fahrenheit=$(( (celsius * 9 / 5) + 32 ))
    echo "$celsius °C = $fahrenheit °F"
}

read -p "Please enter temperature in degrees Celsius : " celsius

convert_to_fahrenheit $celsius
