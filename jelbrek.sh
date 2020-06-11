#!/bin/bash

# Check dependencies
if [ "$JELBREK_TOKEN" = "" ] ;then
    notify-send "You haven't set your token. Please set your token up as an environment variable with the name JELBREK_TOKEN."
    sleep 60
    rm $1
    exit 1
fi

if [ "$(which jq)" = "" ] ;then
    notify-send "This script requires dependency jq to upload to parse the response. Please resolve."
    sleep 60
    rm $1
    exit 1
fi

if [ "$(which curl)" = "" ] ;then
    notify-send "This script requires dependency curl. Please resolve."
    sleep 60
    rm $1
    exit 1
fi

if [ "$(which xsel)" = "" ] ;then
    notify-send "This script requires dependency xsel. Please resolve."
    sleep 60
    rm $1
    exit 1
fi

# POST the image to jelbrek's endpoint. store response temporarily
response=$(curl --form "x=@$(echo $1)"  -H "Content-Type: multipart/form-data" -H "authorization: $JELBREK_TOKEN" https://jelbrek.icu/upload)
# parse response to see if request was successful
success=$(echo $response | jq -r '.success')
# parse repsonse, try to get the URL for the uploaded image
path=$(echo $response | jq -r '.url')

if [ "$success" == "true" ]; then
    # copy path to clipboard
    echo $path | xsel -bi
    notify-send $path
    sleep 60
    rm $1
    exit 1
else
    notify-send "Error uploading!"
    sleep 60
    rm $1
    exit 1
fi
