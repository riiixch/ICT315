#!/bin/bash

read -p "Input your point (0-100): " point

if [[ -z $point ]]
then
    echo "Error"
elif (( $point >= 80 ))
then
    echo "Grade : A"
elif (( $point >= 75 ))
then
    echo "Grade : B+"
elif (( $point >= 70 ))
then
    echo "Grade : B"
elif (( $point >= 65 ))
then
    echo "Grade : C+"
elif (( $point >= 60 ))
then
    echo "Grade : C"
elif (( $point >= 55 ))
then
    echo "Grade : D+"
elif (( $point >= 50 ))
then
    echo "Grade : D"
else
    echo "Grade : F"
fi