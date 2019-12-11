#!/usr/bin/env bash

if [ -d docker-golang-env ]; then
    echo "remove docker-golang-env"
    rm -rf docker-golang-env
fi

if [ -f /tmp/Dockerfile ]; then
    echo "remove Dockerfile..."
    rm -rf /tmp/Dockerfile
fi

if [ -f /tmp/docker-compose.yml ]; then
    echo "remove docker-compose.yml"
    rm -rf /tmp/docker-compose.yml
fi

if [ -d /tmp/.emacs.d ]; then
    echo "remove /tmp/.emacs.d"
    rm -rf /tmp/.emacs.d
fi

if [ -f /tmp/init.el ]; then
    echo "remove /tmp/init.el"
    rm -rf /tmp/init.el
fi

if [ -f /tmp/clues-theme.el ]; then
    echo "remove /tmp/clues-theme.el"
    rm -rf /tmp/clues-theme.el
fi

if [ -f /tmp/emacs-custom.el ]; then
    echo "remove /tmp/emacs-cutom.el"
    rm -rf /tmp/emacs-custom.el
fi

if [ -f /tmp/dev.sh ]; then
    echo "remove /tmp/dev.sh"
    rm -rf /tmp/dev.sh
fi

if [ -f /tmp/run ]; then
    echo "remove /tmp/run"
    rm -rf /tmp/run
fi

if [ -f /tmp/sample.txt ]; then
    echo "remove /tmp/sample.txt"
    rm -rf /tmp/sample.txt
fi

if [ -f /tmp/setup.sh ]; then
    echo "remove /tmp/setup.sh"
    rm -rf /tmp/setup.sh
fi


if [ -f Dockerfile ]; then
    echo "remove Dockerfile"
    rm -rf Dockerfile
fi
if [ -f docker-compose.yml ]; then
    echo "remove docker-compose.yml "
    rm -rf docker-compose.yml
fi
if [ -f run ]; then
    echo "remove run"
    rm -rf run
fi
if [ -f setup.sh ]; then
    echo "remove setup.sh"
    rm -rf setup.sh
fi
if [ -f dev.sh ]; then
    echo "remove dev.sh"
    rm -rf dev.sh
fi
if [ -d .emacs.d ]; then
    echo "remove .emacs.d"
    rm -rf .emacs.d
fi
