Feature: Client dashboard
  In order to let my employees use the system
  As a manager of a psychological therapist's office
  I want to add therapists to my system

  Background:
    Given I have gotten access to the system

  Scenario:
    Given I have logged in before
    When I log in
    Then I should be taken to the dashboard
    But I should not be asked to change my password

  Scenario:
    And I am logged in
    When I go to the therapists dashboard
    Then I should see a list of my registered therapists

  Scenario:
    Given I am logged in
    When I add a new therapist
    Then that therapist should receive an email containing a username and password