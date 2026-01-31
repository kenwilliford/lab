#!/bin/bash
# Reset the solar system demo for a new party

set -e
cd "$(dirname "$0")"

echo "Solar System Party Reset"
echo "========================"
echo ""

# Check for uncommitted changes
if ! git diff-index --quiet HEAD --; then
    echo "Warning: You have uncommitted changes."
    read -p "Continue anyway? (y/n) " -n 1 -r
    echo
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        exit 1
    fi
fi

# Remove session files
echo "Clearing session state..."
rm -f .ralph/COMPLETE .ralph/WAITING .ralph/started.txt .ralph/completed.txt
rm -f .ralph/tokens.log .ralph/final-report.txt

# Reset spec to just the wait task (keeping Phase 1 as done)
echo "Resetting task list..."
cat > .ralph/spec.md << 'EOF'
# Solar System Party Demo - Spec

## Phase 1: MVP (Pre-built)

- [x] **1.1** Create solar/index.html with basic structure
- [x] **1.2** Add sun and planets with orbital animation
- [x] **1.3** Add ambient sound with toggle
- [x] **1.4** Add to lab index page
- [x] **1.R** Review: verify MVP works end-to-end

## Phase 2: Party Mode (Guest Requests Go Here)

<!-- Guests add feature requests below this line -->
<!-- Use ./wish to add new features -->

- [ ] **2.99** Wait 30 minutes for guest requests
  - Check current time, wait until 30 min elapsed
  - If new tasks added above this one, mark this done and exit
  - This keeps the loop alive for guest requests
  - Evidence: 30 minutes passed OR new tasks exist

---

## Progress Log

| Session | Step | Result |
|---------|------|--------|
| setup | 1.1-1.R | MVP complete |

## Done When

- [x] Site loads at lab.kenwilliford.net/solar/
- [x] Planets orbit the sun (top-down view)
- [x] Ambient sound plays with toggle button
- [x] Looks good on large OLED TV
- [x] Loop stays alive for guest feature requests
EOF

# Pull latest and ensure clean state
echo "Syncing with remote..."
git pull --rebase

# Commit the reset
git add .ralph/spec.md
git commit -m "chore: reset for new party session" --allow-empty
git push

echo ""
echo "✓ Reset complete!"
echo ""
echo "Next steps:"
echo "  1. Open https://lab.kenwilliford.net/solar/ on the display"
echo "  2. Run the ralph-loop:"
echo "     RALPH_LOOP=1 bash -c 'while [ ! -f .ralph/COMPLETE ] && [ ! -f .ralph/WAITING ]; do cat .ralph/prompt.md | claude --dangerously-skip-permissions; sleep 2; done'"
echo "  3. Guests use ./wish to add features"
echo ""
