Feature: Test the mathematical formulas of the Observe data evaluation

#Note: See notes section of HygieneCheck/math.feature on top of the file. If you choose to delete for distinguishing the distinct data for one test, Observe also has an "Individual Data" section for deleting recotds.

@ios
@tablet
@wifi_up
 Scenario: HHC / Observe / Total rate outputs the correct overall compliance rate of an observation session
 When Three Observe sessions are created in the app And in one of the sessions 50% of all moments are assigned to a hand disinfection And in the second session all moments are assigned to "missed" And in this second session different selections for the gloves button and the No ABHR button are made And in the third session 80% of all moments are assigned to a hand disinfection (and 20% to "missed") And of the available occupations randomly (or semi randomly, but not simple rotation) occupations and sub-occupations are selected
 Then in the browser the Observe evaluation "Total Rate - Overall Compliance" of this three audits shows 40% compliance
 