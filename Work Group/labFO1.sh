#!/bin/bash

find_even_odd() {
    read -p "Enter numbers separated by space : " -a numbers

    even=()
    odd=()

    for num in "${numbers[@]}"; do
        if (( num % 2 == 0 )); then
            even+=($num)
        else
            odd+=($num)
        fi
    done

    echo "Even numbers: ${even[@]}"
    echo "Odd numbers: ${odd[@]}"
}

find_even_odd
