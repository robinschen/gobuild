#!/bin/sh
#
# Copyright 2017 by caixw, All rights reserved.
# Use of this source code is governed by a MIT
# license that can be found in the LICENSE file.

cd `dirname $0`
builddate=`date -u '+%Y%m%d'`
commithash=`git rev-parse HEAD`

go env -w GO111MODULE=on
go env -w GOPROXY=https://goproxy.io,direct
go env -w GOPRIVATE=gopkg.in/fsnotify

go build -ldflags "-X main.buildDate=${builddate}  -X main.commitHash=${commithash}" -v -o ./cmd/gobuild ./cmd/

