#!/bin/bash
# Check current session's context utilization

SESSION_DIR=$(find ~/.claude/projects -maxdepth 1 -type d -name "*$(basename $(pwd))*" 2>/dev/null | head -1)

if [ -z "$SESSION_DIR" ]; then
    echo "error: no session directory found"
    exit 1
fi

LATEST=$(ls -t "$SESSION_DIR"/*.jsonl 2>/dev/null | head -1)

if [ -z "$LATEST" ]; then
    echo "error: no session file found"
    exit 1
fi

TOKENS=$(tail -20 "$LATEST" | grep -o '"cache_read_input_tokens":[0-9]*' | tail -1 | grep -o '[0-9]*')

if [ -z "$TOKENS" ]; then
    echo "error: no token count found"
    exit 1
fi

WINDOW=200000
PERCENT=$((TOKENS * 100 / WINDOW))

echo "${PERCENT}% context used (${TOKENS}/${WINDOW} tokens)"

if [ "$PERCENT" -gt 60 ]; then
    exit 2
fi
