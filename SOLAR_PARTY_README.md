# Solar System Party Demo

A live-coding party demo where guests request features and watch an AI implement them in real-time.

## What It Does

- Displays an animated solar system (planets orbiting the sun, moons, twinkling stars)
- Plays ambient space sounds
- Runs a "ralph-loop" that implements guest feature requests live
- Auto-reloads the browser when new features are deployed

## Quick Start

### 1. Reset for a new party
```bash
./party-reset.sh
```
This clears previous session state and prepares for fresh wishes.

### 2. Open the display
Open https://lab.kenwilliford.net/solar/ on the TV/projector
- Click the expand button for true fullscreen
- Click the speaker button to enable sound

### 3. Start the ralph-loop
```bash
RALPH_LOOP=1 bash -c 'while [ ! -f .ralph/COMPLETE ] && [ ! -f .ralph/WAITING ]; do cat .ralph/prompt.md | claude --dangerously-skip-permissions; sleep 2; done'
```

### 4. Guests make wishes
In a separate terminal (can be SSH from another device):
```bash
./wish
```
Then type a feature request like "add asteroid belt" or "make the sun pulse"

### 5. Watch the queue (optional)
```bash
./queue
```
Shows live updating list of wishes and their status.

## How It Works

1. **Guest makes a wish** → `./wish` adds it to `.ralph/spec.md` and pushes to git
2. **Ralph-loop sees the task** → Claude implements the feature in `solar/index.html`
3. **Validation runs** → Syntax check + Playwright browser test
4. **Code is pushed** → The page auto-reloads within 15 seconds
5. **Loop continues** → Ready for the next wish

## File Structure

```
├── solar/index.html     # The solar system visualization
├── wish                  # Script for guests to add feature requests
├── queue                 # Live queue display
├── .ralph/
│   ├── prompt.md        # Instructions for the ralph-loop
│   ├── spec.md          # Task list with checkboxes
│   ├── validate.sh      # Pre-commit validation (syntax + browser test)
│   ├── browser-test.js  # Playwright test for runtime errors
│   └── readme.md        # Context for the loop
└── .claude/
    └── hooks/           # Stop hook for ralph-loop
```

## Safety Features

- **JS syntax validation** - Catches typos before deploy
- **Playwright browser test** - Catches runtime errors
- **One step per session** - Atomic commits, easy rollback
- **Auto-reload preserves state** - Sound stays on across updates

## Customization

To use for a different project:
1. Replace `solar/index.html` with your starting point
2. Edit `.ralph/spec.md` with your initial tasks
3. Update `.ralph/readme.md` with project context
4. Adjust `.ralph/validate.sh` for your tech stack

## Requirements

- Node.js 18+
- Playwright (`npm install` in `.ralph/` directory)
- Claude CLI with `--dangerously-skip-permissions` capability
- Git configured for push without prompts

## Tips for a Great Demo

- Start with a working MVP before guests arrive
- Have the display running with sound before the party starts
- Keep wishes simple and visual ("add rings to Neptune", "make Earth blue-er")
- The queue display is great for building anticipation
- Complex wishes may take multiple loop iterations
