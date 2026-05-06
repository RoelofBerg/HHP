Feature: Execute My Hygiene SOP observations as if somebody would walk through a hospital area with scattered WiFi availability

 @wifi_up
 Scenario: The ward and occupation can be selected for a new SAP observation while online
 When user is on BM/SOP/New observation
 Then the drop down element with the ward list is populated with the available wards And the drop down with the professional cathegory and sub-cathegory (if the sub-cathegory option is active for the given hospital is populated as well.

 @wifi_down
 Scenario: The ward and occupation can be selected for a new SAP observation while offline
 When user is on BM/SOP/New observation
 Then the drop down element with the ward list is populated with the available wards And the drop down with the professional cathegory and sub-cathegory (if the sub-cathegory option is active for the given hospital is populated as well.

 @wifi_up
 Scenario: The procedure to be observed can be selected for a new SAP observation while online
 When user passed the first view on BM/SOP/New observation, where ward and occupation are selected And sees the list of SOPs available for observation
 Then the list is populated with observeable SOPs.

 @wifi_down
 Scenario: The procedure to be observed can be selected for a new SAP observation while offline
 When user passed the first view on BM/SOP/New observation, where ward and occupation are selected And sees the list of SOPs available for observation
 Then the list is populated with observeable SOPs And the list equals the list for the online case

 @wifi_down
 Scenario: The SOP observation view can be started while offline
 When user started an SOP via BM/SOP/New observation, selected ward, occupation and the SOP to be observed
 Then the SOP observation screen shows up And images are selectable And sub-procedures unfold upon selection And all buttons are functioning as expected And sending comments is possible

 @wifi_up
 @wifi_toggler_offline
 @wifi_toggler_throttle
 @wifi_down_after_actions(10)
 @dim_screen_stress
 @app_restart_stress
 Scenario: SOP Observations can be recorded under system stress
 When user is on the My Hygiene SOP observation screen And selects most of the images (not all). mostly in ascending order (with exceptions) And the connectivity and system are stressed And finishes the observation And goes online
 Then The SOP observation is fully stored And an an evaluation in the WebApp indicates that the observation has been processed correctly

 @repeat(20)
 @wifi_up
 @wifi_toggler_offline
 @wifi_toggler_throttle
 @wifi_down_after_actions(10)
 @dim_screen_stress
 @app_restart_stress
 Scenario: SOP Observations can be recorded under system stress
 When user is on the My Hygiene SOP observation screen And selects most of the images (not all). mostly in ascending order (with exceptions) And the connectivity and system are stressed And finishes the observation And goes online
 Then The SOP observation is fully stored And an an evaluation in the WebApp indicates that the observation has been processed correctly

 @wifi_up
 @memory_almost_full_ram
 Scenario: When the available random access memory is full, the app does not just crash and/or loose observations (online case)
 When In a running audit SOP observations are made until the RAM overflows
 Then the system behaves in a controlled way, instead of random crashing And all SOP observations that were made until this point (maybe except the very last one) become visible in the browser app.

 @wifi_down
 @memory_almost_full_ram
 Scenario: When the available random access memory is full, the app does not just crash and/or loose observations (offline case)
 When In a running audit SOP observations are made until the RAM overflows And the user goes online
 Then the system behaves in a controlled way, instead of random crashing And all SOP observations that were made until the ressource shortage (maybe except the very last one) become visible in the browser app.

 @wifi_up
 @memory_almost_full_persistent
 Scenario: When the available persistent storage space is full, the app does not just crash and/or loose observations (online case)
 When In a running audit SOP observations are made until the persistent storage overflows
 Then the system behaves in a controlled way, instead of random crashing And all SOP observations that were made until this point (maybe except the very last one) become visible in the browser app.

 @wifi_down
 @memory_almost_full_persistent
 Scenario: When the available persistent storage space is full, the app does not just crash and/or loose observations (offline case)
 When In a running audit SOP observations are made until the persistent storage overflows (needs to happen before the max of 100 images is reached) And the user goes online
 Then the system behaves in a controlled way, instead of random crashing And all SOP observations that were made until the ressource shortage (maybe except the very last one) become visible in the browser app.
