@mcafee @Opportunity_Product
Feature:
  In order to validate Contact section
  As a tester
  I should validate the functionalities as per test case

 Background:
    Given I should navigate to opportunity tab in saleforce application

@US-004278 @om-opp-product @or-opp-product @sm-opp-product @sr-opp-product @so-opp-product
  Scenario: US-004278 Add fields to Opportunity Product page layout    
    When I search existing opportunity and click
    Then I should see content "Opportunity Detail"
    When I click on any existing Opportunity Product
    Then I should see "New McAfee SFDC Opportunity" field with read and write permission for all except salesops user
    And I should see "Entitlement Node Count" field with read and write permission for all except salesops user
    And I should see "Entitlement Row ID" field with read and write permission for all except salesops user
    And I should see "New Entitlement Node Count" field with read and write permission for all except salesops user
    When I fill "Entitlement Node Count" with "10"
    And I fill "Entitlement Row ID" with "10"
    And I select "Renewal" from "Batch Type"
    And I click on "Save" button from top row

  @US-004339 @All_Users_Opportunity_Product
  Scenario: US-004278 Add fields to Opportunity Product page layout
    When I follow on "New" button
    And I select opportunity edit from record type of new record
    Then I should see content "New Opportunity"
    And I enter data to required fields under new opportunity section    
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
    And I enter start date field value
    And I enter end date field value
    And I enter quantity field value
    And I enter salse price field value
    And I click on "Save" button under add quote line items to page
    Then I should see content "Quote Detail"
    And I click on "Start Sync" button from top row
    And I click on "Sync" button
    And I click on "Done" button
    Then I should see content "Quote Detail"
    And I click on opportunity name link
    And I click on existing Opportunity Product
    And I click on "Edit" button from top row
    And I check that "Upsell/Cross-Sell" field is visible under product information section
    And I check that "Upsell/Cross-Sell" field is editable for all excepts SalesOps
    And I check that "Renewable Line Item ID" field is visible under Additional Information
    And I check that "Renewable Line Item ID" field is editable for only OpsRep and OpsMgr

  @US-004340 @All_Users_Opportunity_Product
  Scenario: US-004340 Added values for Upsell/Cross-sell
   When I follow on "New" button
    And I select opportunity edit from record type of new record
    Then I should see content "New Opportunity"
    And I enter data to required fields under new opportunity section
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
    And I enter start date field value
    And I enter end date field value
    And I enter quantity field value
    And I enter salse price field value
    And I click on "Save" button under add quote line items to page
    Then I should see content "Quote Detail"
    And I click on "Start Sync" button from top row
    And I click on "Sync" button
    And I click on "Done" button
    Then I should see content "Quote Detail"
    And I click on opportunity name link
    And I click on existing Opportunity Product
    And I click on "Edit" button from top row
    Then I should see content "Opportunity Product Edit"
    And I check "Upsell/Cross-Sell" picklist values