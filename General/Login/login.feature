Feature: Login

 @ios
 @tablet
 @wifi_down
 Scenario: Logon while offline
 When User is on the login screen And the network is down
 Then A message is shown And the user credentials cannot be entered
 
 @ios
 @tablet
 @wifi_up
 Scenario: Logon while online
 When User is on the login screen And the network is up
 Then The user credentials can be entered And login is possible
 
 @ios
 @tablet
 @retry(5)
 @wifi_toggler_offline
 Scenario: Logon while network is unreliable
 When the user is on the login screen And the network toggles on and offline
 Then the credentials can only be entered while the system is offline And a message is shown when the system is offline
 
 @ios
 @tablet
 @wifi_up
 Scenario: Logon on the edge when the system goes offline in the moment the user presses login
 When the user is on the login screen And presses the login button And in this very moment the wifi goes offline
 Then the system behaves in a controlled way and does not crash
