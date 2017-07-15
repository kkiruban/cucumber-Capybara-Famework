@mcafee @Opportunities
Feature:
  In order to validate Contact section
  As a tester
  I should validate the functionalities as per test case

 Background:
    Given I should navigate to opportunity tab in saleforce application

  @US-004281 @om-opp @or-opp @sm-opp @sr-opp
  Scenario: US-004281 Add fields and picklist values to Opportunity    
    When I click on new button
    And I select opportunity edit from record type of new record
    Then I should see content "New Opportunity"
    And I should see "Client Segment" field with read and write permission for all except salesops user
    And I should see "SMB Store" field with read and write permission for all except salesops user
    And I should see "Client Sub Region" field with read and write permission for all except salesops user
    And I should see "Client Theater" field with read and write permission for all except salesops user
    And I should see Business Line picklist values in create opportunity page
    And I should see Client Territory picklist values in create opportunity page
    And I should see Client Region picklist values in create opportunity page
    And I should see Client Theatre picklist values in create opportunity page
    When I fill all mandantory fields to create a new random opportunity
    And I click on "Save" button from top row

  @US-004343 @All_Users_Opportunity
  Scenario: US-004343 Add fields and update permissions
    When I click on new button
    And I select opportunity edit from record type of new record
    Then I should see content "New Opportunity"
    And I check that "Upsell/Cross-sell" field is visible or not
    And I check that "Upsell/Cross-sell" field is editable for all excepts SalesOps
    And I check "Upsell/Cross-sell" picklist values
    And I check that "Original Grant Number" field is visible under location and batch classification section
    And I check that "Original Grant Number" field is editable only for OpsRep and OpsMgr

    @US-004344 @All_Users_Opportunity
    Scenario: US-004344 Added "Commercial Named" to picklist for Client Segment
     When I click on new button
     And I select opportunity edit from record type of new record
     Then I should see content "New Opportunity"
     And I check Client Segment picklist values
