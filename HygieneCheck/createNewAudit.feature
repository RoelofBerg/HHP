Feature: Create a Hygiene Check questionnaire in the editor and verify that its configuration is correctly reflected throughout the audit workflow

  @ios
  @tablet
  @wifi_up
  Scenario: A questionnaire created in the Hygiene Check editor is correctly reflected in the mobile audit, browser evaluation and Word report

    Given the user creates a new Hygiene Check questionnaire in the browser-based editor with a unique name
    And the questionnaire contains different questions, answer types, themes, information texts and report texts

    When the user selects the newly created questionnaire for an audit on a mobile device
    Then all questions created in the editor are available in the audit
    And each question uses the answer type defined in the editor
    And the information shown via the information buttons matches the information defined in the editor

    When the user answers the questions and finishes the audit
    And the audit data is synchronized
    And the user opens the audit evaluation in the browser
    Then all questions defined in the editor are represented in the evaluation
    And each question is shown with the correct question type

    When the user opens the audit list
    And exports the completed audit to MS Word
    Then the Word report contains the expected deviations and commented observations
    And the themes in the report match the themes defined in the editor
    And the question or report text matches the corresponding text defined in the editor
