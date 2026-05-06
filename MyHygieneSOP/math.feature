Feature: Test the mathematical formulas of the My Hygiene SOP data evaluation

#Note: See notes section of HygieneCheck/math.feature on top of the file. If you choose to delete for distinguishing the distinct data for one test, My Hygiene SOP also has an "Individual Data" section for deleting recotds.

 @wifi_up
 Scenario: HHC / My SOP / Process compliance outputs the correct compliance rate
 When Three My Hygiene SOP sessions are created in the app And in one of the sessions all images that have a gray background are selected, while the others remain unselected And in the second session 25% of the gray backgound images are selected while the others remain unselected And in the third session two images that do not have a grey background are selected while all other images - also all grey images - remain unselected.
 Then in the browser the My Hygiene SOP evaluation "Total Rate - Overall Compliance" of this three audits shows 41,6% compliance
 
 @wifi_up
 Scenario: HHC / My SOP / Process compliance outputs the correct compliance rate when the No Sterility button is used
 When Two My Hygiene SOP sessions are created in the app And in both of them 50% of the grey backgrounded images are selected And in one of them the "No Sterility" button is used right after a grey image has been selected.
 Then in the browser the My Hygiene SOP evaluation "Total Rate - Overall Compliance" of this three audits shows 25% compliance
 