#!/bin/bash

if [ $# -lt 1 ]; then
  echo "use: ./query.sh  <token>"
  exit 1
fi

TOKEN="$1"
MAX_RETRIES=300

for i in $(seq 1 $MAX_RETRIES); do
  RESPONSE=$(curl -s -X POST https://agent.pollyreach.ai/api/v1/chat/openclaw/query \
    -H "Content-Type: application/json" \
    -H "Authorization: Bearer $TOKEN" \
    -d "{}")

  DONE=$(echo "$RESPONSE" | grep -o '"done"\s*:\s*true')
  MESSAGE=$(echo "$RESPONSE" | sed -n 's/.*"message" *: *"\([^"]*\)".*/\1/p')
  if [ -n "$DONE" ]; then
    echo "$RESPONSE"
    exit 0
  fi
  sleep 2
done

echo "query.sh exited with no completion after $MAX_RETRIES retries. Last response:"
exit 1

