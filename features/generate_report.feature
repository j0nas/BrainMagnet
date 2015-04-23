Feature: Reviewing reports
  As a patient or the therapist assigned to a patient
  In order to review this patient's progress
  I want to generate a report spanning a timeline

  Background:
    Given the patient's name is "Alice"
    And the assigned therapist's name is "Bob"
    And the unassigned therapist's name is "Johnny"
    And another patient is named "Paul"
    And the patient has entered data the past week

    Scenario: Patient views report
      Given the patient is logged in to the dashboard
      When the patient clicks "View last week"
      Then the report should be shown

    Scenario: A legitimate user wants to view the report
      Given the report is attempted viewed
      When the report does not exist
      Then the report should be generated
      And the report should be shown

    Scenario: The unassigned therapist views reports
      Given the unassigned therapist is logged in to the dashboard
      When the unassigned therapist views a list of reports
      Then they should see all reports from their patient
      But not "Alice"'s reports

    Scenario: "Paul" views reports
      Given "Paul" is logged in to the dashboard
      When "Paul" views his reports
      Then "Alice"'s reports should not be visible