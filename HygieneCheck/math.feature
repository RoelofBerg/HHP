Feature: Test the mathematical formulas of the Hygiene Check data evaluation

#Note: Our mobot.io tests focus on environmental stress (e.g. network issues, task manager, reboots, screen dimming), not on full state‑machine or edge‑case testing, as these are covered by our conventional test suite. While unit tests for mathematical formulas exist, this area remains a QA weak spot. Therefore, please test mathematical scenarios and edge cases here as an additional safety net. We give you access to the formulas and we need a smart head who detects the relevant edge cases and extends this specification (maybe AI can speed this up).

#Note: For being able to filter one specific set of audits in the evaluation a combination of date and ward can be used, when every relevant set uses one ward. Alternatively records that would be disturbing can be deleted in "Evaluation / Hygiene Check / Individual Data".

 @wifi_up
 Scenario: HHC / Evaluation / Quick Comment Analysis outputs the ratio of comment appearances in a set of audits
 When Three HHC audits are created in the app with a few image-less records And in one of the audit a certain quick comment is selected one time And in another audit this quick comment is selected two times
 Then in the browser the HHC evaluation "Quick Comments Analysis " of this three audits shows 66% appearance of this quick comment
 
 @wifi_up
 Scenario: HHC / Evaluation / Overall Compliance Score outputs the ratio of positive questionnaire answers
 When Three HHC audits are created in the app with a few image-less records And the questionnaire in use has only Yes/No/Partly/NA type questions And in one of the audit all questions are answered with "yes" And in another audit 30% of the questions are answered with "no" And in the third audit no question is answered at all 
 Then in the browser the HHC evaluation "Overall Compliance Score" of this three audits shows 75% compliance
