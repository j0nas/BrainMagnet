Feature: Reviewing reports
  As a patient or the therapist assigned to a patient
  In order to review this patient's progress
  I want to generate a report spanning a timeline

  Background:
    Given the patient's name is "Alice"
    And "Alice"'s assigned therapist's name is "Bob"
    And an unassigned therapist's name is "Johnny"
    And another patient is named "Paul"
    And "Alice" has entered data the past week

    Scenario: Patient views report
      Given "Alice" is logged in to the dashboard
      When "Alice" clicks "View last week"
      Then "Alice"'s report should be shown

    Scenario: A legitimate user wants to view the report
      Given the report is attempted viewed
      When the report does not exist
      Then the report should be generated
      And the report should be shown

    Scenario: The unassigned therapist views reports
      Given "Johnny" is logged in to the dashboard
      When "Johnny" views a list of reports
      Then "Johnny" should see all reports from their patients
      But "Johnny" should not see "Alice"'s reports

    Scenario: "Paul" views reports
      Given "Paul" is logged in to the dashboard
      When "Paul" views his reports
      Then "Paul" should see his reports
      But "Alice"'s reports should not be visible