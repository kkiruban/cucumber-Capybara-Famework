@Quotes_feature
Feature: All scenarios related to Quotes feature

  Background: Login to the Application
    Given I login to the "McAfee" application
    Then I able to see the logged in to "McAfee" application


  @Quote-001 @US-004345 @US-004363 @US-004358 @OpsMgr_Quote @OpsRep_Quote
  Scenario: US-004345 US-004363 US-004358 Create Quote
    When I search the "Opportunity" name
    Then I able to see the "Opportunity" search results
    When I click the "Opportunity" record
    Then I able to see the "Opportunity Detail" page
    When I click on "New Quote" button from "Opportunity Detail" page
    Then I able to see the "Quote Edit" page
    When I fill the all quote required fields
    And I click on "Save" button from new "Quote" page
    Then I able to see the "Quote Detail" page
    Then I able to see the quote created successfully
    And I able to see the "Quote Line Items" related section
    When I click on "Add Line Item" button from "Quote Detail" page
    And I select the "Standard Price Book" price book
    Then I able to see the "Find Products" page
    When I select the the products
    Then I should see Upsell/Cross-sell picklist value in quote line item layout
    And I should see "Upsell/Cross-Sell" field with read and write permission for Ops Manager and Ops Rep
    And I create the quote "Add Quote Line Items" record
    Then I able to see the "Quote Detail" page
    And I verify the "Start Sync" status from "Quote Detail" page
    And I click on the "Start Sync" button from "Quote Detail" page
    And I able to see the "Synchronize quote and opportunity" pop up window
    And I click on the "Sync" button in "Synchronize quote and opportunity" pop up window
    And I able to see the "Sync Complete" success message
    And I click on the "Done" button in "Sync Complete" pop up window
    Then I able to see the "Quote Detail" page