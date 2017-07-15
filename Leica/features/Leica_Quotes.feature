@leica @Quotes
Feature:
  In order to validate Opportunities section
  As a tester
  I should validate the functionalities as per test case

  Background:
    Given I should navigate to "Opportunities" tab in saleforce application

  @Quote-001 @Operation-Rep-Quotes @Operation-Manager-Quotes
  Scenario: Quote-001 Create Quote
    When I click on new button
    And I select opportunity edit from record type of new record
    Then I should see content "New Opportunity"
    And I enter data to all mandatory fiels under new opportunity section
    And I click on "Save" button from top row
    Then I should see content "Opportunity Detail"
    And I click on new quote button under quotes section
    Then I should see content "New Quote"
    And I enter value to mandatory fields under new quote section
    And I wait for 5 seconds
    And I click on "Save" button from top row
    Then I should see content "Quote Detail"
    When I click on add line items button under quote line items section
    And I select existing product name
    And I clik on select button
#    And I enter start date field value
#    And I enter end date field value
    And I enter quantity field value
    And I enter salse price field value
    And I click on "Save" button under add quote line items to page
    Then I should see content "Quote Detail"
    And I click on "Start Sync" button from top row
    And I click on "Sync" button
    And I click on "Done" button
    Then I should see content "Quote Detail"

  @US-004285 @Sales-Rep-Quotes @Sales-Manager-Quotes @Operation-Rep-Quotes @Operation-Manager-Quotes
  Scenario: US-004285 Create Quote
    When I click on new button
    And I select opportunity edit from record type of new record
    Then I should see content "New Opportunity"
    And I enter data to all mandatory fiels under new opportunity section
    And I click on "Save" button from top row
    Then I should see content "Opportunity Detail"
    And I click on new quote button under quotes section
    Then I should see content "New Quote"
    And I enter value to mandatory fields under new quote section
    And I wait for 5 seconds
    And I click on "Save" button from top row
    Then I should see content "Quote Detail"
    And I click on "Edit" button from top row
    And I check that "Local Currency Code" field is visible or not
    And I check that "Local Currency Code" field is editable for all users excepts SalesOps
    And I check local currency code picklist value
    And I click on "Save" button from top row
    And I check that "Local Currency" field is visible or not
