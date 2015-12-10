#!/bin/bash

dest=$1

. /functions.sh

decrypt-file /twilio.config.encrypted /tmp/twcfg
. /tmp/twcfg
rm /tmp/twcfg
rm /twilio.config.encrypted

send-message "$dest" "we have started your work"
sleep 30
send-message "$dest" "the missles have been launched"
