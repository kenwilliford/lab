# FIRST: Check stop conditions - exit immediately if present
if [ -f .ralph/WAITING ]; then cat .ralph/WAITING; exit 0; fi
if [ -f .ralph/COMPLETE ]; then echo "Already complete"; exit 0; fi

# Record start time if not already set
if [ ! -f .ralph/started.txt ]; then date -Iseconds > .ralph/started.txt; fi

study .ralph/readme.md
study .ralph/spec.md

═══════════════════════════════════════════════════════════════════
  DO EXACTLY ONE STEP, THEN COMMIT AND EXIT. NOT TWO. NOT THREE.
  The outer loop will restart you for the next step.
═══════════════════════════════════════════════════════════════════

Pick the FIRST incomplete step. Do that ONE step. Then commit, push, and EXIT.

If ALL spec checkboxes complete:
  1. date -Iseconds > .ralph/completed.txt
  2. .ralph/report.sh > .ralph/final-report.txt
  3. Create .ralph/COMPLETE, commit, push, exit.

═══════════════════════════════════════════════════════════════════
WORKFLOW FOR EACH STEP:
═══════════════════════════════════════════════════════════════════
  1. DO THE WORK: Implement the step
  2. VERIFY: Check acceptance criteria listed in the step
  3. MARK SPEC: Change [ ] → [x] in spec.md
  4. LOG EVIDENCE: Add to progress log in spec.md
  5. COMMIT AND EXIT: `git add -A && git commit`, `git push`, then EXIT.

EVIDENCE FORMAT (for progress log):
  - File created: `ls -la path/file` output
  - Works in browser: describe what you tested

COMMITS: One commit per session, then push and EXIT immediately.
Format: "<step>: <what changed>"

CONTEXT: At ≥60%, checkpoint, commit, push, and EXIT.

PARTY MODE: This is a live demo! Guests may add new tasks to spec.md.
After completing all current tasks, check if new tasks were added.
The final "wait" task keeps the loop alive for guest requests.
