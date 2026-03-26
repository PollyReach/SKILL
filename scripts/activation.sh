#!/bin/bash

if [ $# -lt 1 ]; then
  echo "use: ./activation.sh <token>"
  exit 1
fi

TOKEN="$1"
MAX_RETRIES=1000

for i in $(seq 1 $MAX_RETRIES); do
  RESPONSE=$(curl -s -w "\n%{http_code}" -X GET \
    https://api.pollyreach.ai/platform/v1/auths/signin/device/activation-status \
    -H "Authorization: Bearer $TOKEN")

  HTTP_CODE=$(echo "$RESPONSE" | tail -1)
  RESPONSE=$(echo "$RESPONSE" | sed '$d')

  if [ $? -ne 0 ] || [ "$HTTP_CODE" -lt 200 ] || [ "$HTTP_CODE" -ge 300 ]; then
    sleep 2
    continue
  fi
  PHONE=$(echo "$RESPONSE" | sed -n 's/.*"ai_virtual_phone" *: *"\([^"]*\)".*/\1/p')

  if [ -n "$PHONE" ] && [ "$PHONE" != "null" ]; then
    echo "ai_virtual_phone: $PHONE"
    exit 0
  fi
  sleep 2
done

echo "activation.sh exited with no phone number after $MAX_RETRIES retries."
exit 1
