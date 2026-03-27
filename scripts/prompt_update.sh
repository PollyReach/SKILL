#!/bin/bash

if [ $# -lt 2 ]; then
  echo "use: ./prompt_update.sh <message> <token>"
  exit 1
fi

MESSAGE="$1"
TOKEN="$2"
MAX_RETRIES=20

for i in $(seq 1 $MAX_RETRIES); do
  RESPONSE=$(curl -s -w "\n%{http_code}" -X POST https://api.pollyreach.ai/platform/v1/users/phone/pollyreach/update \
    -H "Content-Type: application/json" \
    -H "Authorization: Bearer $TOKEN" \
    -d "{\"prompt\": \"$MESSAGE\"}")

  HTTP_CODE=$(echo "$RESPONSE" | tail -1)
  RESPONSE=$(echo "$RESPONSE" | sed '$d')
  if [ "$HTTP_CODE" -eq 401 ]; then
     echo $RESPONSE
     exit 1
  fi
  if [ $? -ne 0 ] || [ "$HTTP_CODE" -lt 200 ] || [ "$HTTP_CODE" -ge 300 ]; then
    sleep 2
    continue
  fi
  echo $RESPONSE
  exit 0
done

echo "prompt_update.sh exited with no completion after $MAX_RETRIES retries."
exit 1
