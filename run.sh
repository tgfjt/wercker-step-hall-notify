#!/bin/sh

if [ "$DEPLOY" = "true" ]; then
  ACTION="deploy"
  ACTION_ID=$WERCKER_DEPLOY_ID
  ACTION_URL=$WERCKER_DEPLOY_URL
else
  ACTION="build"
  ACTION_ID=$WERCKER_BUILD_ID
  ACTION_URL=$WERCKER_BUILD_URL
fi

echo ACTION:$ACTION
echo ACTION_ID:$ACTION_ID
echo ACTION_URL:$ACTION_URL

echo $WERCKER_HALL_NOTIFY_TOKEN

curl -X POST \
     -H "Content-Type: application/json" \
     -d '{"title": "'${WERCKER_APPLICATION_NAME}'", "message": "Build:<a href=\"'${ACTION_URL}'\">'${ACTION_URL}'</a> <strong>'${WERCKER_RESULT}'</strong>"}' https://hall.com/api/1/services/generic/$WERCKER_HALL_NOTIFY_TOKEN
