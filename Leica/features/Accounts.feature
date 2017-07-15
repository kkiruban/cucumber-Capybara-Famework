Feature: Accounts
  In order to validate cases section
  As a tester
  I should validate the functionalities as per test case

  Background:
#    Given I should create new account record "Smoke_test_accounts_avi" as test data
#    And I should create new opportunity record "Smoke-test-opportunity-for-avi" as test data
#    And I should create RLI for the opportuntiy "Smoke-test-opportunity-for-avi"
#    And I should create new asset record "Smoke-test-asset-avis" as test data
    And I navigate to "Accounts" tab in salesforce application

  @US-004283 @AllUser_Accounts
  Scenario: Account Object
    When I follow on "New" button
    Then I should see content "New Account"
    And I should verify "Accounts" entity field permission
    And I should see "Account Type" field picklist options
    When I enter data in all the required fields over Account edit page
    And I click Save button from top button row
    Then The "Accounts" record should save seccessfully
    And I should verify "Accounts" entity fields under expected section
    And I should see the field "Billing Address" with edit permission except for salesops role
    And I should see the field "Shipping Address" with edit permission except for salesops role
    And I should not see the "CSM" section over the page
#    And I should Verify the value in Number of Opps
#    And I should Verify the value in Number of RLIs
#    And I should Verify the value in Number of Assets

  @US-1111 
  Scenario: Account Object
    When find count
