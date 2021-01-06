#!/usr/bin/env bash

echo "---- cleanup ----"
# . cleanup.sh
make clean

echo "---- build & run ----"
make run
# go generate
# go run main.go -t golang
# go run main.go -t clang

echo -e "\n---- results ----"

if [ $? -gt 0 ]; then
    echo -e "Failed"
    exit 1
fi
make clean
echo -e "Success"
exit 0
