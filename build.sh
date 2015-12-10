#!/bin/bash

set -e

here=$(dirname $(readlink -f $0))

pushd $here/src/docker/httpd
docker build -t aztecrex/cj-httpd .
popd

pushd $here/src/docker/task-30
docker build -t aztecrex/cj-task-30 .
popd
