#!/bin/bash

if [ $# -lt 1 ]; then
  echo "use: ./balance.sh <token>"
  exit 1
fi

TOKEN="$1"
MAX_RETRIES=1000

for i in $(seq 1 $MAX_RETRIES); do
  RESPONSE=$(curl -s -w "\n%{http_code}" -X GET https://agent.pollyreach.ai/api/v1/credits/balance \
    -H "Authorization: Bearer $TOKEN")

  HTTP_CODE=$(echo "$RESPONSE" | tail -1)
  RESPONSE=$(echo "$RESPONSE" | sed '$d')
echo  "Response: $RESPONSE"
  if [ $? -ne 0 ] || [ "$HTTP_CODE" -lt 200 ] || [ "$HTTP_CODE" -ge 300 ]; then
    sleep 2
    continue
  fi

  BALANCE=$(echo "$RESPONSE" | grep -o '"balance"\s*:\s*[0-9.]*' | sed 's/"balance"\s*:\s*//')

if [ -n "$BALANCE" ] && [ "$(echo "$BALANCE > 0" | bc)" -eq 1 ]; then
    echo "token is active, balance: $BALANCE"
    exit 0
  else
    echo "token is inactive"
    exit 0
  fi
  sleep 2
done

echo "balance.sh exited with no valid balance after $MAX_RETRIES retries."
exit 1
