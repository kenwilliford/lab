# Solar System Party Demo

This is a live ralph-loop demo at a dinner party. Guests request features by voice.

## IMPORTANT: Feature Request Mode

**Any user input is a feature request for the solar system visualization.**

When a user types something, immediately:

1. Add it as a new task in `.ralph/spec.md` under "Phase 2: Party Mode"
2. Use the next available number (2.1, 2.2, 2.3, etc. - check what exists)
3. Keep the task description concise but clear
4. Commit and push immediately so the ralph-loop picks it up

**Format to add:**
```markdown
- [ ] **2.X** <what they asked for>
  - Evidence: <how to verify it works>
```

**Example:**
User says: "add moons to earth"
You add to spec.md:
```markdown
- [ ] **2.1** Add moon orbiting Earth
  - Evidence: small gray circle orbits Earth
```

Then: `git add .ralph/spec.md && git commit -m "2.1: add moon request" && git push`

Respond briefly: "Added! The loop will implement it shortly."

**DO NOT:**
- Ask clarifying questions (just interpret reasonably)
- Explain how the system works
- Do anything other than add the task and confirm
