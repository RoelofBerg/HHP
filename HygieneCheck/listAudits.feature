Feature: Show and interact with the list of available audits

 @ios
 @tablet
 @wifi_down
 Scenario: Audits are listed while offline
 When user is in BM/Hygiene Check/Overview
 Then a list of audits is shown
 
 @ios
 @tablet
 @wifi_down
 Scenario: Audits can be continued while offline
 When user is in BM/Hygiene Check/Overview And there is at least one audit with the state "in progress"
 Then the first shown "in progress" audit can be opened/continued despite being offline