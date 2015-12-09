#!/bin/bash

dest='8052178602'

. /functions.sh

decrypt-file /twilio.config.encrypted /tmp/twcfg
. /tmp/twcfg
rm /tmp/twcfg
rm /twilio.config.encrypted

send-message "$dest" "starting task"
sleep 30
send-message "$dest" "you have been served"
