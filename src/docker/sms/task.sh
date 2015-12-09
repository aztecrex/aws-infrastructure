#!/bin/bash

dest=$TARGET_PHONE

. /functions.sh

decrypt-file /twilio.config.encrypted /tmp/twcfg
. /tmp/twcfg
rm /tmp/twcfg
rm /twilio.config.encrypted

send-message "$dest" "starting task"
sleep 30
send-message "$dest" "you have been served"
