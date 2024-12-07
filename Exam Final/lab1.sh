#!/bin/bash

echo "++++++++++++++++++++"
read -p "Number of buy : " numBuy
echo "===================="

if [[ -z $numBuy ]]
then
    echo "Error"
elif (( $numBuy <= 0 ))
then
    echo "Error"
else
    sumPrice=0

    for ((i=0; i<$numBuy; i++))
    do
        read -p "Name product : " proName
        read -p "Price : " price
        sumPrice=$(($price + $sumPrice))
    done

    echo "Sum price : $sumPrice"
    echo "===================="
    read -p "Get money : " money
    echo "Give change :" $(($money-$sumPrice))
fi