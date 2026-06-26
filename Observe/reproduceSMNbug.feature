Feature: Reproduce the technical issues that happen at "Swiss Medical Network" in the Observe screen

 @android
 @phone
 @wifi_up
 @repeat(30)
 Scenario: Users of the customer SMN do nothing special than starting a lot of observations. And it fails. We don't know why, so we start by repeating what they do.
 When The user starts several subsequent observation sessions And for each session another another ward is selected And each session contains 4 observations. (Start Observation, select ward, create 4 observations, finish/leave, then start the next Observation on another ward, again 5 entries, then again start on any other ward, and so on ... as many sessions as specified by the "repeat" Gherkin parameter) 
 Then the system behaves as expected and especially the "next" And "continue" buttons behave as expected.

 @android
 @phone
 @wifi_up
 @repeat(10)
 Scenario: Users of the customer SMN sometimes do not see the sub occupation list after selecting an occupation, when doing Observe observations. We repeat this scenario to see if we can reproduce this issue.
 When The user starts several subsequent observation sessions, according to the "repeat" Gherkin parameter, And each session contains 10 observations, And for each observation another occupation and also another sub-occupation is selected, compared to the previous observation.
 Then the system behaves as expected and especially the sub occupation list is shown and populated after selecting a main occupation.
 