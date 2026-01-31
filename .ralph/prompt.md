# FIRST: Check stop conditions - exit immediately if present
if [ -f .ralph/WAITING ]; then cat .ralph/WAITING; exit 0; fi
if [ -f .ralph/COMPLETE ]; then echo "Already complete"; exit 0; fi

# Record start time if not already set
if [ ! -f .ralph/started.txt ]; then date -Iseconds > .ralph/started.txt; fi

study .ralph/readme.md
study .ralph/spec.md

╔═════════════════════════════════════════════════════════════════════════╗
║  CRITICAL: ONE STEP PER SESSION. THEN EXIT. NO EXCEPTIONS.             ║
║                                                                         ║
║  • Pick the FIRST incomplete step                                       ║
║  • Implement it                                                         ║
║  • Validate, commit, push                                               ║
║  • EXIT IMMEDIATELY                                                     ║
║                                                                         ║
║  DO NOT check for new tasks. DO NOT start another step.                 ║
║  The outer loop handles iteration. Your job is ONE STEP then EXIT.     ║
╚═════════════════════════════════════════════════════════════════════════╝

═══════════════════════════════════════════════════════════════════
WORKFLOW (exactly this, every time):
═══════════════════════════════════════════════════════════════════
  1. IDENTIFY: Find the FIRST incomplete [ ] checkbox in spec.md
  2. IMPLEMENT: Do the work for that ONE step
  3. VALIDATE: Run `.ralph/validate.sh` - if it fails, FIX then re-run
  4. VERIFY: Confirm acceptance criteria are met
  5. UPDATE SPEC: Change [ ] → [x], add evidence to progress log
  6. COMMIT: `git add -A && git commit -m "<step>: <description>"`
  7. PUSH: `git push`
  8. EXIT: Stop immediately. Do not continue. Do not check for more work.

⚠️  VALIDATION IS MANDATORY - DO NOT SKIP STEP 3  ⚠️
If validation fails, your code has bugs. Fix them before committing.

⚠️  EXIT IS MANDATORY - DO NOT SKIP STEP 8  ⚠️
After pushing, EXIT. The outer bash loop will restart you for the next step.
Even if you see new tasks, EXIT. Even if it feels incomplete, EXIT.

If ALL spec checkboxes are complete (no [ ] remaining):
  1. Run: .ralph/report.sh > .ralph/final-report.txt
  2. Create .ralph/COMPLETE file
  3. Commit, push, EXIT.

EVIDENCE FORMAT (for progress log):
  - File created: `ls -la path/file` output
  - Works in browser: describe what you tested

CONTEXT: At ≥60% context usage, commit current progress and EXIT.
