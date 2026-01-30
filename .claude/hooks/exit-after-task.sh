#!/bin/bash
# Ralph Loop stop hook - conditional on RALPH_LOOP=1
if [[ "$RALPH_LOOP" != "1" ]]; then exit 0; fi

# --- Token logging ---
if [[ -f .ralph/started.txt ]]; then
    SESSION_DIR=$(find ~/.claude/projects -maxdepth 1 -type d -name "*$(basename $(pwd))*" 2>/dev/null | head -1)
    if [[ -n "$SESSION_DIR" ]]; then
        LATEST=$(ls -t "$SESSION_DIR"/*.jsonl 2>/dev/null | head -1)
        if [[ -n "$LATEST" ]]; then
            TOKENS=$(tail -50 "$LATEST" | grep -o '"input_tokens":[0-9]*\|"output_tokens":[0-9]*' | tail -2)
            INPUT=$(echo "$TOKENS" | grep input | grep -o '[0-9]*')
            OUTPUT=$(echo "$TOKENS" | grep output | grep -o '[0-9]*')
            echo "$(date -Iseconds) input:${INPUT:-0} output:${OUTPUT:-0}" >> .ralph/tokens.log
        fi
    fi
fi

PID=$$
while [ "$PID" != "1" ]; do
  PARENT=$(ps -o ppid= -p "$PID" 2>/dev/null | tr -d ' ')
  CMD=$(ps -o comm= -p "$PARENT" 2>/dev/null)
  if [[ "$CMD" == "claude" ]]; then
    sleep 0.5; kill -INT "$PARENT" 2>/dev/null; exit 0
  fi
  PID="$PARENT"
done
exit 1
