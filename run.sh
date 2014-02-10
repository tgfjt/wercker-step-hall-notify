#!/bin/sh

curl -X POST \
     -H "Content-Type: application/json" \
     -d '{"title": "'${WERCKER_APPLICATION_NAME}'", "message": "Build:<a href=\"'${WERCKER_BUILD_URL}'\">'${WERCKER_BUILD_URL}'</a> <strong>'${WERCKER_RESULT}'</strong>"}' \
     https://hall.com/api/1/services/generic/$HALL_ROOM_API_TOKEN
