#!/bin/bash

if [ $# -lt 1 ]; then
    echo "use: ./inbound.sh <token>"
    exit 1
fi

TOKEN="$1"
MAX_RETRIES=10

if ! command -v jq &> /dev/null; then
    echo "error: please install jq (sudo apt install jq)"
    exit 1
fi


for i in $(seq 1 $MAX_RETRIES); do
    RESPONSE=$(curl -s -w "\n%{http_code}" -X GET \
        "https://agent.pollyreach.ai/api/v1/sms_messages/unread" \
        -H "Authorization: Bearer $TOKEN" )
    
    if [ $? -ne 0 ]; then
        sleep 2
        continue
    fi

    HTTP_CODE=$(echo "$RESPONSE" | tail -1)
    RESPONSE_BODY=$(echo "$RESPONSE" | sed '$d')

    if [ "$HTTP_CODE" -lt 200 ] || [ "$HTTP_CODE" -ge 300 ]; then
        sleep 2
        continue
    fi

    SUCCESS=$(echo "$RESPONSE_BODY" | jq -r '.success' 2>/dev/null)
    if [ "$SUCCESS" != "true" ]; then
        sleep 2
        continue
    fi

    MSG_COUNT=$(echo "$RESPONSE_BODY" | jq '.messages | length' 2>/dev/null)
    if [ -z "$MSG_COUNT" ] || [ "$MSG_COUNT" -eq 0 ]; then
        sleep 2
        continue
    fi

    COMBINED_CONTENT=""
    for ((j=0; j<MSG_COUNT; j++)); do
        CONTENT=$(echo "$RESPONSE_BODY" | jq -r ".messages[$j].content")
        FROM_PHONE=$(echo "$RESPONSE_BODY" | jq -r ".messages[$j].from_phone")
        
        COMBINED_CONTENT+="$FROM_PHONE: $CONTENT | "
    done

    COMBINED_CONTENT=${COMBINED_CONTENT% | }
    echo "========================================"
    echo "$COMBINED_CONTENT"
    
    exit 0
done

exit 1