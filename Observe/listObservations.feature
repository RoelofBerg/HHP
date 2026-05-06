Feature: Show and interact with the list of available Observe observation sessions

 @wifi_up
 Scenario: Observation sessions are listed while online
 When user is in BM/Observe/Observation Protocol
 Then a list of observation session is shown
 
 @wifi_down
 Scenario: Observation sessions are not listed while offline
 When user is in BM/Observe/Observation Protocol
 Then the list of observation session can not be accessed
 
