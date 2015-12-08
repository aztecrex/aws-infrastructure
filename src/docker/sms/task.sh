#!/bin/bash

. functions.sh
echo to: $1
echo msg:$2
send-message "$1" "$2"
