#!/usr/bin/env bash

if [ -d dist ]; then
  echo "remove dist"
  rm -rf dist
fi

if [ -f bin/celer ]; then
  echo "remove bin/celer"
  rm -f bin/celer
fi

CELER_LANG=(gcc clang-9 python ruby golang)
for celer_lang in "${CELER_LANG[@]}"; do
  celer_tmp_path="/tmp/docker-$celer_lang-env"
  if [ -d $celer_tmp_path ]; then
    echo "remove $celer_tmp_path"
    rm -rf "$celer_tmp_path"
  else
    echo "$celer_tmp_path が存在しない"
  fi
done

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

if [ -f update-alternatives-clang-9.sh ]; then
  echo "remove update-alternatives-clang-9.sh"
  rm -rf update-alternatives-clang-9.sh
fi

if [ -f install-ccls.sh ]; then
  echo "remove install-ccls.sh"
  rm -rf install-ccls.sh
fi

if [ -f requirements.txt ]; then
  echo "remove requirements.txt"
  rm -rf requirements.txt
fi

if [ -f dev ]; then
  echo "remove dev"
  rm -rf dev
fi

if [ -f celer ]; then
  echo "remove celer"
  rm celer
fi
