@login
Feature: Login
  In order to interact with my account
  As a Superdrug Mobile account holder
  I want to login to my account

@regression
  Scenario: Successful login
    Given the user is on the login page
    When the user submits valid login credentials
    Then the account holder is taken to their dashboard page

  Scenario: Unsuccessful login
    Given the user is on the login page
    When the user submits invalid login credentials
    Then the user is taken back to login page with a validation error