NAME := celer
#VERSION := $(shell git describe --tags --abbrev=0)
MAIN := main.go
GOFILES := $(shell find . -name "*.go"|grep -v statik)
GOMOD := go.mod
export GO111MODULE=on

.PHONY: asset
asset:
	go get github.com/rakyll/statik
	statik -src=files -f
	go generate

.PHONY: build
build:
	go generate
	go build -o /tmp/bin/$(NAME)

.PHONY: install
install: $(MAIN)
	go generate
	go build
	go install

.PHONY: clean
clean:
	./scripts/cleanup.sh

.PHONY: run
run:
	go run $(GOFILES) -t clang

.PHONY: test
test:
	./scripts/runtest.sh

#.PHONY: setup test lint vet fmt build run
#help
