#!/usr/bin/env bash

. cleanup.sh

go generate
go run main.go

if [ $? -gt 0 ]; then
    echo -e "\n------------------------"
    echo -e "Failed"
    exit 1
fi

echo -e "\n------------------------"
echo -e "Success"
exit 0
