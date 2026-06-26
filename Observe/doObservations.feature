Feature: Execute Observe observations as if somebody would walk through a hospital area with scattered WiFi availability

@ios
@tablet
@wifi_up
 Scenario: The ward can be selected for a new observation while online
 When user is on BM/Observe/New observation
 Then the drop down element with the ward list is populated with the available wards

@ios
@tablet
@wifi_down
 Scenario: The ward can be selected for a new observation while offline
 When user is on BM/Observe/New observation
 Then the drop down element with the ward list is populated with the available wards

 @ios
 @tablet
 @wifi_down
 Scenario: Observations can be started while offline
 When user is on BM/Observe/New observation And after choosing a ward the Continue button was selected
 Then Observe observation with the 5 moments selection shows up And all configured occupations and sub occupations are selectable And all configured quick comments are selectable

 @ios
 @tablet
 @repeat(50)
 @wifi_up
 @wifi_toggler_offline
 @wifi_toggler_throttle
 @wifi_down_after_actions(50)
 @dim_screen_stress
 @app_restart_stress
 Scenario: Observations can be recorded under system stress
 When user is on the Observe 5 moments observation screen And enters a 20 different observations And the connectivity and system are stressed
 Then All complete observations are stored And an evaluation on the WebApp shows all observations correctly

 @ios
 @tablet
 @wifi_up
 @memory_almost_full_ram
 Scenario: When the available random access memory is full, the app does not just crash and/or loose observations (online case)
 When In a running audit Observe observations are made until the RAM overflows
 Then the system behaves in a controlled way, instead of random crashing And all Observe observations that were made until this point (maybe except the very last one) become visible in the browser app.

 @ios
 @tablet
 @wifi_down
 @memory_almost_full_ram
 Scenario: When the available random access memory is full, the app does not just crash and/or loose observations (offline case)
 When In a running audit Observe observations are made until the RAM overflows And the user goes online
 Then the system behaves in a controlled way, instead of random crashing And all Observe observations that were made until the ressource shortage (maybe except the very last one) become visible in the browser app.

 @ios
 @tablet
 @wifi_up
 @memory_almost_full_persistent
 Scenario: When the available persistent storage space is full, the app does not just crash and/or loose observations (online case)
 When In a running audit Observe observations are made until the persistent storage overflows
 Then the system behaves in a controlled way, instead of random crashing And all Observe observations that were made until this point (maybe except the very last one) become visible in the browser app.

 @ios
 @tablet
 @wifi_down
 @memory_almost_full_persistent
 Scenario: When the available persistent storage space is full, the app does not just crash and/or loose observations (offline case)
 When In a running audit Observe observations are made until the persistent storage overflows (needs to happen before the max of 100 images is reached) And the user goes online
 Then the system behaves in a controlled way, instead of random crashing And all Observe observations that were made until the ressource shortage (maybe except the very last one) become visible in the browser app.
 