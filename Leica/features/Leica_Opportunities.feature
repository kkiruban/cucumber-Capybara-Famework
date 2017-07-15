@leica @Opportunities
Feature:
  In order to validate Opportunities section
  As a tester
  I should validate the functionalities as per test case

 Background:
    Given I should navigate to "Opportunities" tab in saleforce application

 @US-004284 @Operation-Rep-Opportunities @Operation-Manager-Opportunities
 Scenario: US-004284 Opportunity object
  When I click on new button
  And I select opportunity edit from record type of new record
  Then I should see content "New Opportunity"
  And I check that "Number of RLIs under an Opportunity" field is visible or not
  And I check that "Stage Insight" field is visible or not
  And I check that "Stage Insight" field is editable for all users excepts SalesOps
  And I select "Not Contacted" option from "Stage" picklist
  And I check Stage Insight picklist value after selecting Not Contacted from stage picklist
  And I select "Contacted" option from "Stage" picklist
  And I check Stage Insight picklist value after selecting Contacted from stage picklist
  And I select "Quote Delivered" option from "Stage" picklist
  And I check Stage Insight picklist value after selecting Quote Delivered from stage picklist
  And I select "Customer Commitment" option from "Stage" picklist
  And I check Stage Insight picklist value after selecting Customer Commitment from stage picklist
  And I check that "Renewal Type" field is visible or not
  And I check that "Renewal Type" field is read only for all users
  And I check Renewal Type picklist value
  And I check Business Line picklist value
  And I check Client Region picklist value
  And I check Client Territory picklist value
  And I check Opportunity Type picklist value
  And I check Renewal Currency picklist value
  And I enter data to all mandatory fiels under new opportunity section
  And I click on "Save" button from top row
  Then I should see content "Opportunity Detail"
  And I check that "Client Company ID" field is visible under Location and Batch Classification
  And I check that "Client Company ID" field is read only for all users under Location and Batch Classification
#  When I should navigate to "Opportunities" tab
#  Then I should see content "Opportunities Home"
  And I click on New Renewable Line Item button
  Then I should see content "Opportunity Detail"
  And I enter data to all mandatory fields under Renewable Line Item
  And I click on "Save" button from top row
  Then I should see content "Renewable Line Item Detail"
  And I click on opportunity name link
  Then I check that the number of "Number of RLIs under an Opportunity" field matches the number of RLI in Renewable Line Item related section


 @US-004267 @All-Users-Opportunities
 Scenario: US-004267 Enable Multi-Currency
  When I click on new button
  And I select opportunity edit from record type of new record
  Then I should see content "New Opportunity"
  And I check that "Local Renewal Target" field is read only for all users

 @US-004320 @All-Users-Opportunities
 Scenario: US-004320 Use Channel Opportunity layout instead of standard
  When I click on new button
  And I select opportunity edit from record type of new record
  Then I should see content "New Opportunity"
  And I enter data to all mandatory fiels under new opportunity section
  And I click on "Save" button from top row
  Then I check that Partner Information section is visible
  And I click on "Add New Partner Opportunity" button under Partner Opportunities section
  Then I should see content "Add Partner Opportunity"
  And I enter all madatory field under new partner opportunity section
  And I click on "Grant Access" button under Add Partner Opportunity
  And I click on opportunity name link under Partner Opportunity
  Then I check that partner opportunity name is visible under Partner Opportunity related section

  
  