Feature: Show and interact with the list of available My Hygiene SOP observation sessions

 @wifi_up
 Scenario: SOP observation sessions are listed while online
 When user is in BM/SOP/Observation protocol
 Then a list of SOP observation session is shown
 
 @wifi_down
 Scenario: SOP observation sessions are not listed while offline
 When user is in BM/SOP/Observation protocol
 Then the list of SOP observation session can not be accessed
 
