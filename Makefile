NAME := celer
#VERSION := $(shell git describe --tags --abbrev=0)
MAIN := main.go
GOMOD := go.mod
export GO111MODULE=on

build: $(MAIN)
	go generate
	go build -o bin/$(NAME) $<

install: $(MAIN)
	go generate
	go build
	go install

clean:
	./cleanup.sh
	# rm -rf .emacs.d
	# rm -rf dev{,.sh}
	# rm -rf setup.sh
	# rm -rf run
	# rm -rf docker-compose.yml
	# rm -rf Dockerfile
	# rm -rf docker-golang-env
	# rm -rf docker-clang-9-env
	# rm -rf update-alternatives-clang-9.sh
	# rm -rf /tmp/setup.sh
	# rm -rf /tmp/run
	# rm -rf /tmp/dev.sh
	# rm -rf /tmp/clues-theme.el
	# rm -rf /tmp/emacs-custom.el
	# rm -rf /tmp/init.el
	# rm -rf /tmp/.emacs.d
	# rm -rf /tmp/docker-compose.yml
	# rm -rf /tmp/Dockrefile
	# rm -rf /tmp/update-alternatives-clang-9.sh
	# rm -rf /tmp/docker-golang-env
	# rm -rf /tmp/docker-clang-9-env
	# rm celer

run: $(MAIN)
	go run $<

#.PHONY: setup test lint vet fmt build run
#help
