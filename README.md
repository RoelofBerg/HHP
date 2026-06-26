==============
Test strategy:
==============

- The Gherkin files were written by a product manager, not an IT specialist. They are not meant to be a fully formal test specification, but a starting point. We explicitly welcome you to apply your own testing expertise on top of them.
- If you extend or refine the test coverage, please consider keeping the Gherkin specifications in sync with the test suites and sharing relevant updates back with us.
- In addition, around 6,000 automated tests already exist, covering classic state‑machine–style test automation. The scope for mobot.io is different: focus on smoke testing and real‑world simulation.
Many defects in our product are not detected by traditional automation, but only appear in customer environments—often under rough or unstable conditions such as low battery, dim screens, intermittent Wi‑Fi, or similar hard‑to‑reproduce scenarios.

==============
Product description:
==============

Name: Hygiene Platform
Purpose: Digital dygiene management for IPC (Infection, Prevention and Control) nurses in hospitals
Description: See .pdf product brochures

==============
Abbreviations:
==============

BM = Burgermenu (menu button with three horizontal stripes)
HHC = Hygiene Check (a module of the app)
IPC = Infection prevention and control (IPC nurse = hygiene supervision staff)
MySOP = My Hygiene SOP (a module of the app)

==============
System preparation:
==============

A user of type Institution Admin that has access to a hospital that has:
- access to all software modules (My Hygiene SOP, Observe and Hygiene Check)
- n>1 wards
- n>1 Observe observation sessions
- n>1 MySOP observation sessions
- n>1 HHC audits, some finished, some still in progress

==============
Simulation depth:
==============
- Scenarios without internet access should _not_ be simulated by simply activating flight mode. Prefer simulations that are closer to real-world behavior, such as cutting off Wi‑Fi connectivity.
- Ideally, the simulation should reflect situations like being out of Wi‑Fi range, which is common in customer environments. For example, in a hospital setting users may repeatedly move between online and offline areas as Wi‑Fi coverage is scattered across the campus.
- Cellular connection: Tests should run with Wi‑Fi only, to avoid false negatives when WiFi and Cellular are both "conditioned".
- Our software reacts differntly beween the conditions: No WiFi, Slow WiFi (incl. connected via 0 bit/s), Normal WiFi
  Simularing No WiFi can best be done by really making the whole WiFi network invisible. Because a visible network with 0 bit/s is less the customer situation and an invisible network is the common case.

==============
Gherkin tags:
==============
Please treat these tags as a starting point for brainstorming, not as a rigid or final specification. They were defined from a product perspective rather than a deep technical one.

When multiple stressors are active, ensure that all resulting states are exercised. For example, an app restart (@app_restart_stress) may occur while the network is slow (@wifi_toggler_throttle).
It is acceptable if the random stressor frequencies (see below) are configured such that, over time, all relevant combinations naturally occur—for instance by using prime-number-based intervals.
Alternatively, a deterministic approach is also perfectly fine, provided it reliably covers all states that would eventually emerge from an “over-time, catch-every-combination” strategy.

@repeat(n)
Repeat n times. (As mentioned before, feel free to update the specification, adapt n whereever this is a step forward.)

@wifi_down
At scenario start, no Wi‑Fi connection is available. When more wifi tags are available, this indicates that wifi is down at the beginning.

@wifi_down_after_actions(n)
After n actions (e.g. after n photos/observations/comments) disconnect the WiFi.

@wifi_up
At scenario start, Wi‑Fi is available. When more wifi tags are available, this indicates that wifi is present at the beginning.

@wifi_up_after_actions(n)
After n actions (e.g. after n photos/observations/comments) connect the WiFi again.

@wifi_toggler_offline
Randomly toggles between online and offline states during execution.
The goal is to introduce realistic instability without completely breaking the test. A tentative idea is an average cycle time of ~20 seconds with random variation.

@wifi_toggler_throttle
Similar to @wifi_toggler_offline, but toggles between full bandwidth and strongly reduced bandwidth instead of full disconnection.
This aims to simulate poor Wi‑Fi conditions, such as being at the edge of coverage. The exact throttling level still needs tuning; an initial idea is ~1 kbit/s, subject to validation against real‑world behavior.

@dim_screen_stress
Similar to the wifi togglers, in random intervals the screen is dimmed (e.g. side button on apple devices).

@app_restart_stress
Similar to the dim screen stress, in random intervals the iOS task manager is accessed and the app is restarted. (Simulating most of all device restarts and the "battery empty" scenario.)

@wifi_down_during_the_audit
The wifi is up until the app is logged in. Right after the login, the system goes offline and remains offline during the whole audit. When the audit is finished and the user has just went back to the audit list, the system goes online again.

@wifi_down_during_the_observation
Same as wifi_down_during_the_audit but in My Hygiene SOP and Observe the corrent term is "observation".

@android
Android device, preferably Samsung

@ios
Apple device

@phone
Mobile phone device

@tablet
Tablet device
