#!/bin/bash

# Sync with configs
source ./info.conf

sendMessage() {
MESSAGE=$1

curl -s "https://api.telegram.org/bot${BOT_API_KEY}/sendmessage" --data "text=$MESSAGE&chat_id=$CHAT_ID" 1> /dev/null

echo -e;
}

IP=$(curl ipecho.net/plain)
DIFF=$(diff ./current.txt <(echo "$IP"))
if [ "$IP" ]
then

    if [ "$DIFF" = "" ]
    then
        :
    elif [ "$DIFF" != "" ]
    then
        mv ./current.txt ./old.txt
        echo "$IP" >./current.txt
        sendMessage "New Server IP $IP" && curl -s "https://api.telegram.org/bot${BOT_API_KEY}/sendSticker?chat_id=$CHAT_ID&sticker=$STICKER_ID"  1> /dev/null
    fi
else    
    :   
fi
