Feature: Sign Up
  In order to get an interview at Yammer
  As a candidate
  I want to be able to sign up

  Scenario: User signs up with valid data
    Given I am on the home page
    When I fill in "Name" with "John"
    And I fill in "Email" with "john@test.com"
    And I click "Join us!"
    Then I should see a notice message
    And I should have 1 candidate

  Scenario: User signs up with blank name
    Given I am on the home page
    When I fill in "Email" with "john@test.com"
    And I click "Join us!"
    Then I should see an alert message
    And I should see a "can't be blank" notice under "Name"
    And I should have 0 candidates

  Scenario: User signs up with blank email address
    Given I am on the home page
    When I fill in "Name" with "John"
    And I click "Join us!"
    Then I should see an alert message
    And I should see a "can't be blank" notice under "Email"
    And I should have 0 candidates

  Scenario: User signs up with duplicate email address
    Given I am on the home page
    And I have already signed up
    When I fill in "Email" with the same value as before
    And I click "Join us!"
    Then I should see an alert message
    And I should see a "has already been taken" notice under "Email"
    And I should have 1 candidate

  @javascript
  Scenario: User with JS enabled signs up with valid data
    Given I am on the home page
    When I fill in "Name" with "John"
    And I fill in "Email" with "john@test.com"
    And I click "Join us!"
    Then I should see a notice message
    And I should have 1 candidate

  @javascript
  Scenario: User with JS enabled signs up with blank name
    Given I am on the home page
    When I fill in "Email" with "john@test.com"
    And I click "Join us!"
    Then I should see an alert message
    And I should see a "can't be blank" notice under "Name"
    And I should have 0 candidates

  @javascript
  Scenario: User with JS enabled signs up with blank email address
    Given I am on the home page
    When I fill in "Name" with "John"
    And I click "Join us!"
    Then I should see an alert message
    And I should see a "can't be blank" notice under "Email"
    And I should have 0 candidates

  @javascript
  Scenario: User with JS enabled signs up with duplicate email address
    Given I am on the home page
    And I have already signed up
    When I fill in "Email" with the same value as before
    And I click "Join us!"
    Then I should see an alert message
    And I should see a "has already been taken" notice under "Email"
    And I should have 1 candidate
