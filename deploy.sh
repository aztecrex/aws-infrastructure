#!/bin/bash

set -e

here=$(dirname $(readlink -f $0))

$here/build.sh
docker push aztecrex/cj-task-30
docker push aztecrex/cj-httpd


