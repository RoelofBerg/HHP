Feature: Logout

 @wifi_down
 Scenario: Logout while offline
 When User is logged in And the network is down And then the user selects logoff from the main menu
 Then the user is logged off
 
 @wifi_up
 Scenario: Logout while online
 When User is logged in And the network is up And then the user selects logoff from the main menu
 Then the user is logged off 