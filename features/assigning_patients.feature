Feature: assigning patients
  In order to let my patient use the system
  As a therapist
  I want to register my patient and assign them to me

  Background:
    Given I am a therapist
    And I am consulting a patient

  Scenario: registering existing patient
    Given that the patient is already registered
    And that patient is assigned to another therapist
    When I try to register the patient
    Then I am added to the patient's list of therapists

  Scenario: registering new patient
    Given that the patient is not registered
    When I try to register the patient
    Then The patient receives an email to choose a password
    And I am added to the patient's list of therapists

  Scenario: registering patient already registered to me
    Given that the patient is already registered
    And I am added to the patient's list of therapists
    When I try to register the patient
    Then I get a message telling me this person is already my patient

  Scenario: resetting a patient's password
    Given that the patient cannot remember their password
    And I am added to the patient's list of therapists
    When I reset the patient's password
    Then The patient receives an email to choose a password