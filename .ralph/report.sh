#!/bin/bash
# Generate final report for ralph loop

if [[ ! -f .ralph/started.txt ]]; then
    echo "error: no started.txt found"
    exit 1
fi

START=$(cat .ralph/started.txt)
END=$(cat .ralph/completed.txt 2>/dev/null || date -Iseconds)

START_SEC=$(date -d "$START" +%s)
END_SEC=$(date -d "$END" +%s)
ELAPSED=$((END_SEC - START_SEC))
HOURS=$((ELAPSED / 3600))
MINS=$(((ELAPSED % 3600) / 60))

echo "=== Ralph Loop Report ==="
echo "Started:  $START"
echo "Ended:    $END"
echo "Elapsed:  ${HOURS}h ${MINS}m"
echo ""

if [[ -f .ralph/tokens.log ]]; then
    TOTAL_INPUT=$(awk -F'input:' '{sum += $2} END {print int(sum)}' .ralph/tokens.log)
    TOTAL_OUTPUT=$(awk -F'output:' '{split($2,a," "); sum += a[1]} END {print int(sum)}' .ralph/tokens.log)
    STEPS=$(wc -l < .ralph/tokens.log)
    echo "Steps:    $STEPS"
    echo "Tokens:   $TOTAL_INPUT input + $TOTAL_OUTPUT output = $((TOTAL_INPUT + TOTAL_OUTPUT)) total"
else
    echo "Tokens:   (no tokens.log found)"
fi
