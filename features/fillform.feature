Feature: Filling out the forms
  As a bipolar patient
  I want to fill out my daily form
  In order to better understand my mood

  Background:
    Patients should be able to fill in details into their forms on a daily basis. They shouldn't have to tell the system
    it's a new day or create their forms themselves; these should just exist. Given this scenario, the system must know
    when to present a new form, or pull up a form the user has already started.
    Given I am a patient

  Scenario: New day, new form
    Given I have not entered any details today
    When I go to the fill form page
    Then I am presented with a new form

  Scenario: Resuming form
    Given I entered details earlier today
    When I go to the fill form page
    Then I am presented with the form I filled earlier

  Scenario: Medications
    Given my therapist has prescribed 50mg Lamectal and 50mg Seroquel
    When I go to the fill form page
    Then the form should display 50mg Lamectal and 50mg Seroquel

  Scenario: Symptoms
    Given I entered dangerous symptoms
    When I try to save the form
    Then I should be asked to elaborate on these symptoms