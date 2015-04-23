Feature: a client buys access to the platform
  In order to more effectively treat bipolar patients
  As the manager of a psychological treatment centre
  I want to gain access to the platform

  Background:
    Given that I have lots of money
    And the platform can shut up and take my money

  Scenario:
    When I pay the provider
    Then The provider should send me and email containing a username and password

  Scenario:
    Given I have gotten access to the system
    And I have never logged in
    When I log in
    Then I should be asked to change my password

  Scenario Outline:
    Given that I have <patients>
    When I view pricing options
    Then I should see a pricing <options> that suits me
    And I should be shown at least one <price>

    Examples:
    TODO FILL OUT WITH ACTUAL VALUES
      | patients | options    | price      |
      | 10       | 10, 20, 30 | 10, 20, 30 |
      | 20       | 20, 30     | 20, 30     |
      | 30       | 30         | 30         |

