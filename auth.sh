#!/bin/bash

declare -A users=( ["user1"]="password1" ["user2"]="password2" ["user3"]="password3" )

max_attempts=3
attempt=1

while (( attempt <= max_attempts )); do
    read -p "Enter username: " username
    read -sp "Enter password: " password
    echo

    if [[ ${users[$username]} == $password ]]; then
        echo "User successfully authenticated"
        exit 0
    else
        echo "Authentication failed. Attempt $attempt of $max_attempts."
    fi

    ((attempt++))
done

echo "Maximum attempts reached. Exiting."
exit 1
