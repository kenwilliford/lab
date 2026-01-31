#!/bin/bash
# Validate solar/index.html before committing
# Checks for JavaScript syntax errors

cd "$(dirname "$0")/.."

echo "Validating solar/index.html..."

# Extract JavaScript from HTML to temp file
TMPJS=$(mktemp /tmp/validate-XXXXXX.js)
sed -n '/<script>/,/<\/script>/p' solar/index.html | sed '1d;$d' > "$TMPJS"

# Check syntax
if node --check "$TMPJS" 2>&1; then
    echo "✓ JavaScript syntax OK"
    rm "$TMPJS"
else
    echo "✗ JavaScript syntax ERROR"
    rm "$TMPJS"
    exit 1
fi

# Quick check: ensure key elements still exist
for pattern in "requestAnimationFrame" "toggleSound" "planets" "animate"; do
    if ! grep -q "$pattern" solar/index.html; then
        echo "✗ Missing expected code: $pattern"
        exit 1
    fi
done

echo "✓ Key code elements present"

# Browser test: load page and check for runtime errors
echo ""
echo "Running browser test..."
if node "$(dirname "$0")/browser-test.js" 2>&1; then
    echo ""
    echo "✓ All validation passed"
else
    echo ""
    echo "✗ Browser test FAILED - do not commit"
    exit 1
fi
