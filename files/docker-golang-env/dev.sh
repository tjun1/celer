#!/usr/bin/env bash

# if [ "$1" == "" ]; then
#     docker-compose run dev emacs -nw
# fi

case $1 in
    "build")
        docker-compose build;;
    "sh")
        docker-compose run dev bash;;
    "all")
        docker-compose build
        docker-compose run dev emacs -nw;;
    *)
        docker-compose run dev emacs -nw;;
esac

