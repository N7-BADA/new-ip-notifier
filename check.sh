#!/bin/bash

# Sync with configs
source /home/username/documents/ip-change-detection/info.conf       # Set correct Path

sendMessage() {
MESSAGE=$1

curl -s "https://api.telegram.org/bot${BOT_API_KEY}/sendmessage" --data "text=$MESSAGE&chat_id=$CHAT_ID" 1> /dev/null

echo -e;
}

IP=$(curl ipecho.net/plain)
DIFF=$(diff /home/username/documents/current.txt <(echo "$IP"))     # Set correct Path
if [ "$IP" ]
then

    if [ "$DIFF" = "" ]
    then
        :
    elif [ "$DIFF" != "" ]
    then
        mv /home/username/documents/current.txt /tmp/old.txt        # Set correct Path
        echo "$IP" >/home/username/documents/current.txt            # Set correct Path
        sendMessage "New Server IP $IP" && curl -s "https://api.telegram.org/bot${BOT_API_KEY}/sendSticker?chat_id=$CHAT_ID&sticker=$STICKER_ID"  1> /dev/null
    fi
else    
    :   
fi
