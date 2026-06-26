Feature: Execute a hygiene inspection as if somebody would walk through a hospital area with scattered WiFi availability

 @ios
 @tablet
 @wifi_up
 Scenario: Questionnaires can be edited while online
 When user is within a HHC audit
 Then the questionnaire can be operated And after returning to online the edits become visible in the browser app
 
 @ios
 @tablet
 @wifi_up
 Scenario: Photo based audits are possiible while being online
 When user is within a HHC audit
 Then 100 photos can be taken and annotated And after returning to online later the photos and annotations become visible in the browser app

 @ios
 @tablet
 @wifi_up
 Scenario: Photo based audits are limited to 100 photos while online
 When user is within a HHC audit that has 100 photos And tries to take another photo
 Then it is not possible to take photo no. 101

 @ios
 @tablet
 @wifi_down
 Scenario: Questionnaires can be edited while offline
 When user is within a HHC audit
 Then the questionnaire can be operated And after returning to online the edits become visible in the browser app
 
 @ios
 @tablet
 @wifi_down
 Scenario: Photo based audits are possiible while being offline
 When user is within a HHC audit
 Then 100 photos can be taken and annotated And after returning to online later the photos and annotations become visible in the browser app

 @wifi_down
 Scenario: Photo based audits are limited to 100 photos while offline
 When user is within a HHC audit that has 100 photos And tries to take another photo
 Then it is not possible to take photo no. 101
 
 @ios
 @tablet
 @repeat(10)
 @wifi_up
 @wifi_toggler_offline
 @wifi_toggler_throttle
 @dim_screen_stress
 @app_restart_stress
 Scenario: Questionnaires can be edited under intense external stress
 When user is within a HHC audit
 Then the questionnaire can be operated And after returning to online the edits become visible in the browser app
 
 @ios
 @tablet
 @repeat(5)
 @wifi_up
 @wifi_toggler_offline
 @wifi_toggler_throttle
 @dim_screen_stress
 @app_restart_stress
 Scenario: Photo based audits are synced under stress when the audit is ended by a powerdown. (Nurse audits a ward, powers down on the ward, powers up when back in the office and wants to contrinue on the laptop.)
 When user takes and annotates 10 photos unser system stress And restarts the app instance (like a powercycle) And displays the audit list while being online until the cloud icon shows a green checkmark And immediately terminates the app when the green checkmark shows up in the cloud icon
 Then all photos and annotations become visible in the browser app

 @ios
 @tablet
 @repeat(5)
 @wifi_up
 @wifi_toggler_offline
 @wifi_toggler_throttle
 @dim_screen_stress
 @app_restart_stress
 Scenario: Photo based audits are synced under stress when the audit is ended by screen dim. (Nurse audits a ward, closes the lid or dims sthe scren, when back in the office the nurse wants to continue on the laptop.)
 When user takes and annotates 10 photos unser system stress And dims the screen And displays the audit list while being offline And goes online while the list is shown And immediately terminates the app when the green checkmark shows up in the cloud icon
 Then all photos and annotations become visible in the browser app

 @ios
 @tablet
 @repeat(10)
 @wifi_up
 @wifi_toggler_offline
 @wifi_toggler_throttle
 @wifi_down_after_actions(50)
 @dim_screen_stress
 @app_restart_stress
 Scenario: Photo based audits are synced when the recording happend under stress and when the last part of the audit happened offline, plus audit end by poweroff.
 When user takes and annotates 100 photos unser system stress (last 50 while offline) And afterwards the user closes the app And starts the app again while being online And displays the audit list And immediately terminates the app when the green checkmark shows up in the cloud icon
 Then all photos and annotations become visible in the browser app
 
 @ios
 @tablet
 @repeat(50)
 @wifi_up
 @wifi_toggler_offline
 @wifi_toggler_throttle
 @wifi_down_after_actions(50)
 @dim_screen_stress
 @app_restart_stress
 Scenario: Photo based audits are synced when the recording happend under stress and when the last part of the audit happened offline, plus audit end by screen dim.
 When user takes and annotates 100 photos unser system stress (last 50 while offline) And afterwards the user dims the screen And displays the audit list while being offline And goes online while the list is shown And immediately terminates the app when the green checkmark shows up in the cloud icon
 Then all photos and annotations become visible in the browser app

 @ios
 @tablet
 @repeat(2)
 @wifi_up
 @wifi_toggler_offline
 Scenario: The HHC sync processes recovers from sudden offline conditions.
 When 100 photos have been taken while being offline (wo system stress) And the user displays the audit list And the user goes online again And offline conditions disturb the transmission that can not be recovered by tcp/ip (offline time > tcp ip timeout)
 Then all photos and annotations become visible in the browser app

 @ios
 @tablet
 @repeat(2)
 @wifi_up
 @wifi_toggler_throttle
 Scenario: The HHC sync processes recovers from system stress.
 When 100 photos have been taken while being offline (wo system stress) And the user displays the audit list And the user goes online again And slow network conditions disturb the following sync operation
 Then all photos and annotations become visible in the browser app

 @ios
 @tablet
 @repeat(2)
 @wifi_up
 @dim_screen_stress
 @app_restart_stress
 Scenario: The HHC sync processes recovers from system stress.
 When 100 photos have been taken while being offline (wo system stress) And the user displays the audit list And the user goes online again And screen dims plus app restarts disturb the following sync operation
 Then all photos and annotations become visible in the browser app

 @ios
 @tablet
 @wifi_up
 @memory_almost_full_ram
 Scenario: When the available random access memory is full, the app does not just crash and/or loose images (online case)
 When In a running audit photos are taken until the RAM overflows (needs to happen before the max of 100 images is reached)
 Then the system behaves in a controlled way, instead of random crashing And all photos and annotations that were made until this point (maybe except the very last one) become visible in the browser app.

 @ios
 @tablet
 @wifi_down
 @memory_almost_full_ram
 Scenario: When the available random access memory is full, the app does not just crash and/or loose images (offline case)
 When In a running audit photos are taken until the RAM overflows (needs to happen before the max of 100 images is reached) And the user goes online
 Then the system behaves in a controlled way, instead of random crashing And all photos and annotations that were made until the ressource shortage (maybe except the very last one) become visible in the browser app.

 @ios
 @tablet
 @wifi_up
 @memory_almost_full_persistent
 Scenario: When the available persistent storage space is full, the app does not just crash and/or loose images (online case)
 When In a running audit photos are taken until the persistent storage overflows (needs to happen before the max of 100 images is reached)
 Then the system behaves in a controlled way, instead of random crashing And all photos and annotations that were made until this point (maybe except the very last one) become visible in the browser app.

 @ios
 @tablet
 @wifi_down
 @memory_almost_full_persistent
 Scenario: When the available persistent storage space is full, the app does not just crash and/or loose images (offline case)
 When In a running audit photos are taken until the persistent storage overflows (needs to happen before the max of 100 images is reached) And the user goes online
 Then the system behaves in a controlled way, instead of random crashing And all photos and annotations that were made until the ressource shortage (maybe except the very last one) become visible in the browser app.
