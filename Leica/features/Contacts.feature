Feature: Contacts
  In order to validate cases section
  As a tester
  I should validate the functionalities as per test case

  Background:
    #Given I should create new account record "Smoke_test_accounts_cases" as test data
    And I navigate to "Contacts" tab in salesforce application

  @Acc-001 @AllUser_Contacts
  Scenario: Create test contact
    When I follow on "New" button
    Then I should see content "New Contact"
    When I enter data in all the required field over new contact page
    And I click Save button from top button row
    Then The "Contact" record should save seccessfully
