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

- [x] **2.1** make the stars twinkle in the background
  - Evidence: visual confirmation - 200 stars with sinusoidal brightness variation
- [x] **2.2** add Earth's moon
  - Evidence: visual confirmation - gray moon orbits Earth at 18px radius, 13x Earth's orbital speed
- [x] **2.3** add a gently warbling overtone to the sound
  - Evidence: audible confirmation - 330Hz sine overtone with slow pitch warble (0.15Hz) and amplitude modulation (0.08Hz)
- [x] **2.4** add jupiter's moons
  - Evidence: visual confirmation - four Galilean moons (Io, Europa, Ganymede, Callisto) orbit Jupiter with distinct colors and speeds
- [x] **2.5** zoom in on Earth
  - Evidence: visual confirmation - zoom button (magnifier icon) smoothly animates view to center on Earth at 4x zoom, follows Earth as it orbits
- [x] **2.6** Add a button to zoom back out to full solar system view
  - Evidence: visual confirmation - same zoom button toggles back to full solar system view with smooth animation
- [x] **2.7** add a gently pulsing mid-tone to the sound
  - Evidence: audible confirmation - 180Hz sine mid-tone with slow pulsing LFO (0.12Hz) for breathing rhythm
- [x] **2.8** add a capability to zoom in to earth-moon system when clicked, and make earth and moon more detailed in zoomed in mode.
  - Evidence: visual confirmation - click on Earth to zoom in 6x; detailed Earth with continents/atmosphere, detailed Moon with craters, moon orbit visible
- [x] **2.9** add a button to zoom back out to full solar system view
  - Evidence: visual confirmation - zoom-out magnifier button appears when in zoomed Earth-moon view, clicking returns to full solar system
- [x] **2.10** the zoom in to Earth mode has strange orbital geometry! Make it more accurate to solar system dynamics.
  - Evidence: visual confirmation - Earth now stays centered when zoomed in (stable frame of reference); Moon orbits centered Earth; other planets/sun hidden (too far away); subtle sun glow shows direction of sunlight
- [ ] **2.11** There should be a subtle interface element when hovering over Earth -- like a glow -- indicating that it will respond to click. Maybe a subtle and beautiful zoom message as well.
  - Evidence: visual confirmation
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
| ralph | 2.1 | Added 200 twinkling stars with sinusoidal brightness variation |
| ralph | 2.2 | Added Earth's moon - gray satellite orbiting Earth |
| ralph | 2.3 | Added gently warbling overtone - 330Hz sine with pitch/amplitude modulation |
| ralph | 2.4 | Added Jupiter's four Galilean moons - Io, Europa, Ganymede, Callisto orbiting Jupiter |
| ralph | 2.5-2.6 | Added zoom toggle button - smoothly zooms to Earth at 4x and follows it; click again to zoom out |
| ralph | 2.7 | Added pulsing mid-tone - 180Hz sine with slow breathing pulse (0.12Hz LFO) |
| ralph | 2.8 | Added click-to-zoom on Earth; detailed Earth (continents, atmosphere), detailed Moon (craters) when zoomed |
| ralph | 2.9 | Added zoom-out button - magnifier icon appears when zoomed in, click to return to full solar system |
| ralph | 2.10 | Fixed Earth-Moon orbital geometry - stable centered view, hides solar system, subtle sun direction glow |

## Done When

- [x] Site loads at lab.kenwilliford.net/solar/
- [x] Planets orbit the sun (top-down view)
- [x] Ambient sound plays with toggle button
- [x] Looks good on large OLED TV
- [x] Loop stays alive for guest feature requests
