#!/bin/sh

read -p "enter a number: " number

if [ "$number" -gt 0 ]; then
    echo "$number is positive"
elif [ "$number" -eq 0 ]; then
    echo "$number is zero"
else
    echo "$number is negative"
fi

