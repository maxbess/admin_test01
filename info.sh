#!/bin/bash

#
# Handlers for different file extensions
#

handle_avi()
{
    file "$1"
}

handle_gz()
{
    gunzip -l "$1"
}

handle_zip()
{
    unzip -l "$1"
}

#handle_pem()
{
    file "$1"
    echo -n "`openssl x509 -noout -in cert.pem -fingerprint`   `openssl x509 -noout -in cert.pem  -subject`"
    echo
}

# Main 
#

filename="$1"
extension=${filename##*.}

if declare -F handle_$extension > /dev/null
then
    handle_$extension "$filename"
else
    echo "No handler found for extension '$extension'"
fi
