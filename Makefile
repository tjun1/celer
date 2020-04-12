NAME := celer
#VERSION := $(shell git describe --tags --abbrev=0)
MAIN := main.go
GOMOD := go.mod
export GO111MODULE=on

.PHONY: build
build: $(MAIN)
	go generate
	go build -o bin/$(NAME) $<

.PHONY: install
install: $(MAIN)
	go generate
	go build
	go install

.PHONY: clean
clean:
	./scripts/cleanup.sh


.PHONY: run
run: $(MAIN)
	go run $<

#.PHONY: setup test lint vet fmt build run
#help
