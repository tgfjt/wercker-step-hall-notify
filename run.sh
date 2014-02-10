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

if [ ! -n "$WERCKER_IDOBATA_NOTIFY_ICON" ]; then
  WERCKER_IDOBATA_NOTIFY_ICON="https://raw2.github.com/tgfjt/wercker-step-hall-notify/master/icon/icon96.png"
fi

echo ACTION:$ACTION
echo ACTION_ID:$ACTION_ID
echo ACTION_URL:$ACTION_URL

curl -X POST \
     -H "Content-Type: application/json" \
     -d '{"title": "'${WERCKER_APPLICATION_NAME}'", "message": "Build <strong>'${WERCKER_RESULT}'</strong> on <a href=\"'${ACTION_URL}'\">wercker</a>", "picture": "'$WERCKER_IDOBATA_NOTIFY_ICON'"}' https://hall.com/api/1/services/generic/$WERCKER_HALL_NOTIFY_TOKEN
