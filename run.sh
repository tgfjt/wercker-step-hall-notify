#!/bin/sh

curl -X POST \
     -H "Content-Type: application/json" \
     -d "title=$WERCKER_APPLICATION_NAME" \
     -d "message=<p>$WERCKER_RESULT</p> \
     Build:<a href=\"$WERCKER_BUILD_URL\"" \
     https://hall.com/api/1/services/generic/$HALL_ROOM_API_TOKEN
