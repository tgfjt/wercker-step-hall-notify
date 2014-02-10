#!/bin/sh

curl -X POST \
     -H "Content-Type: application/json" \
     -d "title=$WERCKER_APPLICATION_NAME" \
     -d "message=$WERCKER_RESULT" \
     $WERCKER_HALL_NOTIFY_URL
