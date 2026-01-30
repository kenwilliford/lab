# Solar System Party Demo - Spec

## Phase 1: MVP

- [x] **1.1** Create solar/index.html with basic structure
  - Dark background (#0d1117 to match site)
  - Full viewport canvas
  - F11 fullscreen hint in corner (fades after 5s)
  - Evidence: file exists, opens in browser

- [x] **1.2** Add sun and planets with orbital animation
  - Sun at center (yellow/orange gradient)
  - Mercury, Venus, Earth, Mars, Jupiter, Saturn, Uranus, Neptune
  - Relative sizes (not to scale, but visually distinct)
  - Circular orbits, different speeds (inner faster)
  - Smooth animation via requestAnimationFrame
  - Evidence: planets visibly orbiting

- [x] **1.3** Add ambient sound with toggle
  - Gentle synthesized drone using Web Audio API
  - Layered oscillators for depth
  - Sound toggle button (speaker icon) in corner
  - Starts muted (browser autoplay policy)
  - Evidence: sound plays when toggled on

- [x] **1.4** Add to lab index page
  - New project card for Solar System
  - Link to solar/index.html
  - Evidence: visible on lab.kenwilliford.net

- [x] **1.R** Review: verify MVP works end-to-end
  - Opens at lab.kenwilliford.net/solar/
  - Planets orbit smoothly
  - Sound toggle works
  - Looks good fullscreen
  - Evidence: manual verification

## Phase 2: Party Mode (Guest Requests Go Here)

<!-- Guests add feature requests below this line -->
<!-- Format: - [ ] **2.X** Description -->

- [ ] **2.99** Wait 30 minutes for guest requests
  - Check current time, wait until 30 min elapsed
  - If new tasks added above this one, mark this done and exit
  - Otherwise, sleep and check again
  - This keeps the loop alive for the party
  - Evidence: 30 minutes passed OR new tasks exist

---

## Progress Log

| Session | Step | Result |
|---------|------|--------|
| setup | 1.1-1.R | MVP complete: solar/index.html with planets, sound, link added |

## Done When

- [x] Site loads at lab.kenwilliford.net/solar/
- [x] Planets orbit the sun (top-down view)
- [x] Ambient sound plays with toggle button
- [x] Looks good on large OLED TV
- [x] Loop stays alive for guest feature requests
