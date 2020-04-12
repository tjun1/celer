#!/usr/bin/env bash

GO111MODULE=on go get golang.org/x/tools/cmd/gopls
GO111MODULE=on go get golang.org/x/tools/gopls@latest
GO111MODULE=on go get golang.org/x/tools/cmd/goimports
