send-message() {
  dest=$1
  msg=$2
  user=$TWILIO_ACCESS_ID
  pass=$TWILIO_ACCESS_SECRET

  curl -s -X POST -k     \
    -u "$user:$pass"     \
    -d "From=8053646302" \
    -d "To=$dest"        \
    -d "Body=$msg"       \
    "https://api.twilio.com/2010-04-01/Accounts/$user/SMS/Messages"
}

decrypt-file() {
  aws --region us-west-1 kms decrypt --query Plaintext --output text  \
     --ciphertext-blob fileb://$1 | /bin/base64 -d > $2
}
