Feature: Interact with the most important parts of HHC in a longer user flow as a smoke test over one module.

# Note: The video is not a precise test specificaion, it is more meant for giving you an idea on how to use the system. Basically we try to use all features and to put stress on the system. Stress can be made by not following a linear perfect user flow, but instead by deleting data again, retrying things (as a user), editing old records. Behave chaotic and do a lot. It is esp. important to create a diverse set of quick comments, because this will be checked mathematically later.

# Note: For the mathematical checking ("quantitative evaulation makes sense") you will need to get access to the mathematical specification. Imho it's not needed to double the mathematical logic as code to your test suite (unless you want to). It can be sufficient to manually calculate the desired value and then to hardcode e.g. "69%". The whole mathematical topic will be covered by math.feature

 @wifi_up
 Scenario: As a smoke test interact with the most important features by executing a typical audit, on the mobile and the web device.
 When The full user flow roughly like recorded in "SmokeTestHHC.mp4" is executed, i.e. taking/changing/deleting a lot of images (or imageless records) And the usage flow switches from PC to tablet back to PC again (see video) And creating 100 records this way And creating a diverse set of quick comments
 Then the system behaves as specified And the quantiative evaluation makes sense And all photos are shown in the Word export

 @wifi_down_during_the_audit
 Scenario: As a smoke test interact with the most important features by executing a typical audit, on the mobile and the web device.
 When The full user flow roughly like recorded in "SmokeTestHHC.mp4" is executed, i.e. taking/changing/deleting a lot of images (or imageless records) And the usage flow switches from PC to tablet back to PC again (see video) And creating 100 records this way And creating a diverse set of quick comments
 Then the system behaves as specified And the quantiative evaluation makes sense And all photos are shown in the Word export
