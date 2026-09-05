#!/bin/bash

LOG_FILE="${1:-auth.log}"

if [[ ! -f "$LOG_FILE" ]]; then
    echo "Usage: $0 <log-file>"
    exit 1
fi

FAILED_SSH=$(grep -cE 'Failed password|authentication failure' "$LOG_FILE")
INVALID_USERS=$(grep -cE 'Invalid user' "$LOG_FILE")
UNIQUE_IPS=$(grep -Eo '([0-9]{1,3}\.){3}[0-9]{1,3}' "$LOG_FILE" | sort -u | wc -l)

printf '\n=== Linux Log Analysis ===\n'
printf 'Log file            : %s\n' "$LOG_FILE"
printf 'Failed SSH attempts : %s\n' "$FAILED_SSH"
printf 'Invalid users        : %s\n' "$INVALID_USERS"
printf 'Unique source IPs   : %s\n' "$UNIQUE_IPS"

printf '\nTop source IPs:\n'
grep -Eo '([0-9]{1,3}\.){3}[0-9]{1,3}' "$LOG_FILE" | sort | uniq -c | sort -nr | head -10

printf '\nRecent failed SSH events:\n'
grep -E 'Failed password|authentication failure' "$LOG_FILE" | tail -5
