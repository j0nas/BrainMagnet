Feature: Creating a form for a patient
  In order to make sure my patient has a personalized form
  As the therapist treating this patient
  I want to change which items are shown to the patient to fill out

  Background:
    Given I am a therapist named "Bob"
    And my patient is "Alice"

  Scenario: New patient
    Given "Bob" wants to add "Alice" to his patient list
    When "Bob" adds "Alice" to his patient list
    Then "Bob" sees a page to define "Alice"'s form
    And "Bob" can choose a layout definition
    And "Bob" can select items to display

  Scenario: Layouts
    When "Bob" defines a form
    Then "Bob" can add layouts containing pre-defined items

  Scenario: Adding medication
    Given "Bob" can select items to display
    When "Bob" adds medication
    Then "Bob" sees a list of existing medication
    And The medication list contains dosages and names
    And "Bob" can add more medication to the list

  Scenario: Updating patient's form
    Given "Alice" is an existing patient
    And "Bob" thinks "Alice"'s form should be revised
    When "Bob" views "Alice"'s form
    Then "Bob" should be able to add items
    And "Bob" should be able to edit items
    And "Bob" should be able to remove items