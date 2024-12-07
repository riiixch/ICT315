#!/bin/bash

multiplication_table() {
    read -p "Enter a number for multiplication table : " num

    for i in {1..10}; do
        echo "$num x $i = $(( num * i ))"
    done
}

multiplication_table
