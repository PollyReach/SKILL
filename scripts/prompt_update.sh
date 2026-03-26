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

  if [ $? -ne 0 ] || [ "$HTTP_CODE" -lt 200 ] || [ "$HTTP_CODE" -ge 300 ]; then
    sleep 2
    continue
  fi

  STATUS=$(echo "$RESPONSE" | grep -o '"status"\s*:\s*true')

  if [ -n "$STATUS" ]; then
    TASK_ID=$(echo "$RESPONSE" | grep -o '"task_id"\s*:\s*"[^"]*"' | sed 's/"task_id"\s*:\s*"//;s/"$//')
    echo "task_id: $TASK_ID"
    exit 0
  fi
done

echo "prompt_update.sh exited with no completion after $MAX_RETRIES retries."
exit 1
