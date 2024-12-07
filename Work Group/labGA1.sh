#!/bin/bash

target=$((RANDOM % 100 + 1))

attempts=0
guess=0

echo "Welcome to the Guess the Number game!"
echo "I have chosen a number between 1 and 100. Try to guess it!"

while [[ $guess -ne $target ]]; do
    echo -n "Enter your guess: "
    read guess
    attempts=$((attempts + 1))

    if [[ $guess -lt $target ]]; then
        echo "Too low! Try again."
    elif [[ $guess -gt $target ]]; then
        echo "Too high! Try again."
    else
        echo "Congratulations! You guessed the number $target in $attempts attempts."
    fi
done
