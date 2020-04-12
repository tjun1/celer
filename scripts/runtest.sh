#!/usr/bin/env bash

echo "---- cleanup ----"
. cleanup.sh

echo "---- build & run ----"
go generate
#go run main.go -t golang
go run main.go -t clang

echo -e "\n---- results ----"

if [ $? -gt 0 ]; then

    echo -e "Failed"
    exit 1
fi

echo -e "Success"
exit 0