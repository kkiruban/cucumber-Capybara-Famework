Feature: Cases
  In order to validate cases section
  As a tester
  I should validate the functionalities as per test case

  Background:
    #Given I should create new account record "Smoke_test_accounts_cases" as test data
    #    And I should create new opportunity record "Smoke-test-opportunity-for-cases" as test data
    #    And I should create new opportunity record "Smoke-test-opportunity-Avi" as test data
    #    And I should create new contact record "Smoke_test_contact_cases" as test data
    And I navigate to "Cases" tab in salesforce application

  @Cases-001 @US-004327 @AllUser_cases
  Scenario: Case Types by Persona
    When I follow on "New" button
    Then I should see content "Select Case Record Type"
    And I should see the specific case type option for individual role

  @Cases-001 @US-004327 @AllUser_cases
  Scenario: @US-004276 Quote Request
    When I follow on "New" button
    When I select "Quote Request" from record type of new record
    Then I should see content "Case Edit"
    And I enter data in all the required field over "Quote Request" edit page
    And I select "Low" from "Priority" picklist
    And I click Save button from top button row
    Then The "Cases" record should save seccessfully
    And I capture the test case number
    And I should see "NALA 48hrs ALL CASES" in Case Milestones section
    And I should see "2880" in Case Milestones section

  @Cases-001 @AllUser_cases
  Scenario: @US-004276 Quote Request
    When I follow on "New" button
    When I select "Booking Request" from record type of new record
    Then I should see content "Case Edit"
    And I enter data in all the required field over "Booking Request" edit page
    And I select "Normal" from "Priority" picklist
    And I click Save button from top button row
    Then The "Cases" record should save seccessfully
    And I capture the test case number
    And I should see "NALA 24hrs ALL CASES" in Case Milestones section
    And I should see "1440" in Case Milestones section

  @Cases-001 @AllUser_cases
  Scenario: @US-004276 Quote Request
    When I follow on "New" button
    When I select "Data Processing Request" from record type of new record
    Then I should see content "Case Edit"
    And I enter data in all the required field over "Data Processing Request" edit page
    And I select "High" from "Priority" picklist
    And I click Save button from top button row
    Then The "Cases" record should save seccessfully
    And I capture the test case number
    And I should see "NALA 12hrs ALL CASES" in Case Milestones section
    And I should see "720" in Case Milestones section

  @Cases-001 @US-004327 @Admin @Ops_Mgr @Ops_Rep @Sales_Ops
  Scenario: @US-004276 Quote Request
    When I follow on "New" button
    When I select "Reporting Request" from record type of new record
    Then I should see content "Case Edit"
    And I enter data in all the required field over "Reporting Request" edit page
    And I select "Low" from "Priority" picklist
    And I click Save button from top button row
    Then The "Cases" record should save seccessfully
    And I capture the test case number
    And I should see "NALA 48hrs ALL CASES" in Case Milestones section
    And I should see "2880" in Case Milestones section

  @Cases-001 @US-004327 @Sales_Mgr @Sales_Rep
  Scenario: @US-004276 Quote Request
    When I follow on "New" button
    When I select "Reporting Request" from record type of new record
    Then I should see content "Case Edit"
    And I enter data in all the required field over "Reporting Request" edit page
    And I select "Low" from "Priority" picklist
    And I click Save button from top button row
    Then The "Cases" record should save seccessfully
    And I capture the test case number
    And I should see "NALA 48hrs ALL CASES" in Case Milestones section
    And I should see "2880" in Case Milestones section
    And I click Edit button from top button row
    And I check the "Request Escalation" checkbox
    And I enter "Testing" in "Escalation Reason" textarea field
    And I click Save button from top button row
    Then The "Cases" record should save seccessfully
    And I should not see lock icon next to edit button
    When I login as ops manager
    And Navigate to "Home" tab
    Then I clicked the case number from Items to Approve section
    And I enter "Testing" in "Comments" textarea field
    And I clicked "Approve" button over the page
    And I should not see lock icon next to edit button
    And I should see the HA NS meets approval criteria check box checked
    And I should see the checkbox checked for "Escalated" field
    And I should see "NALA 24hrs ALL CASES" in Case Milestones section
    And I should see "1440" in Case Milestones section

  @Cases-001 @AllUser_cases
  Scenario: @US-004276 Quote Request
    When I follow on "New" button
    When I select "Data Update Request" from record type of new record
    Then I should see content "Case Edit"
    And I enter data in all the required field over "Data Update Request" edit page
    And I select "House Account" from "Sub Case Type" picklist
    #Then I should see the "House Account" related option under "Renewal Status" picklist
    And I select first option from "Renewal Status" dropdown
    And I click Save button from top button row
    Then The "Cases" record should save seccessfully
    And I capture the test case number
    And I should see lock icon next to edit button

  @Cases-001-3 @AllUser_cases
  Scenario: @US-004276 Quote Request
    When I follow on "New" button
    When I select "Data Update Request" from record type of new record
    Then I should see content "Case Edit"
    And I enter data in all the required field over "Data Update Request" edit page
    And I select "House Account" from "Sub Case Type" picklist
    #Then I should see the "House Account" related option under "Renewal Status" picklist
    And I select first option from "Renewal Status" dropdown
    And I click Save button from top button row
    Then The "Cases" record should save seccessfully
    And I capture the test case number
    And I should see lock icon next to edit button

  @Cases-001-3 @AllUser_cases
  Scenario: @US-004276 Quote Request
    When I follow on "New" button
    When I select "Data Update Request" from record type of new record
    Then I should see content "Case Edit"
    And I enter data in all the required field over "Data Update Request" edit page
    And I select "House Account" from "Sub Case Type" picklist
    #Then I should see the "House Account" related option under "Renewal Status" picklist
    And I select first option from "Renewal Status" dropdown
    And I click Save button from top button row
    Then The "Cases" record should save seccessfully
    And I capture the test case number
    And I should see lock icon next to edit button
