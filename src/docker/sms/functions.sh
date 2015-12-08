#!/bin/bash

send-message() {
  dest=$1
  msg=$2
  user=$TWILIO_ACCESS_ID
  pass=$TWILIO_ACCESS_SECRET

  curl -v -X POST -k     \
    -u "$user:$pass"     \
    -d "From=8053646302" \
    -d "To=$dest"        \
    -d "Body=$msg"       \
    "https://api.twilio.com/2010-04-01/Accounts/$user/SMS/Messages"
}
